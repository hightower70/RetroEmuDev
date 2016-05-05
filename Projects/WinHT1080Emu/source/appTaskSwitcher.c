/*****************************************************************************/
/* Switches execution task between modules                                   */
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
#include <sysTimer.h>
#include <emuHT1080.h>
#include <fbFileBrowser.h>
#include <sysVirtualKeyboardCodes.h>
#include <gcmGraphicsConfigMenu.h>
#include <appTaskSwitcher.h>
#include <appGUI.h>
#include <appConfigMenu.h>
#include <appSettings.h>

/*****************************************************************************/
/* Global variables                                                          */
/*****************************************************************************/
appActiveModule g_active_module = appAM_Emulation;

/*****************************************************************************/
/* Module global variables                                                   */
/*****************************************************************************/
static sysTimeStamp l_emulation_statistics_timestamp;

/*****************************************************************************/
/* Functions                                                                 */
/*****************************************************************************/

///////////////////////////////////////////////////////////////////////////////
///@brief Main task function and task switching based on current active module
void sysMainTask(void)
{
	uint32_t emulaton_statistics_time;

	switch (g_active_module)
	{
		// emulation
		case appAM_Emulation:
			emuTask();

			// update emulation statistics
			if (g_application_settings.StatisticsVisible)
			{
				emulaton_statistics_time = sysTimerGetTimeSince(l_emulation_statistics_timestamp);
				if (emulaton_statistics_time > 1000)
				{
					emuUpdateStatistics(emulaton_statistics_time);
					emuResetStatistics();

					l_emulation_statistics_timestamp = sysTimerGetTimestamp();

					appRefreshStatistics();
				}
			}
			break;

		// file browser
		case appAM_FileBrowser:
			fbTask();
			break;
	}
}
