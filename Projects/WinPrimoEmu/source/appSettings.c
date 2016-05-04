/*****************************************************************************/
/* Application settings                                                      */
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
#include <appSettings.h>

/*****************************************************************************/
/* Global variables                                                          */
/*****************************************************************************/
appSettings g_application_settings;

void appSettingsInit(void)
{
	g_application_settings.FastCassetteOperation = true;
	g_application_settings.FullSpeed = false;
	g_application_settings.StatisticsVisible = false;

	strCopyString(g_application_settings.FileBrowserPath, fileUTIL_MAX_FILENAME_LENGTH, 0, "d:\\Projects\\STM32F429\\FileBrowser\\Projects\\WinHT1080Emu\\cas");
	strCopyString(g_application_settings.CassetteFileName, fileUTIL_MAX_FILENAME_LENGTH, 0, "d:\\Projects\\STM32F429\\FileBrowser\\Projects\\WinHT1080Emu\\cas\\galaxy.cas");
}