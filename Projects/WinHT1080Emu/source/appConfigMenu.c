#include <guiBlackAndWhiteGraphics.h>
#include <gcmGraphicsConfigMenu.h>
#include <appSettings.h>
#include "sysResource.h"

gcmMenuItem g_config_menu[] =
{
	{ REF_MNU_FAST_CASSETTE, gcmMVT_Bool, 0, 2 },
	{ REF_MNU_FULL_SPEED_EMULATION, gcmMVT_Bool, 0, 2 },
	{ REF_MNU_SHOW_EMULATION_STATISTICS, gcmMVT_Bool, 2, 2},

	{ sysNULL, 0 }
};

sysResourceAddress g_value_title[] =
{
	REF_MNU_ENABLED,
	REF_MNU_DISABLED,
	REF_MNU_HIDE,
	REF_MNU_SHOW
};

void* g_values[] =
{
	&g_application_settings.FastCassetteOperation,
	&g_application_settings.FullSpeed,
	&g_application_settings.StatisticsVisible
};

void appOpenConfigMenu(void)
{
	gcmMenuInfo menu_info;

	gcmMenuInfoStructInit(&menu_info);

	menu_info.Title = REF_MNU_TITLE;
	menu_info.Values = g_values;
	menu_info.MenuItems = g_config_menu;
	menu_info.ValueTitles = g_value_title;
	menu_info.Rect.Left = 20;
	menu_info.Rect.Top = 40;
	menu_info.Rect.Bottom = guiSCREEN_HEIGHT - 20;
	menu_info.Rect.Right = guiSCREEN_WIDTH - 20;
	menu_info.SelectedItem = 1;

	gcmRenderBorder(&menu_info);

	gcmActivate(&menu_info);
}