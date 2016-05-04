#include <guiBlackAndWhiteGraphics.h>
#include <gcmGraphicsConfigMenu.h>
#include <gcmRenderer.h>
#include <appSettings.h>
#include <appGUI.h>
#include <emuHT1080.h>
#include "sysResource.h"


#define BUFFER_LENGTH 20
#define emuHTCAS_FILENAME_POSITION 28 * emuHT1080_CHARACTER_WIDTH


#pragma region - Configuration menu -

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
	&g_application_settings.StatisticsVisible,
	&g_application_settings.EmulatedModel
};

appSettings l_old_settings;

///////////////////////////////////////////////////////////////////////////////
/// @brief Opens configuration menu
void appOpenConfigMenu(void)
{
	gcmMenuInfo menu_info;

	// store old settings
	l_old_settings = g_application_settings;

	// prepare config menu
	gcmMenuInfoStructInit(&menu_info);

	menu_info.Title = REF_MNU_TITLE;
	menu_info.Values = g_values;
	menu_info.MenuItems = g_config_menu;
	menu_info.ValueTitles = g_value_title;
	menu_info.Rect.Left = 40;
	menu_info.Rect.Top = 40;
	menu_info.Rect.Bottom = guiSCREEN_HEIGHT - 20;
	menu_info.Rect.Right = guiSCREEN_WIDTH - 40;
	menu_info.SelectedItem = 1;

	// display menu
	gcmRenderBorder(&menu_info);
	gcmActivate(&menu_info);
}

///////////////////////////////////////////////////////////////////////////////
/// @brief Closes configuration menu
void appCloseConfigMenu(void)
{
	// close menu and refresh screen
	gcmDeactivate();
	emuRefreshScreen();

	// check for settings change
	if (l_old_settings.StatisticsVisible != g_application_settings.StatisticsVisible)
		appShowHideStatistics();
}

#pragma endregion

#pragma region - Statistics panel -


///////////////////////////////////////////////////////////////////////////////
/// @brief Shows/Hides statistics panel based on the current configuration setting
void appShowHideStatistics(void)
{
	uint16_t address;
	bool repeat;
	guiSize size;
	sysChar buffer[fileUTIL_MAX_FILENAME_LENGTH];

	if (g_application_settings.StatisticsVisible)
	{
		// disable emulator refreshing of the first (topmost) line
		for (address = 0; address < emuHT1080_SCREEN_WIDTH_IN_CHARACTER; address++)
			g_screen_no_refresh_area[address]++;

		// create fixel graphical elements
		guiOpenCanvas(0, 0, guiSCREEN_WIDTH - 1, emuHT1080_CHARACTER_HEIGHT - 1);

		// clear background
		guiSetSystemBrush(0);
		guiFillRectangle(0, 0, guiSCREEN_WIDTH - 1, emuHT1080_CHARACTER_HEIGHT - 1);

		// draw separator line
		guiSetPen(1);
		guiDrawHorizontalLine(0, guiSCREEN_WIDTH - 1, emuHT1080_CHARACTER_HEIGHT - 2);

		// draw fixed text
		guiSetFont(REF_FNA_HT1080);
		guiSetTextAlign(guiHA_LEFT | guiVA_TOP);
		guiSetPen(1);
		guiDrawText(0, -2, "CPU:  -.--Mhz ( -.-Hz) CAS:");

		// display cassette file name
		strCopyString(buffer, fileUTIL_MAX_FILENAME_LENGTH, 0, g_application_settings.CassetteFileName);

		guiOpenCanvas(0, 0, guiSCREEN_WIDTH - 1, emuHT1080_CHARACTER_HEIGHT - 1);

		// shorten path
		do
		{
			repeat = false;
			size = guiGetTextExtent(buffer);
			if (size.Width > guiSCREEN_WIDTH - 1 - emuHTCAS_FILENAME_POSITION)
			{
				if (!fileShortenDisplayPath(buffer, fileMAX_PATH))
					repeat = false;
				else
					repeat = true;
			}

		} while (repeat);

		guiDrawText(emuHTCAS_FILENAME_POSITION, -2, buffer);

		guiCloseCanvas(true);
	}
	else
	{
		// enable emulator refresh of the topmost line
		for (address = 0; address < emuHT1080_SCREEN_WIDTH_IN_CHARACTER; address++)
		{
			if (g_screen_no_refresh_area[address] > 0)
			{
				g_screen_no_refresh_area[address]--;
			}
		}

		emuRefreshScreen();
	}
}

void appRefreshStatistics(void)
{
	sysChar buffer[BUFFER_LENGTH];

	guiOpenCanvas(0, 0, guiSCREEN_WIDTH - 1, emuHT1080_CHARACTER_HEIGHT - 1);

	strWordToStringPos(buffer, BUFFER_LENGTH, 0, g_emulation_speed_cpu_freq, 5, 2, TS_RIGHT_ADJUSTMENT);
	guiDrawText(30, -2, buffer);

	strWordToStringPos(buffer, BUFFER_LENGTH, 0, g_emulation_speed_vsync_freq, 4, 1, TS_RIGHT_ADJUSTMENT);
	guiDrawText(90, -2, buffer);

	guiCloseCanvas(true);
}


#pragma endregion