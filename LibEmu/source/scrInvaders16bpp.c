#include <emuInvaders.h>
#include <guiColorGraphics.h>
#include <emuInvadersResource.h>

//--------------------------------------------------------------
// Used Colors for 16 bit color depth
// Red   (5bit) -> Bit15-Bit11
// Green (6bit) -> Bit10-Bit5
// Blue  (5bit) -> Bit4-Bit0
//--------------------------------------------------------------
#define  RGB_COL_BLACK          0x0000
#define  RGB_COL_GREEN          0xE007
#define  RGB_COL_RED            0x00F8
#define  RGB_COL_WHITE          0xFFFF

static uint16_t l_line_buffer[emuINVADERS_SCREEN_HEIGHT];

// Space Invaders Screen Color Overlay
//             < 224 >
// -------------------------------
//|WHITE            ^             |
//|                32             |
//|                 v             |
//|-------------------------------|
//|RED              ^             |
//|                32             |
//|                 v             |
//|-------------------------------|
//|WHITE                          |
//|         < 224 >               |
//|                               |
//|                 ^             |  ^
//|                120            | 256
//|                 v             |  v
//|                               |
//|                               |
//|                               |
//|-------------------------------|
//|GREEN                          |
//| ^                  ^          |
//|56        ^        56          |
//| v       72         v          |
//|____      v      ______________|
//|  ^  |          | ^            |
//|<16> |  < 118 > |16   < 90 >   |
//|  v  |          | v            |
//|WHITE|          |         WHITE|
// -------------------------------

#define SET_PIXEL(address, data, mask, color, background_pointer)  if((data & mask)!=0) { *address = color; }	else { *address = drvResourceReadWord(background_pointer); }

void emuInvadersRenderScanLine(uint16_t in_line_index)
{
	uint16_t pixel_color=RGB_COL_BLACK;
	int16_t invaders_row_index;
	uint8_t screen_data;
	uint8_t* invaders_video_mem;
	uint16_t* line_buffer_address;
	sysResourceAddress background_data;
	guiSize background_size;

	// init pointers
  invaders_video_mem = &Z80_RAM[emuINVADERS_VIDEO_RAM_START - emuINVADERS_RAM_START + in_line_index * emuINVADERS_SCREEN_HEIGHT / 8];
	line_buffer_address = &l_line_buffer[emuINVADERS_SCREEN_HEIGHT-1];
	background_data = guiGetBitmapData(REF_BMP_BACKGROUND);
	background_size = guiGetBitmapSize(REF_BMP_BACKGROUND);

	background_data += background_size.Width * sizeof(uint16_t) * (emuINVADERS_SCREEN_TOP + emuINVADERS_SCREEN_HEIGHT-1) + (emuINVADERS_SCREEN_LEFT + in_line_index) * sizeof(uint16_t);

	for(invaders_row_index = emuINVADERS_SCREEN_HEIGHT - 1; invaders_row_index >= 0; invaders_row_index -= 8)
	{
		// get screen data
		screen_data = *invaders_video_mem++;

		// pixel color
		if(invaders_row_index < 32)
		{
			pixel_color = RGB_COL_WHITE;
		}
		else
		{
			if(invaders_row_index < 64)
			{
				pixel_color = RGB_COL_RED;
			}
			else
			{
				if(invaders_row_index < 184)
				{
					pixel_color = RGB_COL_WHITE;
				}
				else
				{
					if(invaders_row_index < 240)
					{
						pixel_color = RGB_COL_GREEN;
					}
					else
					{
						if(in_line_index < 16 || in_line_index > 134)
						{
							pixel_color = RGB_COL_WHITE;
						}
						else
						{
							pixel_color = RGB_COL_GREEN;
						}
					}
				}
			}
		}

		// process one byte (8 pixel)
		SET_PIXEL(line_buffer_address, screen_data, 0x01, pixel_color, background_data);
		line_buffer_address--;
		background_data -= background_size.Width * sizeof(uint16_t);
		SET_PIXEL(line_buffer_address, screen_data, 0x02, pixel_color, background_data);
		line_buffer_address--;
		background_data -= background_size.Width * sizeof(uint16_t);
		SET_PIXEL(line_buffer_address, screen_data, 0x04, pixel_color, background_data);
		line_buffer_address--;
		background_data -= background_size.Width * sizeof(uint16_t);
		SET_PIXEL(line_buffer_address, screen_data, 0x08, pixel_color, background_data);
		line_buffer_address--;
		background_data -= background_size.Width * sizeof(uint16_t);
		SET_PIXEL(line_buffer_address, screen_data, 0x10, pixel_color, background_data);
		line_buffer_address--;
		background_data -= background_size.Width * sizeof(uint16_t);
		SET_PIXEL(line_buffer_address, screen_data, 0x20, pixel_color, background_data);
		line_buffer_address--;
		background_data -= background_size.Width * sizeof(uint16_t);
		SET_PIXEL(line_buffer_address, screen_data, 0x40, pixel_color, background_data);
		line_buffer_address--;
		background_data -= background_size.Width * sizeof(uint16_t);
		SET_PIXEL(line_buffer_address, screen_data, 0x80, pixel_color, background_data);
		line_buffer_address--;
		background_data -= background_size.Width * sizeof(uint16_t);
	}

	guiBitblt(in_line_index + emuINVADERS_SCREEN_LEFT, emuINVADERS_SCREEN_TOP, 1, emuINVADERS_SCREEN_HEIGHT, 0, 0, 1, emuINVADERS_SCREEN_HEIGHT, l_line_buffer, 16);
}


