/*****************************************************************************/
/* HT1080Z Emulator                                                          */
/*   Screen rendering functions                                              */
/*                                                                           */
/* Copyright (C) 2015 Laszlo Arvai                                           */
/* All rights reserved.                                                      */
/*                                                                           */
/* This software may be modified and distributed under the terms             */
/* of the BSD license.  See the LICENSE file for details.                    */
/*****************************************************************************/

///////////////////////////////////////////////////////////////////////////////
// Includes
#include <emuHT1080.h>
#include <drvBlackAndWhiteGraphics.h>
#include <guiBlackAndWhiteGraphics.h>



// character ROM
extern const unsigned char ht_s1_chargen_rom[];

#define emuHT1080_ROM_CHARACTER_HEIGHT 16

void emuHT1080RenderScanLine(uint16_t in_line_index)
{
	int character_memory_row_index = in_line_index / emuHT1080_CHARACTER_HEIGHT;
	int character_row_index = in_line_index % emuHT1080_CHARACTER_HEIGHT;
	uint8_t* frame_buffer_pointer = &g_gui_frame_buffer[in_line_index * guiFRAME_BUFFER_ROW_LENGTH];
	uint8_t* video_memory_pointer = &g_video_ram[character_memory_row_index * emuHT1080_SCREEN_WIDTH_IN_CHARACTER];
	uint16_t pixel_buffer;
	uint8_t pixel_shift;
	int column_index;
	int pixel_byte;
	uint8_t character_to_display;

	if(in_line_index == 0)
		guiOpenCanvas(0, 0, guiSCREEN_WIDTH - 1, guiSCREEN_HEIGHT - 1);

	pixel_buffer = 0;
	pixel_shift = 8;
	for (column_index = 0; column_index < emuHT1080_SCREEN_WIDTH_IN_CHARACTER; column_index++)
	{
		// determine pixels to display
		character_to_display = *video_memory_pointer++;

		if ((character_to_display & 0x80) == 0)
		{
			pixel_byte = ht_s1_chargen_rom[character_to_display * emuHT1080_ROM_CHARACTER_HEIGHT + character_row_index];
		}
		else
		{
			// graphics display
			character_to_display = (character_to_display >> ((character_row_index / 4) * 2)) & 0x3;

			pixel_byte = 0;
			if ((character_to_display & 0x01) != 0)
				pixel_byte |= 0xe0;

			if ((character_to_display & 0x02) != 0)
				pixel_byte |= 0x1c;
		}
		
		// assemble frame buffer byte from pixel data
		pixel_buffer |= pixel_byte << pixel_shift;

		if (pixel_shift <= emuHT1080_CHARACTER_WIDTH)
		{
			*frame_buffer_pointer++ = (pixel_buffer >> 8) & 0xff;
			pixel_buffer <<= 8;
			pixel_shift = pixel_shift + 8 - emuHT1080_CHARACTER_WIDTH;
		}
		else
		{
			pixel_shift -= emuHT1080_CHARACTER_WIDTH;
		}
	}

	if (in_line_index >= emuHT1080_SCREEN_HEIGHT_IN_PIXEL - 1)
		guiCloseCanvas(true);
}

