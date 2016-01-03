/*****************************************************************************/
/* File browser application                                                  */
/*  Renderer for black and white screens                                     */
/*                                                                           */
/* Copyright (C) 2015 Laszlo Arvai                                           */
/* All rights reserved.                                                      */
/*                                                                           */
/* This software may be modified and distributed under the terms             */
/* of the BSD license.  See the LICENSE file for details.                    */
/*****************************************************************************/

///////////////////////////////////////////////////////////////////////////////
// Includes
#include <guiBlackAndWhiteGraphics.h>
#include <fbRenderer.h>
#include <sysResource.h>
#include <fbIconMapper.h>
#include <fileUtils.h>
#include "sysConfig.h"

///////////////////////////////////////////////////////////////////////////////
// Constats
#define STRING_BUFFER_LENGTH 20

#if !defined(fbDEFAULT_FONT)
#error "File browser is not configured."
#endif

//#define fbDEFAULT_FONT REF_FNA_DOS

#define fbHEADER_HEIGHT fbFILE_LIST_TOP
#define fbHEADER_TEXT_HEIGHT 12
#define fbHEADER_TEXT_LEFT 3
#define fbHEADER_TEXT_TOP (fbHEADER_HEIGHT - fbHEADER_TEXT_HEIGHT) / 2
#define fbHEADER_FONT fbDEFAULT_FONT

#define fbFILE_LIST_TOP 18
#define fbFILE_LIST_ITEM_HEIGHT 14
#define fbFILE_LIST_DISPLAYED_ITEM_COUNT ((guiSCREEN_HEIGHT - fbFILE_LIST_TOP - fbFOOTER_MIN_HEIGHT) / fbFILE_LIST_ITEM_HEIGHT)
#define fbFILE_LIST_HEIGHT (fbFILE_LIST_ITEM_HEIGHT * fbFILE_LIST_DISPLAYED_ITEM_COUNT)
#define fbFILE_LIST_FONT fbDEFAULT_FONT

#define fbFOOTER_TEXT_HEIGHT 12
#define fbFOOTER_TEXT_LEFT 2
#define fbFOOTER_MIN_HEIGHT 11
#define fbFOOTER_TOP (fbFILE_LIST_TOP + fbFILE_LIST_HEIGHT + 1)
#define fbFOOTER_HEIGHT (guiSCREEN_HEIGHT - fbFOOTER_TOP)
#define fbFOOTER_FONT fbDEFAULT_FONT

#define FILE_HEADER_FOOTER_FONT fbFILE_LIST_FONT
#define WAIT_INDICATOR_PADDING 5
#define WAIT_INDICATOR_MARGIN 3

///////////////////////////////////////////////////////////////////////////////
// Local functions


///////////////////////////////////////////////////////////////////////////////
/// @brief Gets number of file items to display. It depens on the height of the screen and the height of the header and footer.
/// @return Number of items (lines) to display.
uint16_t fbRendererGetDisplayableItemCount(void)
{
	return fbFILE_LIST_DISPLAYED_ITEM_COUNT;
}

///////////////////////////////////////////////////////////////////////////////
/// @brief  Renders one items (file or directory). If null item is specified than empty item will be rendered.
/// @param in_file_info Item to render. When null than empty item (clear background) will be rendered.
/// @param in_screen_index Position of the item on the list (the topmost item has zero index)
/// @param in_selected True if item must be rednered as selected item
/// @param in_horizontal_text_offset Offset of the item text. Used for horizontal item text scrolling.
uint16_t fbRenderItem(fbFileInformation* in_file_info, uint16_t in_screen_index, bool in_selected, uint16_t in_horizontal_text_offset)
{
	sysResourceAddress icon;
	uint16_t top = fbFILE_LIST_TOP + in_screen_index * fbFILE_LIST_ITEM_HEIGHT;
	guiSize icon_size;
	guiSize bracket_size;
	guiSize text_size;
	guiRect clipping_rect;
	int16_t oversize;

	// sanity check
	if(in_file_info == sysNULL)
	{
		// open canvas
		guiOpenCanvas( 0, top, guiSCREEN_WIDTH-1, top + fbFILE_LIST_ITEM_HEIGHT);

		guiSetSystemBrush(0);
		guiFillRectangle(0, top, guiSCREEN_WIDTH-1, top + fbFILE_LIST_ITEM_HEIGHT);

		// close canvas
		guiCloseCanvas(true);

		return 0;
	}
	else
	{
		// init
		bracket_size.Width = 0;
		bracket_size.Height = 0;

		// open canvas
		guiOpenCanvas( 0, top, guiSCREEN_WIDTH-1, top + fbFILE_LIST_ITEM_HEIGHT);

		// clear background
		if(in_selected)
		{
			guiSetPen(1);
			guiSetDrawMode(guiDM_Inverse);
			guiSetSystemBrush(2);
		}
		else
		{
			guiSetPen(0);
			guiSetDrawMode(0);
			guiSetSystemBrush(0);
		}

		guiFillRectangle(0, top, guiSCREEN_WIDTH-1, top + fbFILE_LIST_ITEM_HEIGHT);

		// draw icon
		icon_size.Width = 0;
		icon_size.Height = 0;
		icon = fbGetFileIcon(in_file_info);
		if(icon != sysNULL)
		{
			icon_size = guiGetBitmapSize(icon);
			guiDrawBitmap(1, top + (fbFILE_LIST_ITEM_HEIGHT - icon_size.Height + 1) / 2, icon);
		}

		// display name
		guiSetFont(fbFILE_LIST_FONT);

		if((in_file_info->Flags & fbFF_FOLDER) != 0)
		{
			bracket_size = guiGetTextExtent("[");
		}

		text_size = guiGetTextExtent(in_file_info->FileName);
		clipping_rect.Left = icon_size.Width + 2;
		clipping_rect.Top = top + 2;
		clipping_rect.Right = guiSCREEN_WIDTH - 1;
		clipping_rect.Bottom = clipping_rect.Top + text_size.Height;

		guiSetClippingRect(clipping_rect);
		guiDrawText(clipping_rect.Left - in_horizontal_text_offset + bracket_size.Width, clipping_rect.Top, in_file_info->FileName);
		if((in_file_info->Flags & fbFF_FOLDER) != 0)
		{
			guiDrawText(clipping_rect.Left - in_horizontal_text_offset, clipping_rect.Top, "[");
			guiDrawText(clipping_rect.Left - in_horizontal_text_offset + text_size.Width + bracket_size.Width, clipping_rect.Top, "]");
		}
		guiResetClipping();

		guiSetDrawMode(0);

		// close canvas
		guiCloseCanvas(true);

		// determine item text oversize
		oversize = (clipping_rect.Left + text_size.Width + 2 * bracket_size.Width) - guiSCREEN_WIDTH;

		if(oversize < 0)
		{
			//		guiFillRectangle(guiSCREEN_WIDTH + oversize, top, guiSCREEN_WIDTH - 1, top + fbFILE_LIST_ITEM_HEIGHT - 1);

			oversize = 0;
		}
	}

	return oversize;
}


///////////////////////////////////////////////////////////////////////////////
/// @brief Renders header (current path)
/// @param in_title Title string (displayed before the path)
/// @param in_path Current path string
void fbRenderHeader(sysString in_title, sysString in_path)
{
	guiSize size;
	sysChar path[fileMAX_PATH+1];
	bool repeat;

	// store path
	strCopyString(path, fileMAX_PATH, 0, in_path);

	// open canvas
	guiOpenCanvas( 0, 0, guiSCREEN_WIDTH-1, fbHEADER_HEIGHT);

	// separator line
	guiSetPen(1);
	guiDrawHorizontalLine(0, guiSCREEN_WIDTH-1, fbHEADER_HEIGHT - 1);

	// background
	guiSetSystemBrush(1);
	guiFillRectangle(0, 0, guiSCREEN_WIDTH-1, fbHEADER_HEIGHT - 2);

	guiSetFont(fbHEADER_FONT);

	// shorten path
	do
	{
		repeat = false;
		size = guiGetTextExtent(path);
		if( size.Width > guiSCREEN_WIDTH - 6 )
		{
			if(!fileShortenDisplayPath(path, fileMAX_PATH))
				repeat = false;
			else
				repeat = true;
		}

	} while(repeat);

	// text box
	guiSetPen(1);
	guiDrawRectangle(fbHEADER_TEXT_LEFT - 1, fbHEADER_TEXT_TOP - 2, guiSCREEN_WIDTH - fbHEADER_TEXT_LEFT, fbHEADER_TEXT_TOP + fbHEADER_TEXT_HEIGHT + 1);

	guiSetSystemBrush(0);
	guiFillRectangle(fbHEADER_TEXT_LEFT, fbHEADER_TEXT_TOP - 1, guiSCREEN_WIDTH - fbHEADER_TEXT_LEFT - 1, fbHEADER_TEXT_TOP + fbHEADER_TEXT_HEIGHT);

	// write path
	guiSetClipping(fbHEADER_TEXT_LEFT + 1, fbHEADER_TEXT_TOP, guiSCREEN_WIDTH - fbHEADER_TEXT_LEFT - 2, fbHEADER_TEXT_TOP + fbHEADER_TEXT_HEIGHT);
	guiDrawText(fbHEADER_TEXT_LEFT + 1, fbHEADER_TEXT_TOP, path);
	guiResetClipping();

	// close canvas
  guiCloseCanvas(true);
}

///////////////////////////////////////////////////////////////////////////////
/// @brief Renders footer (file information area)
/// @param in_file_index Index of the selectd file
/// @param in_file_count Total number of files
/// @param in_file_info Information of the current file
void fbRenderFooter(uint16_t in_file_index, uint16_t in_file_count, fbFileInformation* in_file_info)
{
	sysChar buffer[STRING_BUFFER_LENGTH];
	sysStringLength pos;
	guiSize counter_size;
	guiSize datetime_size;
	guiSize filesize_size;

	// open canvas
	guiOpenCanvas( 0, fbFOOTER_TOP, guiSCREEN_WIDTH-1, guiSCREEN_HEIGHT-1);

	guiSetPen(1);
	guiDrawHorizontalLine(0,guiSCREEN_WIDTH-1, fbFOOTER_TOP);

	guiSetSystemBrush(0);
	guiFillRectangle(0, fbFOOTER_TOP + 1, guiSCREEN_WIDTH-1, guiSCREEN_HEIGHT-1);

	guiSetPen(1);

	guiSetFont(fbFOOTER_FONT);

	// display count
	pos = strWordToString(buffer, STRING_BUFFER_LENGTH, in_file_index, 0, 0, 0);
	pos = strCopyConstString(buffer, STRING_BUFFER_LENGTH, pos, (sysConstString)"/");
	pos = strWordToStringPos(buffer, STRING_BUFFER_LENGTH, pos, in_file_count, 0, 0, 0);
	counter_size = guiGetTextExtent(buffer);
	guiDrawText( 1, fbFOOTER_TOP + 2 + (guiSCREEN_HEIGHT - fbFOOTER_TOP - fbFOOTER_TEXT_HEIGHT) / 2, buffer);

	if(in_file_info != sysNULL)
	{
		// display file date
		pos = 0;
		pos = sysConvertDateToString(buffer, STRING_BUFFER_LENGTH, pos, &in_file_info->DateTime, '-');
		pos = strCopyConstString(buffer, STRING_BUFFER_LENGTH, pos, (sysConstString)" ");
		pos = strWordToStringPos(buffer, STRING_BUFFER_LENGTH, pos, in_file_info->DateTime.Hour, 2, 0, TS_NO_ZERO_BLANKING);
		pos = strCopyConstString(buffer, STRING_BUFFER_LENGTH, pos, (sysConstString)":");
		pos = strWordToStringPos(buffer, STRING_BUFFER_LENGTH, pos, in_file_info->DateTime.Minute, 2, 0, TS_NO_ZERO_BLANKING);
		datetime_size = guiGetTextExtent(buffer);
		guiDrawText( guiSCREEN_WIDTH - datetime_size.Width, fbFOOTER_TOP + 2 + (guiSCREEN_HEIGHT - fbFOOTER_TOP - fbFOOTER_TEXT_HEIGHT) / 2, buffer);
	
		// display size (only for files)
		if((in_file_info->Flags & BV(fbFF_FOLDER_FILE_BIT)) == fbFF_FILE)
		{
			fileSizeToString(buffer, STRING_BUFFER_LENGTH, in_file_info->Size);
			filesize_size = guiGetTextExtent(buffer);
			guiDrawText( (guiSCREEN_WIDTH + counter_size.Width - datetime_size.Width - filesize_size.Width) / 2, fbFOOTER_TOP + 2 + (guiSCREEN_HEIGHT - fbFOOTER_TOP - fbFOOTER_TEXT_HEIGHT) / 2, buffer);
		}
	}

	guiSetDrawMode( 0 );

	// close canvas
  guiCloseCanvas(true);
}

///////////////////////////////////////////////////////////////////////////////
/// @brief Copies frame buffer content to the display. Calls empty driver function when no frame buffer is used.
void fbRefreshScreen(void)
{
	guiRefreshScreen();
}


///////////////////////////////////////////////////////////////////////////////
/// @brief Displays first animation phase (and border) of the wait indiactor
void fbRenderWaitIndicatorShow(void)
{
	guiSize size;
	guiCoordinate x1,y1;
	guiCoordinate x2,y2;

	size = guiGetBitmapSize(REF_BMP_PROGRESS0);

	// clear background
	x1 = (guiSCREEN_WIDTH/2) - (size.Width + 2 * WAIT_INDICATOR_MARGIN + 2 * WAIT_INDICATOR_PADDING) / 2;
	y1 = (guiSCREEN_HEIGHT/2) - (size.Height + 2 * WAIT_INDICATOR_MARGIN + 2 * WAIT_INDICATOR_PADDING) / 2;

	x2 = (guiSCREEN_WIDTH/2) + (size.Width + 2 * WAIT_INDICATOR_MARGIN + 2 * WAIT_INDICATOR_PADDING) / 2;
	y2 = (guiSCREEN_HEIGHT/2) + (size.Height + 2 * WAIT_INDICATOR_MARGIN + 2 * WAIT_INDICATOR_PADDING) / 2;

	// open canvas
	guiOpenCanvas( x1, y1, x2, y2);

	guiSetSystemBrush(0);
	guiFillRectangle(x1, y1, x2, y2);

	// draw border
	x1 = (guiSCREEN_WIDTH/2) - (size.Width + 2 * WAIT_INDICATOR_PADDING) / 2;
	y1 = (guiSCREEN_HEIGHT/2) - (size.Height + 2 * WAIT_INDICATOR_PADDING) / 2;

	x2 = (guiSCREEN_WIDTH/2) + (size.Width + 2 * WAIT_INDICATOR_PADDING) / 2;
	y2 = (guiSCREEN_HEIGHT/2) + (size.Height + 2 * WAIT_INDICATOR_PADDING) / 2;

	guiSetPen(1);
	guiDrawRectangle(x1, y1, x2, y2);

	// draw first phase of the bitmap
	x1 = (guiSCREEN_WIDTH/2) - (size.Width/2);
	y1 = (guiSCREEN_HEIGHT/2) - (size.Height/2);

	guiDrawBitmap(x1,y1,REF_BMP_PROGRESS0);

	// close canvas
  guiCloseCanvas(true);
}

///////////////////////////////////////////////////////////////////////////////
/// @brief Displays current animation phase of the wait indiactor
/// @param in_current_phase Current phase index
void fbRenderWaitIndicatorNext(uint8_t* in_current_phase)
{
	guiSize size;
	guiCoordinate x1,y1;
	static sysResourceAddress bitmaps[8] = { REF_BMP_PROGRESS0, REF_BMP_PROGRESS1, REF_BMP_PROGRESS2, REF_BMP_PROGRESS3, REF_BMP_PROGRESS4, REF_BMP_PROGRESS5 , REF_BMP_PROGRESS6, REF_BMP_PROGRESS7 };

	if(++(*in_current_phase) >= 8)
		*in_current_phase = 0;

	size = guiGetBitmapSize(bitmaps[*in_current_phase]);

	// draw current phase of the bitmap
	x1 = (guiSCREEN_WIDTH/2) - (size.Width/2);
	y1 = (guiSCREEN_HEIGHT/2) - (size.Height/2);

	// open canvas
	guiOpenCanvas( x1, y1, x1 + size.Width, y1 + size.Height);

	guiDrawBitmap(x1, y1, bitmaps[*in_current_phase]);

	// close canvas
  guiCloseCanvas(true);
}