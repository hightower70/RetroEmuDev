/*****************************************************************************/
/* High resolution timer (1us) routines                                      */
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

///////////////////////////////////////////////////////////////////////////////
// Local variables

void sysHighresTimerInit(void)
{
	drvHighresTimerInit();
}


///////////////////////////////////////////////////////////////////////////////
// Delay (us resolution delay)
void sysHighresTimerDelay(uint32_t in_delay_ms)
{
	uint32_t start_time = sysHighresTimerGetTimestamp();
	uint32_t diff_time;
	
	do
	{
		diff_time = sysHighresTimerGetTimestamp() - start_time;
	}	while( diff_time < in_delay_ms );
}

///////////////////////////////////////////////////////////////////////////////
// Get ellapsed time since a timestamp (in us)
sysTimeStamp sysHighresTimerGetTimeSince(sysTimeStamp in_start_time_ms)
{
	sysTimeStamp diff_time;

	diff_time = sysHighresTimerGetTimestamp() - in_start_time_ms;
	
	return diff_time;
}

