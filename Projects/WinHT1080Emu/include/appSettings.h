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

/*****************************************************************************/
/* Types                                                                     */
/*****************************************************************************/
typedef struct  
{
	bool FastCassetteOperation;
	bool FullSpeed;
	bool StatisticsVisible;
} appSettings;

extern appSettings g_application_settings;

void appSettingsInit(void);

#endif