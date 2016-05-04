#include <sysTimer.h>
#include <emuHT1080.h>
#include <fbFileBrowser.h>
#include <sysVirtualKeyboardCodes.h>
#include <gcmGraphicsConfigMenu.h>
#include <appGUI.h>
#include <appConfigMenu.h>
#include <appSettings.h>


typedef enum
{
	appAT_Emulation,
	appAT_FileBrowser,
	appAT_ConfigMenu
} appActiveTask;

appActiveTask g_active_task = appAT_Emulation;

static sysTimeStamp l_emulation_statistics_timestamp;

static void appDeactivateFileBrowser(void);


///////////////////////////////////////////////////////////////////////////////
///@brief Main task function and task switching based on current active module
void sysMainTask(void)
{
	uint32_t emulaton_statistics_time;

	switch (g_active_task)
	{
		// emulation
		case appAT_Emulation:
			emuHT1080Task();

			// update amulation statistics
			if (g_application_settings.StatisticsVisible)
			{
				emulaton_statistics_time = sysTimerGetTimeSince(l_emulation_statistics_timestamp);
				if (emulaton_statistics_time > 1000)
				{
					emuHT1080UpdateStatistics(emulaton_statistics_time);
					emuHT1080ResetStatistics();

					l_emulation_statistics_timestamp = sysTimerGetTimestamp();

					appRefreshStatistics();
				}
			}
			break;

		// file browser
		case appAT_FileBrowser:
			fbTask();
			break;
	}
}

///////////////////////////////////////////////////////////////////////////////
/// @brief User Input Event handler and dispatcher function. It dispatches the 
/// user event to the active module.
void drvUserInputEventHandler(uint8_t in_device_number, sysUserInputEventCategory in_event_category, sysUserInputEventType in_event_type, uint32_t in_event_param)
{
	switch (g_active_task)
	{
		// emulator keyboard handler
		case appAT_Emulation:
			if (in_event_type == sysUIET_Key)
			{
				switch (in_event_param)
				{
					// open config menu
					case sysVKC_F10:
						g_active_task = appAT_ConfigMenu;

						appOpenConfigMenu();
						break;

					case sysVKC_F11:
						if (in_event_category == sysUIEC_Pressed)
						{
							g_application_settings.StatisticsVisible = !g_application_settings.StatisticsVisible;

							appShowHideStatistics();
						}
						break;

					// open file browser
					case sysVKC_F2:
						g_active_task = appAT_FileBrowser;

						fbActivate(g_application_settings.FileBrowserPath);
						break;

					// send any other event to the emulator
					default:
						emuHT1080UserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);
						break;
				}
			}
			else
			{
				emuHT1080UserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);
			}
			break;

		// file browser keyboard handler
		case appAT_FileBrowser:
			if (in_event_type == sysUIET_Key && in_event_param == sysVKC_ESCAPE)
			{
				appDeactivateFileBrowser();
			}
			else
			{
				fbUserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);
			}
			break;

		// config menu keyboard handler
		case appAT_ConfigMenu:
			if (in_event_type == sysUIET_Key && in_event_param == sysVKC_ESCAPE)
			{
				appCloseConfigMenu();

				g_active_task = appAT_Emulation;
			}
			else
			{
				gcmUserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);
			}
			break;
	}
}

void fbFileSelectionHandler(void)
{
	fbFileInformation* file_information = fbGetSelectedFileInformation();
	sysString extension;

	extension = fileGetFileNameExtension(file_information->FileName);
	if (strCompareConstStringNoCase(extension, (sysConstString)"CAS") == 0)
	{
		fbGetSelectedFullFileName(g_application_settings.CassetteFileName, fileUTIL_MAX_FILENAME_LENGTH);

		appDeactivateFileBrowser();
	}
}

static void appDeactivateFileBrowser(void)
{
	// close file browser
	fbDeactivate();

	emuHT1080RefreshScreen();
	appShowHideStatistics();

	g_active_task = appAT_Emulation;
}