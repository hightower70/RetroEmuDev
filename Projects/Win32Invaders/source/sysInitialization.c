#include <sysUserInput.h>
#include <guiColorGraphics.h>
#include <fbFileBrowser.h>
#include <fbBuffer.h>
#include <emuInvadersResource.h>
#include "sysConfig.h"
#include <emuInvaders.h>
#include <drvWavePlayer.h>
//#include "fbResource.h"

extern void guiInitializeGraphicsDisplayEmulation(void);
extern void sysHighResTimerInit(void);

void sysInitialization(void)
{
	sysHighresTimerInit();
	guiInitializeGraphicsDisplayEmulation();
	emuInvadersInitialize();
}


	
void sysCleanup(void)
{
	drvWavePlayerCleanUp();
}