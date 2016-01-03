#ifndef __sysConfig_h
#define __sysConfig_h

///////////////////////////////////////////////////////////////////////////////
// System includes
#include <plib.h>
#include <drvPMP8.h>

///////////////////////////////////////////////////////////////////////////////
// System settings
#define sysCLOCK_FREQUENCY 80000000
#define sysPBCLK_FREQUENCY 80000000
#define sysNOP() Nop()


///////////////////////////////////////////////////////////////////////////////
// Usefull constants
#define PIN_ON									1
#define PIN_OFF									0

#define PIN_HIGH								1
#define PIN_LOW									0

#define INPUT_PIN               1
#define OUTPUT_PIN              0

#define _PIN_CHANGE(port,pin,value) ((value)==0) ? m ## port ## ClearBits(BIT_ ## pin) : m ## port ## SetBits(BIT_ ## pin);
#define PIN_CHANGE(port,pin,value) _PIN_CHANGE(port,pin,value)

///////////////////////////////////////////////////////////////////////////////
// LED definitions

#define LED_ON	0
#define LED_OFF 1

#define HBLEDInit()	{ mPORTDSetBits(BIT_2); mPORTDSetPinsDigitalOut(BIT_2); }

#define HBLED(x)	PIN_CHANGE(PORTD, 2, x)


///////////////////////////////////////////////////////////////////////////////
// GUI Config
#define guiCOLOR_DEPTH 24

//#define guiSCREEN_PORTRAIT
//#define guiSCREEN_LANDSCAPE

#ifdef guiSCREEN_LANDSCAPE
#define guiSCREEN_WIDTH 320
#define guiSCREEN_HEIGHT 240
#else
#define guiSCREEN_WIDTH 240
#define guiSCREEN_HEIGHT 320
#endif


///////////////////////////////////////////////////////////////////////////////
// Resource config
typedef int sysResourceAddress;


///////////////////////////////////////////////////////////////////////////////
// SD Card definitions

#define drvSDC_SPI_CHANNEL SPI_CHANNEL1
#define drvSDC_CRC_ENABLED

#define drvSDCSPI_BAUD_RATE 10000000

#define drvSDCCSInit()	{ mPORTBSetBits(BIT_2); mPORTBSetPinsDigitalOut(BIT_2); }
#define drvSDCCSDeinit()	{ mPORTBSetBits(BIT_2); mPORTBSetPinsDigitalIn(BIT_2); }
#define drvSDCCS(x)			PIN_CHANGE(PORTB, 2, x)


//#define drvSDCCDInit()  { mPORTDSetPinsDigitalIn(BIT_7); }
//#define drvSDCCD()      ((_RD9) != 0)

///////////////////////////////////////////////////////////////////////////////
// File system settings
//#define fileFAT_NO_LONG_FILENAME_SUPPORT
#define fileFAT_BUFFERING_MODE fileFAT_BM_SYSTEM_AND_FILE
#define fileFAT_MAX_HANDLE_COUNT 8
#define fileFAT_READ_ONLY_FILESYSTEM


#define drvMSInitialize drvSDCardInitialize
#define drvMSIOControl drvSDCardIOControl
#define drvMSReadSector drvSDCardReadSector
#define drvMSWriteSector drvSDCardWriteSector

///////////////////////////////////////////////////////////////////////////////
// Graphics LCD settings


#define drvPMP8_CONTROL	(PMP_ON | PMP_READ_WRITE_EN | PMP_MUX_OFF | PMP_CS2_CS1_OFF)
#define drvPMP8_MODE    (PMP_DATA_BUS_8 | PMP_MODE_MASTER2 | PMP_WAIT_BEG_1 | PMP_WAIT_MID_4 | PMP_WAIT_END_1)

#define drvILI9320PMP8WriteByte drvPMP8WriteByte
#define drvILI9320PMP8Initialize drvPMP8Init

#define drvILI9320ResetInitialize()	{ mPORTCSetBits(BIT_14); mPORTCSetPinsDigitalOut(BIT_14); }
#define drvILI9320Reset(x)					PIN_CHANGE(PORTC, 14, x)

#define drvILI9320CSInitialize()		{ mPORTCSetBits(BIT_1); mPORTCSetPinsDigitalOut(BIT_1); }
#define drvILI9320CS(x)							PIN_CHANGE(PORTC, 1, x)

#define drvPMP8_DMA_CHANNEL 0

#endif