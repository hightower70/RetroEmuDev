/*****************************************************************************/
/* Wave player routines                                                      */
/*                                                                           */
/* Copyright (C) 2015 Laszlo Arvai                                           */
/* All rights reserved.                                                      */
/*                                                                           */
/* This software may be modified and distributed under the terms             */
/* of the BSD license.  See the LICENSE file for details.                    */
/*****************************************************************************/

///////////////////////////////////////////////////////////////////////////////
// Includes
#include <appWavePlayer.h>
#include <fileWave.h>

///////////////////////////////////////////////////////////////////////////////
// Module global variables
static fileStream* l_file_playing = sysNULL;
static fileWaveFormatChunk l_wave_format;

///////////////////////////////////////////////////////////////////////////////
/// @brief Starts playing wave file
/// @param File name of the wave file
/// @return True if playing was started, false if error occured
bool appWavePlayerStart(sysString in_file_name)
{
	bool success = false;

	// stops currently playing wave file
	appWavePlayerStop();

	// opens file
	l_file_playing = fileWaveOpen(in_file_name, &l_wave_format);
	if (l_file_playing != sysNULL)
	{
		success = true;
	}

	return success;
}

///////////////////////////////////////////////////////////////////////////////
/// @brief Stops playing wave file
void appWavePlayerStop(void)
{
	if (l_file_playing != sysNULL)
	{
		fileClose(l_file_playing);
		l_file_playing = sysNULL;
	}
}

///////////////////////////////////////////////////////////////////////////////
/// @brief Wave player task
void appWavePlayerTask(void)
{
	if (l_file_playing != sysNULL)
		return;

}