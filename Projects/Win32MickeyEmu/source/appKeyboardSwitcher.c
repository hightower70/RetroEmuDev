/*****************************************************************************/
/* Routes keyboard messages between functions                                */
/*                                                                           */
/* Copyright (C) 2015 Laszlo Arvai                                           */
/* All rights reserved.                                                      */
/*                                                                           */
/* This software may be modified and distributed under the terms             */
/* of the BSD license.  See the LICENSE file for details.                    */
/*****************************************************************************/

///////////////////////////////////////////////////////////////////////////////
// Includes
#include <appKeyboardSwitcher.h>
#include <emuHomelab.h>
#include <sysVirtualKeyboardCodes.h>

#include <windows.h>

///////////////////////////////////////////////////////////////////////////////
// Constants
#define KEY_STATE_BUFFER_SIZE 8

///////////////////////////////////////////////////////////////////////////////
// Module global variables
static uint16_t l_key_state_buffer[KEY_STATE_BUFFER_SIZE] = { 0 };
static uint32_t l_modifier_keys = 0;

///////////////////////////////////////////////////////////////////////////////
// Global variables
appActiveModule g_active_module;


///////////////////////////////////////////////////////////////////////////////
// Initializes keyboard switcher
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
// Keeps list
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
		if (in_device_number != 0)
			return;

		// store pressed key (Except modifier keys)
		if (in_event_param != sysVKC_SHIFT && in_event_param != sysVKC_CONTROL && in_event_param != sysVKC_MENU)
		{
			// store pressed event
			if (in_event_category == sysUIEC_Pressed)
			{
				wsprintf(buffer, L"pressed: %d (%c) %d\n", in_event_param, in_event_param, time - prev_time);
				OutputDebugString(buffer);

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
				wsprintf(buffer, L"released: %d (%c) %d\n", in_event_param, in_event_param, time - prev_time);
				OutputDebugString(buffer);

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
				emuUserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);
				break;
		}
	}
}

uint32_t sysUserInputGetModifiersState(uint8_t in_device_number)
{
	return l_modifier_keys;
}
