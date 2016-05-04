#include <sysHighresTimer.h>
#include <fileStandardFunctions.h>
#include <guiColorGraphics.h>
#include <fbFileBrowser.h>
#include <fbBuffer.h>
#include <emuHT1080.h>
#include <appSettings.h>
#include "sysConfig.h"
//#include "fbResource.h"

extern void guiInitializeGraphicsDisplayEmulation(void);

uint8_t g_buffer[65536];

void sysInitialization(void)
{
	appSettingsInit();
	sysHighresTimerInit();
	guiInitializeGraphicsDisplayEmulation();
	fileInit();

  //fatMountDrive(0);
  //fileSetDriveLetterByVolumeIndex(0,'C');

	fbBufferSet(g_buffer, (uint32_t)sizeof(g_buffer));

	emuHT1080Initialize();

	//fbActivate("c:");
}


void sysCleanup(void)
{
}

