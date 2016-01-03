#include <plib.h>
#include <sysHighresTimer.h>
#include <sysUserInput.h>
#include <fileStandardFunctions.h>
#include <drvBlackAndWhiteGraphics.h>
#include <fbFileBrowser.h>
#include <fbBuffer.h>
#include <emuHomeLab.h>
#include <appSettings.h>
#include "sysConfig.h"
//#include "fbResource.h"

extern void guiInitializeGraphicsDisplayEmulation(void);

//uint8_t g_buffer[65536];

// NOTE: Clock settings should be updated in the drvIOConfig.h (sysCLOCK_FREQUENCY, sysPBLCK_FREQUENCY)
#pragma config FPLLIDIV = DIV_2, FPLLMUL = MUL_20, FPLLODIV = DIV_1, FPBDIV = DIV_1
#pragma config UPLLEN   = ON, UPLLIDIV = DIV_2
#pragma config POSCMOD = HS, FNOSC = FRCPLL, OSCIOFNC = OFF, ICESEL = ICS_PGx2, FSOSCEN = ON
#pragma config FWDTEN = OFF, WDTPS = PS16384

void sysInitialization(void)
{
  SYSTEMConfig(sysCLOCK_FREQUENCY, SYS_CFG_WAIT_STATES | SYS_CFG_PCACHE);
  AD1PCFG = 0xffff;

	// enable interrupts
  INTConfigureSystem(INT_SYSTEM_CONFIG_MULT_VECTOR);

	// enable interrupts
  INTEnableSystemMultiVectoredInt();
	
	appSettingsInit();
	sysHighresTimerInit();
	guiGraphicsInitialize();

	//fileInit();

  //fatMountDrive(0);
  //fileSetDriveLetterByVolumeIndex(0,'C');

	//fbBufferSet(g_buffer, (uint32_t)sizeof(g_buffer));

	emuHomelabInitialize();

	//fbActivate("c:");
}

void sysMainTask(void)
{
	//fbTask();
	emuHomelabTask();
}
	
void sysCleanup(void)
{
}

void fbFileSelectionHandler(void)
{
}