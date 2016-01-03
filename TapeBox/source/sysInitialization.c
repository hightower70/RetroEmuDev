#include <fileStandardFunctions.h>
#include <guiColorGraphics.h>
#include <fbFileBrowser.h>
#include <fbBuffer.h>
#include <appWavePlayer.h>
#include "sysConfig.h"

extern void guiInitializeGraphicsDisplayEmulation(void);

uint8_t g_buffer[65536];

void sysInitialization(void)
{
	guiInitializeGraphicsDisplayEmulation();
	//fileInit();

  //fatMountDrive(0);
  //fileSetDriveLetterByVolumeIndex(0,'C');

	fbBufferSet(g_buffer, (uint32_t)sizeof(g_buffer));
	fbActivate("c:\\");
}

void sysMainTask(void)
{
	fbTask();
	appWavePlayerTask();
}

void sysCleanup(void)
{
}