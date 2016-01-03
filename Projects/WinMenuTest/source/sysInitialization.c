#include <sysHighresTimer.h>
#include <sysUserInput.h>
#include <fileStandardFunctions.h>
#include <guiBlackAndWhiteGraphics.h>
#include <fbFileBrowser.h>
#include <fbBuffer.h>
#include "sysConfig.h"

#include <gcmGraphicsConfigMenu.h>
#include "sysResource.h"

extern void guiInitializeGraphicsDisplayEmulation(void);

//uint8_t g_buffer[65536];

gcmMenuItem g_config_menu[] =
{
	{ REF_MNU_FAST_CASSETTE, gcmMVT_Byte, 0, 2 },
	{ REF_MNU_FULL_SPEED_EMULATION, gcmMVT_Byte, 0, 2 },
	{ sysNULL, 0 }
};

sysResourceAddress g_value_title[] =
{
	REF_MNU_ENABLED,
	REF_MNU_DISABLED
};

uint8_t g_full_speed_emulation = 0;
uint8_t g_fast_cassette_operation = 0;

void* g_values[] =
{
	&g_full_speed_emulation,
	&g_fast_cassette_operation
};


void sysInitialization(void)
{
	gcmMenuInfo menu_info;

	gcmMenuInfoStructInit(&menu_info);

	menu_info.Values = g_values;
	menu_info.MenuItems = g_config_menu;
	menu_info.ValueTitles = g_value_title;
	menu_info.Rect.Left = 20;
	menu_info.Rect.Top = 20;
	menu_info.Rect.Bottom = guiSCREEN_HEIGHT - 20;
	menu_info.Rect.Right = guiSCREEN_WIDTH - 20;
	menu_info.SelectedItem = 1;

	guiInitializeGraphicsDisplayEmulation();


	guiOpenCanvas(menu_info.Rect.Left - 2, menu_info.Rect.Top - 2, menu_info.Rect.Right + 2, menu_info.Rect.Bottom + 2);
	guiSetPen(1);
	guiDrawRectangle(menu_info.Rect.Left - 2, menu_info.Rect.Top - 2, menu_info.Rect.Right + 2, menu_info.Rect.Bottom + 2);
	guiCloseCanvas(true);
	gcmActivate(&menu_info);
}

void sysMainTask(void)
{
}
	
void sysCleanup(void)
{
}

void fbFileSelectionHandler(void)
{
}

extern void gcmUserInputEventHandler(uint8_t in_device_number, sysUserInputEventCategory in_event_category, sysUserInputEventType in_event_type, uint32_t in_event_param);


void drvUserInputEventHandler(uint8_t in_device_number, sysUserInputEventCategory in_event_category, sysUserInputEventType in_event_type, uint32_t in_event_param)
{
	gcmUserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);
}

