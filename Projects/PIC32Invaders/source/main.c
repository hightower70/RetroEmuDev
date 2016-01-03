#include <sysTimer.h>
#include "sysConfig.h"
#include "drvUSBHIDHost.h"

#include <sysVirtualKeyboardCodes.h>
#include <fbFileBrowser.h>

#include <stdlib.h>
#include <plib.h>

#define PMP_CONTROL	(PMP_ON | PMP_READ_WRITE_EN | PMP_MUX_OFF | PMP_CS2_CS1_OFF)
#define PMP_MODE    (PMP_DATA_BUS_8 | PMP_MODE_MASTER2 | PMP_WAIT_BEG_1 | PMP_WAIT_MID_15 | PMP_WAIT_END_1)

const unsigned char portOut[] = {
    0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f,
    0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f,
    0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f,
    0x30, 0x31, 0x32, 0x33, 0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f
};

static volatile int dmaTxferSz;
static int dmaChn;


#if 0
int main(void) {
    //AD1PCFG = 0xFFFF;
    //mJTAGPortEnable(0);

	unsigned char portOut2[] = { 0x55, 0xaa };

    SYSTEMConfigPerformance(80000000);
    BMXCONbits.BMXARB = 0x02;

    //mPORTEClearBits(BIT_7 | BIT_6 | BIT_5 | BIT_4 | BIT_3 | BIT_2 | BIT_1 | BIT_0);
    //mPORTESetPinsDigitalOut(BIT_7 | BIT_6 | BIT_5 | BIT_4 | BIT_3 | BIT_2 | BIT_1 | BIT_0);

    //mPORTCClearBits(BIT_2 | BIT_1);
    //mPORTCSetPinsDigitalOut(BIT_2 | BIT_1);
    //mPORTCSetBits(BIT_2);

    mPMPOpen(PMP_CONTROL, PMP_MODE, PMP_PEN_0, PMP_INT_OFF);

		
    dmaChn = 0;
    DmaChnOpen(dmaChn, 0, DMA_OPEN_DEFAULT);
    DmaChnSetEventControl(dmaChn, DMA_EV_START_IRQ(_PMP_IRQ));

    dmaTxferSz = 16;
    INTConfigureSystem(INT_SYSTEM_CONFIG_MULT_VECTOR);
    INTEnableInterrupts();

			// set the DMA events to generate an interrupt, the interrupt priority and sub-priority. Enable the DMA interrupt.
	DmaChnSetEvEnableFlags(dmaChn, DMA_EV_BLOCK_DONE);
	DmaChnSetIntPriority(dmaChn, 5, 3);
	DmaChnIntEnable(dmaChn);

    //while (1) {
        DmaChnSetTxfer(dmaChn, (void*)&portOut, (void *) &PMDIN, dmaTxferSz, 1, 1);
        //DmaChnSetTxfer(dmaChn, (void*)&portOut2, (void *) &PMDIN, 2, 1, 1);

        DmaChnEnable(dmaChn);
        DmaChnStartTxfer(dmaChn, DMA_WAIT_BLOCK, 0);
    //}


while(!(DmaChnGetEvFlags(0)&DMA_EV_BLOCK_DONE))
	{
	sysNOP();
		// do some other useful work
	}
				
		PMPMasterWrite(0x00);

				while (1);
    return 0;
}

void __ISR(_DMA0_VECTOR, ipl5) DmaIntHandler(void)
{
	DmaChnClrIntFlag(dmaChn);
}
#endif
#if 1
extern void sysInitialization(void);
extern void drvUSBHIDHOSTTask(void);

///////////////////////////////////////////////////////////////////////////////
// Global variables

// heartbeat variables
sysTimeStamp g_hb_timestamp = 0;
uint8_t g_hb_led_status = 0;

void main(void)
{
  sysInitialization();

  while (1)
  {
		emuInvadersTask();
		drvUSBHIDHOSTTask();

    // heartbeat led
    if (sysTimerGetTimeSince(g_hb_timestamp) > 500)
    {
      // update timestamp
      g_hb_timestamp = sysTimerGetTimestamp();

      HBLED(g_hb_led_status);

      g_hb_led_status = 1 - g_hb_led_status;
    }
  }
}
#endif