#include <fbFileBrowser.h>
#include <sysTimer.h>
#include <drvMassStorage.h>
#include "sysConfig.h"
#include "fbResource.h"
#include "usb_config.h"


///////////////////////////////////////////////////////////////////////////////
// Fuse settings

/* Core configuration fuse settings */
#pragma config FPLLMUL = MUL_20, FPLLIDIV = DIV_2, FPLLODIV = DIV_1, FWDTEN = OFF
#pragma config UPLLIDIV = DIV_2, UPLLEN = ON, FVBUSONIO = ON, FUSBIDIO = ON
#pragma config POSCMOD = HS, FNOSC = PRIPLL, FPBDIV = DIV_1
#pragma config CP = OFF, BWP = OFF, PWP = OFF
#pragma config FSOSCEN = OFF
#pragma config FMIIEN = OFF, FETHIO = OFF

extern void guiInitializeColorGraphics(void);

uint8_t g_buffer[65536];

void sysInitialization(void)
{
	// init processor
 	SYSTEMConfig(sysCLOCK_FREQUENCY, SYS_CFG_WAIT_STATES | SYS_CFG_PCACHE);
  //mJTAGPortEnable(DEBUG_JTAGPORT_OFF);

	//AD1PCFG = 0xffff;
  HBLEDInit();

	// enable interrupts
  INTEnableSystemMultiVectoredInt();

  // configure for multi-vectored mode
  INTConfigureSystem(INT_SYSTEM_CONFIG_MULT_VECTOR);

  // enable interrupts
  INTEnableInterrupts();

	UART2Init();

	// initialize USB host
	USBHostInitialize();

  // init system components
  drvSystemTimerInit();

	// Initialize color graphics subsystem
	guiGraphicsInitialize();


	//drvSDCardInitialize();
	//drvSDCardIOControl(fileIOFUNC_DETECT_AND_INIT_MEDIA);

	fileInit();

	drvSDCardIOControl(fileIOFUNC_DETECT_AND_INIT_MEDIA);
	
  fatMountDrive(0);
  fileSetDriveLetterByVolumeIndex(0,'C');

	fbBufferSet(g_buffer, (uint32_t)sizeof(g_buffer));
	fbActivate("c:\\");
}
void sysMainTask(void)
{
	//fbTask();
}


void _general_exception_handler(unsigned cause, unsigned status)
{
	unsigned long address = _CP0_GET_EPC();

	while(1){}
}