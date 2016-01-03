/*****************************************************************************/
/* HT1080Z Emulator                                                          */
/*   main hardware emulation                                                 */
/*                                                                           */
/* Copyright (C) 2015 Laszlo Arvai                                           */
/* All rights reserved.                                                      */
/*                                                                           */
/* This software may be modified and distributed under the terms             */
/* of the BSD license.  See the LICENSE file for details.                    */
/*****************************************************************************/

/*****************************************************************************/
/* Includes                                                                  */
/*****************************************************************************/
#include <fileStandardFunctions.h>
#include <sysUserInput.h>
#include <sysVirtualKeyboardCodes.h>
#include <cpuZ80.h>
#include <emuHT1080.h>
#include <sysHighResTimer.h>
#include <sysConfig.h>
#include <sysTimer.h>
#include <appSettings.h>

#include <fbFileBrowser.h>

/*****************************************************************************/
/* Constants                                                                 */
/*****************************************************************************/
#define emuHT1080_MAX_CYCLES_PER_SCANLINE ((emuHT1080_CPU_CLK + emuHT1080_HSYNC_FREQ - 1)/ emuHT1080_HSYNC_FREQ) // rounded up
#define emuHT1080_KEYBOARD_ROW_COUNT 8
#define emuHT1080_SCANLINE_IN_US (1000000 / emuHT1080_HSYNC_FREQ)

#define emuPORT_FF_MOTOR_ON_MASK (1<<2)
#define emuPORT_FF_SIGNAL_MASK (3)

#define emuPORT_FF_INPUT_MASK (1<<7)

#define emuCAS_CLOCK_PERIOD_MAX 2500 // max clock period length in us for cassette signal analysis
#define emuCAS_CLOCK_PERIOD_MIN 1500 // min clock period length in us for cassette signal analysis

/*****************************************************************************/
/* Types                                                                     */
/*****************************************************************************/
typedef enum
{
	emuCS_Idle,

	// save states
	emuCS_SaveStart,
	emuCS_SaveWaitForMotorStart,
	emuCS_SaveWaitForClock,
	emuCS_SaveWaitForData,

	// load states
	emuCS_LoadStart,
	emuCS_LoadClock,
	emuCS_LoadData
} emuCASState;

/*****************************************************************************/
/* Local functions                                                           */
/*****************************************************************************/
static uint32_t cpuGetEllapsedTimeSince(uint32_t in_timestamp);
static uint32_t cpuGetEllapsedTimeSinceInMicrosec(uint32_t in_timestamp);
static uint32_t cpuGetTimestamp(void);

static void emuCASMotorOn(void);
static void emuCASMotorOff(void);
static void emuCASOut(uint8_t in_pulse);
static void emuCASIn(void);


/*****************************************************************************/
/* Module variables                                                          */
/*****************************************************************************/

// RAM
uint8_t g_ram[emuHT1080_RAM_SIZE];
uint8_t g_video_ram[emuHT1080_VIDEO_RAM_SIZE];
uint8_t g_keyboard_ram[emuHT1080_KEYBOARD_ROW_COUNT];

// CPU
cpuZ80State l_cpu;

// external ROM file reference
extern const unsigned char ht_s1_basic_rom[];
extern const unsigned char ht_s1_basicexpansion_rom[];
extern const unsigned char MODEL1_rom[];
extern const unsigned char level1_rom[];

// timing variables
static uint32_t l_total_cpu_cycles;
static int32_t l_current_cycles_per_frame;
static int l_current_scanline;

static sysHighresTimestamp l_current_timestamp;

// port mirror variables
static uint8_t l_out_port_ff = 0;
static uint8_t l_in_port_ff = 0;

// cassette save variables
static emuCASState l_cas_state = emuCS_LoadStart;
static uint8_t l_cas_buffer;
static uint8_t l_cas_buffer_bit_count = 0;
static fileStream* l_cas_file = sysNULL;
static uint32_t l_cas_clock_timestamp;
static bool l_cas_motor_on = false;

// emulation speed variables
static sysTimeStamp l_emulation_speed_timestamp;
static uint32_t l_emulation_speed_cpu_cycles;
static uint32_t l_emulation_speed_vsync_cycles;
static uint16_t l_emulation_speed_cpu_freq;
static uint16_t l_emulation_speed_vsync_freq;

///////////////////////////////////////////////////////////////////////////////
/// @brief Initializes HT1080Z Computer
void emuHT1080Initialize(void)
{
	uint16_t i;

  // Reset CPU
	cpuReset(&l_cpu);
  
  // Clears RAM
  for(i = 0; i < emuHT1080_RAM_SIZE; i++)
		g_ram[i] = 0;

	for (i = 0; i < emuHT1080_VIDEO_RAM_SIZE; i++)
		g_video_ram[i] = 32;

	// init emulation variables
	l_cas_motor_on = false;
	l_total_cpu_cycles = 0;
	l_current_cycles_per_frame = 0;
	l_current_scanline = 0;
	l_current_timestamp = sysHighresTimerGetTimestamp();
	l_emulation_speed_timestamp = sysTimerGetTimestamp();
	l_emulation_speed_cpu_cycles = 0;
	l_emulation_speed_vsync_cycles = 0;
	l_emulation_speed_cpu_freq = 0;
	l_emulation_speed_vsync_freq = 0;
}

///////////////////////////////////////////////////////////////////////////////
/// @brief Main emulation task
void emuHT1080Task(void)
{
	uint16_t cycles_to_execute;
	uint16_t cycles_executed;
	int32_t expected_cycle_per_frame;
	uint32_t emulaton_speed_time;
	bool full_speed = g_application_settings.FullSpeed || (l_cas_motor_on && g_application_settings.FastCassetteOperation);
	bool screen_refresh_disabled = (l_cas_motor_on && g_application_settings.FastCassetteOperation);

 	if (sysHighresTimerGetTimeSince(l_current_timestamp) >= emuHT1080_SCANLINE_IN_US || full_speed)
	{
		l_current_timestamp = sysHighresTimerGetTimestamp();

		// calculate cycles to execute
		expected_cycle_per_frame = (emuHT1080_CPU_CLK * (l_current_scanline + 1)) / emuHT1080_HSYNC_FREQ;
		cycles_to_execute = (uint16_t)(expected_cycle_per_frame - l_current_cycles_per_frame);

		// run CPU
		cycles_executed = cpuExecute(&l_cpu, cycles_to_execute);
		l_current_cycles_per_frame += cycles_executed;
		l_total_cpu_cycles += cycles_executed;

		// render scanline
		if (l_current_scanline < emuHT1080_SCREEN_HEIGHT_IN_PIXEL && !screen_refresh_disabled)
			emuHT1080RenderScanLine(l_current_scanline);

		// next scanline
		l_current_scanline++;
		if (l_current_scanline >= emuHT1080_TOTAL_SCANLINE_COUNT)
		{
			// VSYNC -> restart screen rendering
			l_current_scanline = 0;
			l_current_cycles_per_frame = 0;
			l_emulation_speed_vsync_cycles++;
		}
	
		// handle cas input
		if (l_cas_state >= emuCS_LoadStart)
			emuCASIn();

		// calculate emulation speed
		l_emulation_speed_cpu_cycles += cycles_executed;
		emulaton_speed_time = sysTimerGetTimeSince(l_emulation_speed_timestamp);
		if (emulaton_speed_time > 1000)
		{
			l_emulation_speed_vsync_freq = l_emulation_speed_vsync_cycles * 1000 / emulaton_speed_time;
			l_emulation_speed_cpu_cycles = l_emulation_speed_cpu_cycles / 1000 / emulaton_speed_time;

			l_emulation_speed_cpu_cycles = 0;
			l_emulation_speed_vsync_cycles = 0;

			l_emulation_speed_timestamp = sysTimerGetTimestamp();


		}
	}

#if 0
	uint8_t free_wave_buffer_index;

	// check if half frame time is ellapsed
	if(sysHighresTimerGetTimeSince(l_half_frame_timestamp) >= emuINVADERS_FRAME_TIME / 2)
	{
		l_half_frame_timestamp = sysHighresTimerGetTimestamp();

		if(l_current_scanline == 0)
		{
			// reset cycle counter
			l_cycles_per_frame = 0;

			// render the first half of the screen
			while(l_current_scanline  < emuINVADERS_SCREEN_WIDTH / 2)
			{
				// execute code
				l_cycles_per_frame += emuINVADERS_CYCLES_PER_LINE;
				l_cycles_per_frame -= cpuI8080Exec(&l_invaders_cpu, emuINVADERS_CYCLES_PER_LINE);

				// render scanline
				if(frame == 0)
					emuInvadersRenderScanLine(l_current_scanline);

				// next scanline
				l_current_scanline++;
			}

			// midscreeninterrupt
			cpuI8080INT(&l_invaders_cpu, cpuI8080_RST1);
		}
		else
		{
			// render the second half of the screen
			while(l_current_scanline  < emuINVADERS_SCREEN_WIDTH)
			{
				// execute code
				l_cycles_per_frame += emuINVADERS_CYCLES_PER_LINE;
				l_cycles_per_frame -= cpuI8080Exec(&l_invaders_cpu, emuINVADERS_CYCLES_PER_LINE);

				// render scanline
				if(frame == 0)
					emuInvadersRenderScanLine(l_current_scanline);

				// next scanline
				l_current_scanline++;
			}

			if(frame == 2)
			{
				frame = 0;
			}
			else
			{
	//			frame++;
			}


			// vsync interrupt
			cpuI8080INT(&l_invaders_cpu, cpuI8080_RST2);

			// execure code for the vsync
			if(l_cycles_per_frame < emuINVADERS_CYCLES_PER_FRAME)
			{
				cpuI8080Exec(&l_invaders_cpu, emuINVADERS_CYCLES_PER_FRAME - l_cycles_per_frame);
			}

			// first scanline
			l_current_scanline = 0;

			// refresh content of the screen
			guiRefreshScreen();
		}
	}

	// render audio stream
	free_wave_buffer_index = drvWavePlayerGetFreeBufferIndex();
	if(free_wave_buffer_index != waveMIXER_INVALID_CHANNEL)
	{
		waveMixerRenderStream(l_wave_mixer_info, drvWaveGetBuffer(free_wave_buffer_index), drvWAVEPLAYER_BUFFER_LENGTH);
		drvWavePlayerPlayBuffer(free_wave_buffer_index);
	}
#endif
}

#pragma region - Memory handling -
/****************************************************************************
* M E M O R Y   I N T E R F A C E
*
* 0000 +----------------------------------------+
*      | ROM (Basic interpreter)                |
* 3000 +----------------------------------------+
*      | ROM (Extension)                        |
* 3800 +----------------------------------------+
*      | Reserved for keyboard                  |
* 3C00 +----------------------------------------+
*      | Video display memory                   |
* 4000 +----------------------------------------+
*      | 16Kb RAM                               |
* 8000 +----------------------------------------+
*      | Expansion                              |
* FFFF +----------------------------------------+
*
****************************************************************************/

//--------------------------------------------------------------
// Memory write
//--------------------------------------------------------------
void cpuMemWrite(register uint16_t in_address, register uint8_t in_value)
{
	// write RAM
	if (in_address >= emuHT1080_RAM_START)
	{
		g_ram[in_address - emuHT1080_RAM_START] = in_value;
		return;
	}

	// write video ram
	if (in_address >= emuHT1080_VIDEO_RAM_START)
	{
		// character display
		if (in_value & 0xa0)
			in_value &= 0xbf;
		else
			in_value |= 0x40;
		
		//if (in_value < 32)
		//	in_value |= 0x40;

		g_video_ram[in_address - emuHT1080_VIDEO_RAM_START] = in_value;
		return;
	}

	// write to other area (e.g. ROM) is useless
}

//--------------------------------------------------------------
// Memory read
//--------------------------------------------------------------
uint8_t cpuMemRead(register uint16_t in_address)
{
	// read RAM
	if (in_address >= emuHT1080_RAM_START)
		return g_ram[in_address - emuHT1080_RAM_START];

	// read ROM
	if (in_address < emuHT1080_ROM_SIZE)
		return ht_s1_basic_rom[in_address];// MODEL1_rom[in_address]; //level1_rom[in_address];  ht_s1_basic_rom[in_address];

	if (in_address >= emuHT1080_KEYBOARD_START)
	{
		if (in_address >= emuHT1080_VIDEO_RAM_START)
		{
			// video RAM
			return g_video_ram[in_address - emuHT1080_VIDEO_RAM_START];
		}
		else
		{
			// keyboard
			switch (in_address)
			{
				case 0x3801:
					return g_keyboard_ram[0];

				case 0x3802:
					return g_keyboard_ram[1];

				case 0x3804:
					return g_keyboard_ram[2];

				case 0x3808:
					return g_keyboard_ram[3];

				case 0x3810:
					return g_keyboard_ram[4];

				case 0x3820:
					return g_keyboard_ram[5];

				case 0x3840:
					return g_keyboard_ram[6];

				case 0x3880:
					return g_keyboard_ram[7];
			}

			return 0;
		}
	}
	else
	{
		// expansion ROM
		return ht_s1_basicexpansion_rom[in_address - emuHT1080_EXTENSION_ROM_START];
	}
}
#pragma endregion

#pragma region - Port handing -
/******************************************************************************
* P O R T S
******************************************************************************/

//--------------------------------------------------------------
// Port read
//--------------------------------------------------------------
uint8_t cpuIn(register uint16_t in_port)
{
  uint8_t retval = 0xff;

  switch(in_port & 0xff)
  {
    case 0xff:
      retval = l_in_port_ff;
      break;
  }

  return retval;
}

//--------------------------------------------------------------
// Port write
//--------------------------------------------------------------
void cpuOut(register uint16_t in_port, register uint8_t in_value)
{
	switch (in_port & 0xff)
	{
		case 0xff:
			// check for motor state change
			if (((l_out_port_ff ^ in_value) & emuPORT_FF_MOTOR_ON_MASK) != 0)
			{
				// motor status changed, check new status
				if ((in_value & emuPORT_FF_MOTOR_ON_MASK) != 0)
				{
					emuCASMotorOn();
				}
				else
				{
					emuCASMotorOff();
				}
			}

			// check signal value
			if (((l_out_port_ff ^ in_value) & emuPORT_FF_SIGNAL_MASK) != 0)
			{
				if ((in_value & emuPORT_FF_MOTOR_ON_MASK) != 0)
				{
					emuCASOut(in_value & emuPORT_FF_SIGNAL_MASK);
				}
				else
				{
				}
			}

			// port write clears input value
			l_in_port_ff &= ~emuPORT_FF_INPUT_MASK;

			// store port value
			l_out_port_ff = in_value;
		break;

		case 0xfe:
		break;
	}
}
#pragma endregion

#pragma region - Keyboard handling -
/****************************************************************************
* K E Y B O A R D  I N T E R F A C E
*
* Keyboard matrix:
*       d7 d6 d5 d6 d3 d2 d1 d0
* 3801   G  F  E  D  C  B  A  @
* 3802   O  N  M  L  K  J  I  H
* 3804   W  V  U  T  S  R  Q  P
* 3808   -  -  -  -  -  Z  Y  X
* 3810  7' 6& 5% 4$ 3# 2" 1!  0
* 3820  /? .> -= ,< ;+ :* 9) 8(
* 3840  sp ri le dn up br cl en
* 3880  -  -  -  -  -  -  -  sh
*
****************************************************************************/

static bool l_shift_state = false;

typedef struct
{
	int Row;			//which byte in sg_keymatXlat
	int Bit;			//which bit in sg_keymatXlat
	int ShiftCtl;	//bitfield; 1 = shift, 2 = ctl
} KeyboardTableEntry;

static const KeyboardTableEntry l_keyboard_table[] =
{
	{ 3, 7  , 0 },	//(invalid) NUL
	{ 0, 2  , 2 },	//ctrl-A SOH
	{ 0, 4  , 2 },	//ctrl-B STX
	{ 0, 8  , 2 },	//ctrl-C ETX
	{ 0, 16 , 2 },	//ctrl-D EOT
	{ 0, 32 , 2 },	//ctrl-E ENQ
	{ 0, 64 , 2 },	//ctrl-F ACK
	{ 0, 128, 2 },	//ctrl-G BEL
	{ 1, 1  , 2 },	//ctrl-H BS
	{ 1, 2  , 2 },	//ctrl-I TAB
	{ 1, 4  , 2 },	//ctrl-J LF
	{ 1, 8  , 2 },	//ctrl-K VT
	{ 1, 16 , 2 },	//ctrl-L FF
	{ 1, 32 , 2 },	//ctrl-M CR
	{ 1, 64 , 2 },	//ctrl-N SO
	{ 1, 128, 2 },	//ctrl-O SI
	{ 2, 1  , 2 },	//ctrl-P DLE
	{ 2, 2  , 2 },	//ctrl-Q DC1
	{ 2, 4  , 2 },	//ctrl-R DC2
	{ 2, 8  , 2 },	//ctrl-S DC3
	{ 2, 16 , 2 },	//ctrl-T DC4
	{ 2, 32 , 2 },	//ctrl-U NAK
	{ 2, 64 , 2 },	//ctrl-V SYN
	{ 2, 128, 2 },	//ctrl-W ETB
	{ 3, 1  , 2 },	//ctrl-X CAN
	{ 3, 2  , 2 },	//ctrl-Y EM
	{ 3, 4  , 2 },	//ctrl-Z SUB
	{ 6, 8  , 1 },	//ESC
	{ 3, 7  , 0 },	//(invalid) FS
	{ 3, 7  , 0 },	//(invalid) GS
	{ 3, 7  , 0 },	//(invalid) RS
	{ 6, 2  , 0 },	//clear

	{ 6, 128, 0 },	//space
	{ 4, 2  , 1 },	//!
	{ 4, 4  , 1 },	//"
	{ 4, 8  , 1 },	//#
	{ 4, 16 , 1 },	//$
	{ 4, 32 , 1 },	//%
	{ 4, 64 , 1 },	//&
	{ 4, 128, 1 },	//'
	{ 5, 1  , 1 },	//(
	{ 5, 2  , 1 },	//)
	{ 5, 4  , 1 },	//*
	{ 5, 8  , 1 },	//+
	{ 5, 16 , 0 },	//,
	{ 5, 32 , 0 },	//-
	{ 5, 64 , 0 },	//.
	{ 5, 128, 0 },	///
	{ 4, 1  , 0 },	//0
	{ 4, 2  , 0 },	//1
	{ 4, 4  , 0 },	//2
	{ 4, 8  , 0 },	//3
	{ 4, 16 , 0 },	//4
	{ 4, 32 , 0 },	//5
	{ 4, 64 , 0 },	//6
	{ 4, 128, 0 },	//7
	{ 5, 1  , 0 },	//8
	{ 5, 2  , 0 },	//9
	{ 5, 4  , 0 },	//:
	{ 5, 8  , 0 },	//;
	{ 5, 16 , 1 },	//<
	{ 5, 32 , 1 },	//=
	{ 5, 64 , 1 },	//>
	{ 5, 128, 1 },	//?

	{ 0, 1  , 0 },	//@
	{ 0, 2  , 0 },	//A
	{ 0, 4  , 0 },	//B
	{ 0, 8  , 0 },	//C
	{ 0, 16 , 0 },	//D
	{ 0, 32 , 0 },	//E
	{ 0, 64 , 0 },	//F
	{ 0, 128, 0 },	//G
	{ 1, 1  , 0 },	//H
	{ 1, 2  , 0 },	//I
	{ 1, 4  , 0 },	//J
	{ 1, 8  , 0 },	//K
	{ 1, 16 , 0 },	//L
	{ 1, 32 , 0 },	//M
	{ 1, 64 , 0 },	//N
	{ 1, 128, 0 },	//O
	{ 2, 1  , 0 },	//P
	{ 2, 2  , 0 },	//Q
	{ 2, 4  , 0 },	//R
	{ 2, 8  , 0 },	//S
	{ 2, 16 , 0 },	//T
	{ 2, 32 , 0 },	//U
	{ 2, 64 , 0 },	//V
	{ 2, 128, 0 },	//W
	{ 3, 1  , 0 },	//X
	{ 3, 2  , 0 },	//Y
	{ 3, 4  , 0 },	//Z
	{ 6, 8  , 0 },	//up  ascii [
	{ 6, 16 , 0 },	//down ascii \ 
	{ 6, 32 , 0 },	//left ascii ]
	{ 6, 64 , 0 },	//right ascii ^
	{ 3, 7  , 0 },	//(invalid) _

	{ 3, 7  , 0 },	//(invalid) `
	{ 0, 2  , 1 },	//a
	{ 0, 4  , 1 },	//b
	{ 0, 8  , 1 },	//c
	{ 0, 16 , 1 },	//d
	{ 0, 32 , 1 },	//e
	{ 0, 64 , 1 },	//f
	{ 0, 128, 1 },	//g
	{ 1, 1  , 1 },	//h
	{ 1, 2  , 1 },	//i
	{ 1, 4  , 1 },	//j
	{ 1, 8  , 1 },	//k
	{ 1, 16 , 1 },	//l
	{ 1, 32 , 1 },	//m
	{ 1, 64 , 1 },	//n
	{ 1, 128, 1 },	//o
	{ 2, 1  , 1 },	//p
	{ 2, 2  , 1 },	//q
	{ 2, 4  , 1 },	//r
	{ 2, 8  , 1 },	//s
	{ 2, 16 , 1 },	//t
	{ 2, 32 , 1 },	//u
	{ 2, 64 , 1 },	//v
	{ 2, 128, 1 },	//w
	{ 3, 1  , 1 },	//x
	{ 3, 2  , 1 },	//y
	{ 3, 4  , 1 },	//Z
	{ 3, 7  , 0 },	//(invalid) {
	{ 3, 7  , 0 },	//(invalid) |
	{ 3, 7  , 0 },	//(invalid) }
	{ 3, 7  , 0 },	//(invalid) ~
	{ 3, 7  , 0 },	//(invalid) DEL
};

void emuHT1080UserInputEventHandler(uint8_t in_device_number, sysUserInputEventCategory in_event_category, sysUserInputEventType in_event_type, uint32_t in_event_param)
{
	bool pressed = (in_event_category == sysUIEC_Pressed); 
	const KeyboardTableEntry* entry = sysNULL;
	int keyboard_table_index = -1;

	//fbUserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);

	//return;

	// handle keyboard events
	if (in_event_type == sysUIET_Key && (in_event_category == sysUIEC_Pressed || in_event_category == sysUIEC_Released))
	{
		if (in_event_param >= sysVKC_A && in_event_param <= sysVKC_Z)
		{
			//these are simply their ascii values, but we also need to consider the shift state
			//note, we do not consider the caps lock state, because we treat
			//key as a special regular (oxymoron?) key (trs-80 does it via
			//shift-0)
			if (0/*bCtrl*/)	//ctl pressed; shift irrelevant
			{
				keyboard_table_index = in_event_param - 0x40;	//(as ctl key)
			}
			else if (l_shift_state)	//shift pressed
			{
				//XXX inverting 'shift' notion
				//keyboard_table_index = in_event_param;	//(as upper case)
				entry = &l_keyboard_table[in_event_param + 0x20];	//(as lower case)
			}
			else
			{
				//XXX inverting 'shift' notion
				//keyboard_table_index = in_event_param + 0x20;	//(as lower case)
				entry = &l_keyboard_table[in_event_param];	//(as upper case)
			}
		}
		else if (in_event_param >= '0' && in_event_param <= '9')
		{	//these are simply their ascii values, but need to consider shift state
			if (l_shift_state)
			{
				switch (in_event_param)
				{
				case '1': entry = &l_keyboard_table['\'']; break;
				case '2': entry = &l_keyboard_table['\"']; break;
				case '3': entry = &l_keyboard_table['+']; break;
				case '4': entry = &l_keyboard_table['!']; break;
				case '5': entry = &l_keyboard_table['%']; break;
				case '6': entry = &l_keyboard_table['/']; break;
				case '7': entry = &l_keyboard_table['=']; break;
				case '8': entry = &l_keyboard_table['(']; break;
				case '9': entry = &l_keyboard_table[')']; break;
				case '0': break;
				}
			}
			else
			{
				entry = &l_keyboard_table[in_event_param];
			}
		}
		else if (in_event_param >= sysVKC_NUMPAD0 && in_event_param <= sysVKC_NUMPAD9)
		{
			//bNumLock will cause other VK codes, so we don't need to process it
			//bShift
			entry = &l_keyboard_table[in_event_param - sysVKC_NUMPAD0 + '0'];
		}
		else if (in_event_param == sysVKC_SHIFT)
		{
			l_shift_state = (in_event_category == sysUIEC_Pressed);
		}
		else if (sysVKC_DIVIDE == in_event_param)
		{
			entry = &l_keyboard_table['/'];
		}
		else if (sysVKC_ADD == in_event_param)
		{
			entry = &l_keyboard_table['+'];
		}
		else if (sysVKC_SUBTRACT == in_event_param)
		{
			entry = &l_keyboard_table['-'];
		}
		else if (sysVKC_MULTIPLY == in_event_param)
		{
			entry = &l_keyboard_table['*'];
		}
		else if (sysVKC_DECIMAL == in_event_param)
		{
			entry = &l_keyboard_table['.'];
		}
		else if (sysVKC_ESCAPE == in_event_param)
		{
			entry = &l_keyboard_table[0x1b];
		}
		else if (sysVKC_SPACE == in_event_param)
		{
			entry = &l_keyboard_table[' '];
		}
		else if (VK_OEM_COMMA == in_event_param)
		{
			//keyboard_table_index = !bShift ? ',' : '<';
		}
		else if (VK_OEM_PERIOD == in_event_param)
		{
			//keyboard_table_index = !bShift ? '.' : '>';
		}
		else if (VK_OEM_2 == in_event_param)
		{
			//keyboard_table_index = !bShift ? '/' : '?';
		}
		else if (VK_OEM_1 == in_event_param)
		{
			//keyboard_table_index = !bShift ? ';' : ':';
		}
		else if (VK_OEM_7 == in_event_param)
		{
			//keyboard_table_index = !bShift ? '\'' : '"';
		}
		else if (VK_OEM_PLUS == in_event_param)
		{
			//keyboard_table_index = !bShift ? '=' : '+';
		}
		else if (VK_OEM_MINUS == in_event_param)
		{
			//keyboard_table_index = !bShift ? '-' : -1;	//(doesn't have underscore via keyboard)
		}
		else if (VK_OEM_3 == in_event_param)
		{
			//keyboard_table_index = !bShift ? '`' : '~';	//(these are arrow key locs)
		}
		else if (VK_OEM_4 == in_event_param)
		{
			//keyboard_table_index = !bShift ? '[' : '{';	//(these are arrow key locs)
		}
		else if (VK_OEM_6 == in_event_param)
		{
			//keyboard_table_index = !bShift ? ']' : '}';	//(these are arrow key locs)
		}
		else if (VK_OEM_5 == in_event_param)
		{
			//keyboard_table_index = !bShift ? '\\' : '|';	//(these are arrow key locs)
		}
		else if (VK_UP == in_event_param)
		{
			//keyboard_table_index = !bShift ? 0x5b : 0x1b;	//ESC 0x1b
																					//or is it ??
		}
		else if (VK_F12 == in_event_param)	//clear key
		{
			entry = &l_keyboard_table[0x1f];	//EREOF
		}

		// handle keyboard info
		if (entry == sysNULL)
		{
			// translate keyboard
			switch (in_event_param)
			{
				// enter key
				case sysVKC_RETURN:
				{
					static const KeyboardTableEntry enter = { 6, 1, 0 };
					entry = &enter;
				}
				break;

				// break key
				case sysVKC_F11:
				{
					static const KeyboardTableEntry brk = { 6, 4, 0 };	//break
					entry = &brk;
				}
				break;

				// capital key
				case sysVKC_CAPITAL:
				{
					static const KeyboardTableEntry shift0 = { 4, 1, 1 };	//shift-0
					entry = &shift0;
				}
				break;

				// shift-@
				case sysVKC_F10:
				{
					static const KeyboardTableEntry shift_at = { 0, 1, 1 };	//shift-@
					entry = &shift_at;
				}
				break;

				case sysVKC_LEFT:
				case sysVKC_BACK:
				{
					static const KeyboardTableEntry left = { 6, 32 , 0 };	//left ascii ]
					static const KeyboardTableEntry shift_left = { 6, 32 , 1 };	//shift + left ascii ]
					entry = !l_shift_state ? &left : &shift_left;
				}
				break;

				case sysVKC_RIGHT:
				case sysVKC_TAB:
				{
					static const KeyboardTableEntry right = { 6, 64 , 0 };	//right ascii ^
					static const KeyboardTableEntry shift_right = { 6, 64 , 1 };	//shift right ascii ^
					entry = !l_shift_state ? &right : &shift_right;
				}
				break;

				case sysVKC_DOWN:
				{
					static const KeyboardTableEntry mmDown = { 6, 16 , 0 };	//down ascii (backslash) 
					static const KeyboardTableEntry mmShiftDown = { 6, 16 , 1 };	//shift down ascii (backslash) 
					entry = !l_shift_state ? &mmDown : &mmShiftDown;
				}
				break;
			}
		}

		// process entry
		if (entry != sysNULL)
		{
			//do any modifiers
			if (entry->ShiftCtl == 0)	//non-modified?
			{
				//{ 7, 1  , 0 },	//shift
				//{ 6, 16 , 1 },	//shift |v
				g_keyboard_ram[7] &= ~1;
				g_keyboard_ram[6] &= ~16;
			}
			else if ((entry->ShiftCtl & 1) != 0)	//shifted?
			{
				//{ 7, 1  , 0 },	//shift
				if (in_event_category == sysUIEC_Pressed)
				{
					g_keyboard_ram[7] |= 1;
				}
				else
				{
					g_keyboard_ram[7] &= ~1;
				}
			}
			else if ((entry->ShiftCtl & 2) != 0)	//ctrl?
			{
				//{ 7, 1  , 0 },	//shift
				//{ 6, 16 , 1 },	//shift |v
				if (in_event_category == sysUIEC_Pressed)
				{
					g_keyboard_ram[7] |= 1;
					g_keyboard_ram[6] |= 16;
				}
				else
				{
					g_keyboard_ram[7] &= ~1;
					g_keyboard_ram[6] &= ~16;
				}
			}
			//now do the actual key
			if (in_event_category == sysUIEC_Pressed)
			{
				g_keyboard_ram[entry->Row] |= entry->Bit;
			}
			else
			{
				g_keyboard_ram[entry->Row] &= ~entry->Bit;
			}
		}
	}
}
#pragma endregion

#pragma region - Timing rutines -
/****************************************************************************
* T I M I N G    R O U T I N E S   
****************************************************************************/

///////////////////////////////////////////////////////////////////////////////
/// @brief Gets current CPU timestamp in cycle count
static uint32_t cpuGetTimestamp(void)
{
	return l_total_cpu_cycles + l_cpu.ICount;
}


///////////////////////////////////////////////////////////////////////////////
/// @brief Gets elapsed CPU time since the given timestamp
/// @param in_timestamp CPU cycle timestamp to calculate time from
/// @return Elapsed cycle count
static uint32_t cpuGetEllapsedTimeSince(uint32_t in_timestamp)
{
	uint32_t total_cpu_cycles = l_total_cpu_cycles + l_cpu.ICount;

	return total_cpu_cycles - in_timestamp;
}

///////////////////////////////////////////////////////////////////////////////
/// @brief Gets elapsed CPU time since the given timestamp in microsec (ellapsed time should be less than 4sec for the correct operation)
/// @param in_timestamp CPU cycle timestamp to calculate time from
/// @return Elapsed time in microsec
static uint32_t cpuGetEllapsedTimeSinceInMicrosec(uint32_t in_timestamp)
{
	uint32_t ellapsed_cycles = l_total_cpu_cycles + l_cpu.ICount - in_timestamp;

	return ellapsed_cycles * 1000 / (emuHT1080_CPU_CLK / 1000);
}

#pragma endregion

#pragma region - Cassette routines -
/****************************************************************************
* C A S E T T E   I N T E R F A C E
****************************************************************************/

///////////////////////////////////////////////////////////////////////////////
/// @brief Handles cassette motor on operation
static void emuCASMotorOn(void)
{
	// do nothing when cas interface is idle
	if (l_cas_state == emuCS_Idle)
		return;

	l_cas_motor_on = true;

	// start saving
	if (l_cas_state == emuCS_SaveStart)
	{
		// create file
		l_cas_file = fileOpen("test.cas", "wb");

		// start data decoding
		l_cas_state = emuCS_SaveWaitForClock;
		l_cas_buffer_bit_count = 0;
		l_cas_buffer = 0;
	}

	// start loading
	if (l_cas_state == emuCS_LoadStart)
	{
		// load cas file
		l_cas_file = fileOpen("galaxy.cas", "rb");

		fileRead(&l_cas_buffer, sizeof(l_cas_buffer), 1, l_cas_file);
		l_cas_buffer_bit_count = 8;
		l_cas_state = emuCS_LoadClock;
		l_in_port_ff |= emuPORT_FF_INPUT_MASK; // clock pulse
		l_cas_clock_timestamp = cpuGetTimestamp();

		// handle fast cassette operation
		if (g_application_settings.FastCassetteOperation)
		{
			fbWaitIndicatorShow();
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
/// @brief Handles motor off operaton of casette operation
static void emuCASMotorOff(void)
{
	// do nothing when cas interface is idle
	if (l_cas_state == emuCS_Idle)
		return;

	l_cas_motor_on = false;

	fbWaitIndicatorHide();

	// motor was turned off
	if (l_cas_file != sysNULL)
	{
		if (l_cas_buffer_bit_count > 0 && l_cas_state == emuCS_SaveWaitForData)
		{
			l_cas_buffer <<= 8 - l_cas_buffer_bit_count;
			fileWrite(&l_cas_buffer, sizeof(l_cas_buffer), 1, l_cas_file);
		}

		fileClose(l_cas_file);
	}

	l_cas_file = sysNULL;
	l_cas_state = emuCS_Idle;
}

///////////////////////////////////////////////////////////////////////////////
/// @brief Handles cassette output pulse (save)
/// @param in_pulse Pulse state 0 - zero, 2 - minus, 1,3 - plus pulse level
static void emuCASOut(uint8_t in_pulse)
{
	// do nothing when cas interface is idle
	if (l_cas_state == emuCS_Idle)
		return;

	// handle only positive pulse
	if (in_pulse == 1)
	{
		uint32_t pulse_length = cpuGetEllapsedTimeSinceInMicrosec(l_cas_clock_timestamp);

		if (pulse_length < emuCAS_CLOCK_PERIOD_MAX)
		{
			// valid pulse detected
			if (l_cas_state == emuCS_SaveWaitForData)
			{
				// insert new bit into the save buffer
				l_cas_buffer <<= 1;

				// check for data/clock pulse
				if (pulse_length < emuCAS_CLOCK_PERIOD_MIN)
				{
					// data pulse received
					l_cas_buffer |= 1;
					l_cas_state = emuCS_SaveWaitForClock;
				}
				else
				{
					// there was no data pulse, this is the next clock pulse
					l_cas_state = emuCS_SaveWaitForData;
					l_cas_clock_timestamp = cpuGetTimestamp();
				}

				// increment bit count and handle when all bits of byte is received
				l_cas_buffer_bit_count++;
				if (l_cas_buffer_bit_count >= 8)
				{
					fileWrite(&l_cas_buffer, sizeof(l_cas_buffer), 1, l_cas_file);
					l_cas_buffer_bit_count = 0;
				}
			}
			else
			{
				// clock detected wait for data
				l_cas_state = emuCS_SaveWaitForData;
				l_cas_clock_timestamp = cpuGetTimestamp();
			}
		}
		else
		{
			// first clock pulse received 
			l_cas_clock_timestamp = cpuGetTimestamp();
			l_cas_state = emuCS_SaveWaitForData;
		}
	}
}


static void emuCASIn(void)
{
	uint32_t ellapsed_time_since_clock;

	if (l_cas_state <= emuCS_LoadStart)
		return;

	if(g_application_settings.FastCassetteOperation)
		fbWaitIndicatorUpdate();

	ellapsed_time_since_clock = cpuGetEllapsedTimeSinceInMicrosec(l_cas_clock_timestamp);

	switch (l_cas_state)
	{
		case emuCS_LoadClock:
			// handle data
			if (ellapsed_time_since_clock > 800)
			{
				if ((l_cas_buffer & 0x80) != 0)
					l_in_port_ff |= emuPORT_FF_INPUT_MASK;

				l_cas_buffer <<= 1;
				l_cas_buffer_bit_count--;
				if (l_cas_buffer_bit_count == 0)
				{
					if (fileRead(&l_cas_buffer, sizeof(l_cas_buffer), 1, l_cas_file) != 1)
					{
						l_cas_buffer = 0;
					}
					l_cas_buffer_bit_count = 8;
				}

				l_cas_state = emuCS_LoadData;
			}
			break;

		case emuCS_LoadData:
			// data loaded -> handle clock
			if (ellapsed_time_since_clock > 2000)
			{
				l_cas_clock_timestamp = cpuGetTimestamp();
				l_in_port_ff |= emuPORT_FF_INPUT_MASK;
				l_cas_state = emuCS_LoadClock;
			}
			break;
	}
}
#pragma endregion
