/*****************************************************************************/
/* Wave player (Win32 wave driver)                                           */
/*                                                                           */
/* Copyright (C) 2015 Laszlo Arvai                                           */
/* All rights reserved.                                                      */
/*                                                                           */
/* This software may be modified and distributed under the terms             */
/* of the BSD license.  See the LICENSE file for details.                    */
/*****************************************************************************/

///////////////////////////////////////////////////////////////////////////////
// Includes
#include <Windows.h>
#include <drvWavePlayer.h>

#pragma comment(lib,"Winmm.lib") // Winsock Library

///////////////////////////////////////////////////////////////////////////////
// Constants

///////////////////////////////////////////////////////////////////////////////
// Types

// wave output buffer
typedef struct
{
	bool      Free;
	WAVEHDR    Header;
  drvWavePlayerBufferType Buffer[drvWAVEPLAYER_BUFFER_LENGTH];
} WaveOutBuffer;

///////////////////////////////////////////////////////////////////////////////
// Local functions

///////////////////////////////////////////////////////////////////////////////
// Module global variables

static HWAVEOUT l_waveout_handle = NULL;
static HANDLE l_waveout_event = NULL;
static WaveOutBuffer l_waveout_buffer[drvWAVEPLAYER_BUFFER_COUNT];
static DWORD	l_thread_id			= 0;
static HANDLE	l_thread_handle = NULL;

///////////////////////////////////////////////////////////////////////////////
// Opens wave output device
void drvWavePlayerInitialize(void)
{
	MMRESULT result;
  WAVEFORMATEX wave_format;
  bool success = true;
	int i;

  // prepare for opening
	ZeroMemory( &wave_format, sizeof(wave_format) );

	wave_format.wBitsPerSample		= 16;
	wave_format.wFormatTag				= WAVE_FORMAT_PCM;
	wave_format.nChannels 				= 1;
	wave_format.nSamplesPerSec		= drvWAVEPLAYER_SAMPLE_RATE;
	wave_format.nAvgBytesPerSec		= wave_format.nSamplesPerSec * wave_format.wBitsPerSample / 8;
	wave_format.nBlockAlign 			= wave_format.wBitsPerSample * wave_format.nChannels / 8;

  // open device
  result = waveOutOpen( &l_waveout_handle, WAVE_MAPPER, &wave_format, (DWORD)l_waveout_event, 0, 0 );
	if( result != MMSYSERR_NOERROR )
		success = false;

  // prepare buffers
	if(success)
  {
		for(i = 0; i < drvWAVEPLAYER_BUFFER_COUNT; i++)
		{
			ZeroMemory( &l_waveout_buffer[i].Header, sizeof( WAVEHDR ) );
			l_waveout_buffer[i].Header.dwBufferLength = sizeof(l_waveout_buffer[i].Buffer);
			l_waveout_buffer[i].Header.lpData         = (LPSTR)(l_waveout_buffer[i].Buffer);
			l_waveout_buffer[i].Header.dwFlags        = 0;
			l_waveout_buffer[i].Free                  = true;
		}
	}
}

///////////////////////////////////////////////////////////////////////////////
// Closes wave output device
void drvWavePlayerCleanUp(void)
{
	int i;

	// close wave out device
	if(l_waveout_handle != NULL)
	{
		// stop wave out
		waveOutReset(l_waveout_handle);
		
		// reset buffers
		for(i = 0; i < drvWAVEPLAYER_BUFFER_COUNT; i++)
		{
			if(!l_waveout_buffer[i].Free && (l_waveout_buffer[i].Header.dwFlags & WHDR_DONE) != 0)
			{
				// release header
				waveOutUnprepareHeader(l_waveout_handle, &l_waveout_buffer[i].Header, sizeof(WAVEHDR));
				l_waveout_buffer[i].Free = true;
				l_waveout_buffer[i].Header.dwFlags = 0;
			}
		}

		// close device
		waveOutClose(l_waveout_handle);

		l_waveout_handle = NULL;
	}
}

///////////////////////////////////////////////////////////////////////////////
// Adds the specified buffer to the playback queue
void drvWavePlayerPlayBuffer(uint8_t in_buffer_index)
{
	// flag header
	l_waveout_buffer[in_buffer_index].Free = false;

  // prepare header
	waveOutPrepareHeader(l_waveout_handle, &l_waveout_buffer[in_buffer_index].Header, sizeof(WAVEHDR));

	// write header
	waveOutWrite(l_waveout_handle, &l_waveout_buffer[in_buffer_index].Header, sizeof(WAVEHDR));
}

///////////////////////////////////////////////////////////////////////////////
// Gets next free buffer index
uint8_t drvWavePlayerGetFreeBufferIndex(void)
{
	int i;

	// check for free buffer
	for(i = 0; i < drvWAVEPLAYER_BUFFER_COUNT; i++)
	{
		if(l_waveout_buffer[i].Free)
		{
			// buffer is free
			return i;
		}
		else
		{
			// buffer is not flagged for free, check if driver already done with the buffer
			if((l_waveout_buffer[i].Header.dwFlags & WHDR_DONE) != 0)
			{
				// release header
				waveOutUnprepareHeader( l_waveout_handle, &l_waveout_buffer[i].Header, sizeof(WAVEHDR));
				l_waveout_buffer[i].Free = true;
				l_waveout_buffer[i].Header.dwFlags = 0;

				return i;
			}
		}
	}

	return drvWAVEPLAYER_INVALID_BUFFER_INDEX;
}

drvWavePlayerBufferType* drvWaveGetBuffer(uint8_t in_buffer_index)
{
	return l_waveout_buffer[in_buffer_index].Buffer;
}

