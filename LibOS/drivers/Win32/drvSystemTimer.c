/*****************************************************************************/
/* System timer (1ms) driver                                                 */
/* (emulated on Win32)
/*                                                                           */
/* Copyright (C) 2014-2015 Laszlo Arvai                                      */
/* All rights reserved.                                                      */
/*                                                                           */
/* This software may be modified and distributed under the terms             */
/* of the BSD license.  See the LICENSE file for details.                    */
/*****************************************************************************/

///////////////////////////////////////////////////////////////////////////////
// Includes
#include <sysTimer.h>
#include <windows.h>

///////////////////////////////////////////////////////////////////////////////
// Init system timer
void drvSystemTimerInit(void)
{
}

///////////////////////////////////////////////////////////////////////////////
// Get system timer
sysTimeStamp sysTimerGetTimestamp(void)
{
  return (sysTimeStamp)GetTickCount();
}
