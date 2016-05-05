/*****************************************************************************/
/* Switches execution task between modules                                   */
/*                                                                           */
/* Copyright (C) 2015 Laszlo Arvai                                           */
/* All rights reserved.                                                      */
/*                                                                           */
/* This software may be modified and distributed under the terms             */
/* of the BSD license.  See the LICENSE file for details.                    */
/*****************************************************************************/

#ifndef __appTaskSwitcher_h
#define __appTaskSwitcher_h

/*****************************************************************************/
/* Includes                                                                  */
/*****************************************************************************/
#include <sysTypes.h>

/*****************************************************************************/
/* Types                                                                     */
/*****************************************************************************/
typedef enum
{
	appAM_Emulation,
	appAM_FileBrowser,
	appAM_Menu
} appActiveModule;

/*****************************************************************************/
/* global variables                                                          */
/*****************************************************************************/
extern appActiveModule g_active_module;

#endif
