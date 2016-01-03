/*****************************************************************************/
/* TapeBox applicaiton main source                                           */
/*                                                                           */
/* Copyright (C) 2014 Laszlo Arvai                                           */
/* All rights reserved.                                                      */
/*                                                                           */
/* This software may be modified and distributed under the terms             */
/* of the BSD license.  See the LICENSE file for details.                    */
/*****************************************************************************/

///////////////////////////////////////////////////////////////////////////////
// Includes
#include <appTapeBox.h>
#include <fbFileBrowser.h>
#include <fileStandardFunctions.h>
#include <fileUtils.h>
#include <appWavePlayer.h>


void sysUserInputEventHandler(uint8_t in_device_number, sysUserInputEventCategory in_event_category, sysUserInputEventType in_event_type, uint32_t in_event_param)
{
	fbUserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);
}


///////////////////////////////////////////////////////////////////////////////
/// @brief 
void fbFileSelectionHandler(void)
{
	sysString extension;
	fbFileInformation* file_information = fbGetSelectedFileInformation();
	sysChar filename_buffer[fileFAT_MAX_FILENAME_LENGTH + 1];


	if (file_information == sysNULL)
		return;

	// get extension
	extension = fileGetFileNameExtension(file_information->FileName);

	if (strCompareConstStringNoCase(extension, "wav") == 0)
	{
		fbGetSelectedFullFileName(filename_buffer, fileFAT_MAX_FILENAME_LENGTH);
		appWavePlayerStop();
		appWavePlayerStart(filename_buffer);
	}
}
