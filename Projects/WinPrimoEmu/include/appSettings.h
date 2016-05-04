/*****************************************************************************/
/* Application settings                                                      */
/*                                                                           */
/* Copyright (C) 2015 Laszlo Arvai                                           */
/* All rights reserved.                                                      */
/*                                                                           */
/* This software may be modified and distributed under the terms             */
/* of the BSD license.  See the LICENSE file for details.                    */
/*****************************************************************************/

#ifndef __appSettings_h
#define __appSettings_h

/*****************************************************************************/
/* Includes                                                                  */
/*****************************************************************************/
#include <sysTypes.h>
#include <fileUtils.h>

/*****************************************************************************/
/* Constants                                                                 */
/*****************************************************************************/
#define emuHT1080_EM_HT1080Z

/*****************************************************************************/
/* Types                                                                     */
/*****************************************************************************/
typedef struct  
{
	bool FastCassetteOperation;
	bool FullSpeed;
	bool StatisticsVisible;
	uint8_t EmulatedModel;
	sysChar CassetteFileName[fileUTIL_MAX_FILENAME_LENGTH];
	sysChar FileBrowserPath[fileUTIL_MAX_FILENAME_LENGTH];
} appSettings;

extern appSettings g_application_settings;

void appSettingsInit(void);

#endif