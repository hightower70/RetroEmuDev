/*****************************************************************************/
/* Routes keyboard messages between functions                                */
/*                                                                           */
/* Copyright (C) 2015 Laszlo Arvai                                           */
/* All rights reserved.                                                      */
/*                                                                           */
/* This software may be modified and distributed under the terms             */
/* of the BSD license.  See the LICENSE file for details.                    */
/*****************************************************************************/

/*****************************************************************************/
/* Includes                                                                  */
/*****************************************************************************/
#include <appKeyboardSwitcher.h>
#include <emuHT1080.h>
#include <sysVirtualKeyboardCodes.h>
#include <appSettings.h>
#include <fbFileBrowser.h>

#include <windows.h>

/*****************************************************************************/
/* Constants                                                                 */
/*****************************************************************************/
#define KEY_STATE_BUFFER_SIZE 8

/*****************************************************************************/
/* Module global variables                                                   */
/*****************************************************************************/
static uint16_t l_key_state_buffer[KEY_STATE_BUFFER_SIZE] = { 0 };
static uint32_t l_modifier_keys = 0;

/*****************************************************************************/
/* Global variables                                                          */
/*****************************************************************************/
appActiveModule g_active_module;

/*****************************************************************************/
/* Module local functions                                                    */
/*****************************************************************************/
static void appDeactivateFileBrowser(void);


///////////////////////////////////////////////////////////////////////////////
/// @brief Initializes keyboard switcher
void appKeyboardSwitcherInit(void)
{
	uint8_t i;

	for (i = 0; i < KEY_STATE_BUFFER_SIZE; i++)
	{
		l_key_state_buffer[i] = sysVKC_INVALID;
	}

	g_active_module = appAM_Emulation;
}

///////////////////////////////////////////////////////////////////////////////
/// @brief Handles user input events and routes it to the active module
void drvUserInputEventHandler(uint8_t in_device_number, sysUserInputEventCategory in_event_category, sysUserInputEventType in_event_type, uint32_t in_event_param)
{
	uint8_t i;
	static DWORD prev_time;
	DWORD time = GetTickCount();

	TCHAR buffer[100];

	// process keyboard events
	if (in_event_type == sysUIET_Key)
	{
		// handle only the first device
		if (in_device_number != 1)
			return;

		//wsprintf(buffer, TEXT("pressed: %d (%c) %d\n"), in_event_param, in_event_param, time - prev_time);
		//OutputDebugString(buffer);

		// store pressed key (Except modifier keys)
		if (in_event_param != sysVKC_SHIFT && in_event_param != sysVKC_CONTROL && in_event_param != sysVKC_MENU && in_event_param != (sysVKC_SPECIAL_KEY_FLAG | sysVKC_MENU))
		{
			// store pressed event
			if (in_event_category == sysUIEC_Pressed)
			{
				//wsprintf(buffer, TEXT("pressed: %d (%c) %d\n"), in_event_param, in_event_param, time - prev_time);
				//OutputDebugString(buffer);

				for (i = 0; i < KEY_STATE_BUFFER_SIZE; i++)
				{
					if (l_key_state_buffer[i] == sysVKC_INVALID)
					{
						l_key_state_buffer[i] = in_event_param;
						break;
					}
				}

				prev_time = time;
			}

			// store repeased event
			if (in_event_category == sysUIEC_Released)
			{
				//wsprintf(buffer, TEXT("released: %d (%c) %d\n"), in_event_param, in_event_param, time - prev_time);
				//OutputDebugString(buffer);

				for (i = 0; i < KEY_STATE_BUFFER_SIZE; i++)
				{
					if (l_key_state_buffer[i] == in_event_param)
					{
						l_key_state_buffer[i] = sysVKC_INVALID;
						break;
					}
				}

				prev_time = time;
			}
		}
		else
		{
			// process modifier keys

			// release key used with modifiers in the case of emulator function
			if (g_active_module == appAM_Emulation)
			{
				for (i = 0; i < KEY_STATE_BUFFER_SIZE; i++)
				{
					if (l_key_state_buffer[i] != sysVKC_INVALID)
						emuUserInputEventHandler(0, sysUIEC_Released, sysUIET_Key, l_key_state_buffer[i]);
				}
			}

			// store modifier state
			if (in_event_category == sysUIEC_Pressed)
			{
				switch (in_event_param)
				{
					case sysVKC_SHIFT:
						l_modifier_keys |= sysMS_SHIFT;
						break;

					case sysVKC_CONTROL:
						l_modifier_keys |= sysMS_CTRL;
						break;

					case sysVKC_MENU:
						l_modifier_keys |= sysMS_ALT;
						break;

					case sysVKC_SPECIAL_KEY_FLAG | sysVKC_MENU:
						l_modifier_keys |= sysMS_ALT;
						break;
				}
			}

			if (in_event_category == sysUIEC_Released)
			{
				switch (in_event_param)
				{
					case sysVKC_SHIFT:
						l_modifier_keys &= ~sysMS_SHIFT;
						break;

					case sysVKC_CONTROL:
						l_modifier_keys &= ~sysMS_CTRL;
						break;

					case sysVKC_MENU:
						l_modifier_keys &= ~sysMS_ALT;
						break;

					case sysVKC_SPECIAL_KEY_FLAG | sysVKC_MENU:
						l_modifier_keys &= ~sysMS_ALT;
						break;
				}
			}

			// reapply pressed keys in emulator function
			if (g_active_module == appAM_Emulation)
			{
				for (i = 0; i < KEY_STATE_BUFFER_SIZE; i++)
				{
					if (l_key_state_buffer[i] != sysVKC_INVALID)
						emuUserInputEventHandler(0, sysUIEC_Pressed, sysUIET_Key, l_key_state_buffer[i]);
				}
			}
		}

		// dispatch keyboard message
		switch (g_active_module)
		{
			case appAM_Emulation:
				switch (in_event_param)
				{
					// open config menu
					case sysVKC_F10:
						g_active_module = appAM_Menu;

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
						g_active_module = appAM_FileBrowser;

						fbActivate(g_application_settings.FileBrowserPath);
						break;

						// warm reset
					case sysVKC_F9:
						if (in_event_category == sysUIEC_Pressed)
							emuNMI();
						break;

						// cold reset
					case sysVKC_F8:
						if (in_event_category == sysUIEC_Pressed)
							emuReset();
						break;

						// send any other event to the emulator
					default:
						emuUserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);
						break;
				}
				break;

				// file browser keyboard handler
			case appAM_FileBrowser:
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
			case appAM_Menu:
				if (in_event_type == sysUIET_Key && in_event_param == sysVKC_ESCAPE)
				{
					appCloseConfigMenu();

					g_active_module = appAM_Emulation;
				}
				else
				{
					gcmUserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);
				}
				break;

		}
	}
	else
	{
		// process non keyboard events
		switch (g_active_module)
		{
			case appAM_Emulation:
				emuUserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);
				break;

			case appAM_FileBrowser:
				fbUserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);
				break;

			case appAM_Menu:
				gcmUserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);
				break;
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
/// @brief Gets currently active keyboard modifiers (Shift, Ctrl, Alt)
/// @param in_device_number Device index if more keyboard is attached (not used)
/// @return Keyboard modifier state. See sysMS_xxx codes for possible values
uint32_t sysUserInputGetModifiersState(uint8_t in_device_number)
{
	return l_modifier_keys;
}

///////////////////////////////////////////////////////////////////////////////
/// @brief Handles file selection event
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

///////////////////////////////////////////////////////////////////////////////
/// @brief Hides file browser screen and redraws emulation screen
static void appDeactivateFileBrowser(void)
{
	// close file browser
	fbDeactivate();

	emuRefreshScreen();
	appShowHideStatistics();

	g_active_module = appAM_Emulation;
}