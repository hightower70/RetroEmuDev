/*****************************************************************************/
/* Routes keyboard messages between functions                                */
/*                                                                           */
/* Copyright (C) 2015 Laszlo Arvai                                           */
/* All rights reserved.                                                      */
/*                                                                           */
/* This software may be modified and distributed under the terms             */
/* of the BSD license.  See the LICENSE file for details.                    */
/*****************************************************************************/

#ifndef __appKeyboardSwitcher_h
#define __appKeyboardSwitcher_h

///////////////////////////////////////////////////////////////////////////////
// Includes
#include <sysTypes.h>

///////////////////////////////////////////////////////////////////////////////
// Constants
#define KEY_STATE_BUFFER_SIZE 8

///////////////////////////////////////////////////////////////////////////////
// Types
typedef enum 
{
	appAM_Emulation,
	appAM_FileBrowser,
	appAM_Menu
} appActiveModule;

///////////////////////////////////////////////////////////////////////////////
// Global variables
extern appActiveModule g_active_module;

///////////////////////////////////////////////////////////////////////////////
// Function prototypes
void appKeyboardSwitcherInit(void);


#endif