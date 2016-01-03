#include <sysHighresTimer.h>
#include <sysUserInput.h>
#include <fileStandardFunctions.h>
#include <guiColorGraphics.h>
#include <fbFileBrowser.h>
#include <fbBuffer.h>
#include <emuHomeLab.h>
#include <appSettings.h>
#include <appKeyboardSwitcher.h>
#include "sysConfig.h"
//#include "fbResource.h"

extern void guiInitializeGraphicsDisplayEmulation(void);

//uint8_t g_buffer[65536];

void sysInitialization(void)
{
	appSettingsInit();
	sysHighresTimerInit();
	guiInitializeGraphicsDisplayEmulation();
	appKeyboardSwitcherInit();

	//fileInit();

  //fatMountDrive(0);
  //fileSetDriveLetterByVolumeIndex(0,'C');

	//fbBufferSet(g_buffer, (uint32_t)sizeof(g_buffer));

	emuHomelabInitialize();

	//fbActivate("c:");
}

void sysMainTask(void)
{
	fbTask();
	emuHomelabTask();
	Sleep(0);
}
	
void sysCleanup(void)
{
}

void fbFileSelectionHandler(void)
{
}