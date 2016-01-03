/*****************************************************************************/
/* Double buffered audio sample playback                                     */
/*                                                                           */
/* Copyright (C) 2015 Laszlo Arvai                                           */
/* All rights reserved.                                                      */
/*                                                                           */
/* This software may be modified and distributed under the terms             */
/* of the BSD license.  See the LICENSE file for details.                    */
/*****************************************************************************/

///////////////////////////////////////////////////////////////////////////////
// Includes
#include <drvWavePlayer.h>

void drvWavePlayerInitialize(void)
{
}


void drvWavePlayerPlayBuffer(uint8_t in_buffer_index)
{
}

 uint8_t drvWavePlayerGetFreeBufferIndex(void)
{
return drvWAVEPLAYER_INVALID_BUFFER_INDEX;
}

drvWavePlayerBufferType* drvWaveGetBuffer(uint8_t in_buffer_index)
{
	return sysNULL;

}