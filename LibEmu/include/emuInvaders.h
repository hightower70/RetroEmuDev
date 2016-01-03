#ifndef __emuInvaders_h
#define __emuInvaders_h

#include <sysTypes.h>
#include "sysConfig.h"

//--------------------------------------------------------------
// Invaders memory sizes
//--------------------------------------------------------------
#define emuINVADERS_RAM_SIZE (8*1024)
#define emuINVADERS_ROM_SIZE (8*1024)
#define emuINVADERS_RAM_START emuINVADERS_ROM_SIZE
#define emuINVADERS_VIDEO_RAM_START 0x2400
#define emuINVADERS_RAM_MIRROR 0x4000

#define emuINVADERS_SCREEN_WIDTH  224
#define emuINVADERS_SCREEN_HEIGHT 256

#define emuINVADERS_SCREEN_LEFT ((guiSCREEN_WIDTH - emuINVADERS_SCREEN_WIDTH) / 2)		// Display start position (x)
#define emuINVADERS_SCREEN_TOP  ((guiSCREEN_HEIGHT - emuINVADERS_SCREEN_HEIGHT) / 2)	// Display start position (y)

#define emuINVADERS_CPU_CLOCK 2000000				// CPU clock in MHz
#define emuINVADERS_LINE_TIME 63500					// line with in ns
#define emuINVADERS_FRAME_TIME 16666				// frame time for 60Hz frame rate	in us


void emuInvadersInitialize(void);
void emuInvadersTask(void);
void emuInvadersRenderScanLine(uint16_t in_line_index);

extern uint8_t Z80_RAM[];

#endif