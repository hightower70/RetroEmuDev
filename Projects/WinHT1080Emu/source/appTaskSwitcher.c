#include <emuHT1080.h>
#include <fbFileBrowser.h>
#include <sysVirtualKeyboardCodes.h>
#include <gcmGraphicsConfigMenu.h>

typedef enum
{
	appAT_Emulation,
	appAT_FileBrowser,
	appAT_ConfigMenu
} appActiveTask;

appActiveTask g_active_task = appAT_Emulation;

void sysMainTask(void)
{
	switch (g_active_task)
	{
		case appAT_Emulation:
			emuHT1080Task();
			break;

		case appAT_FileBrowser:
			fbTask();
			break;
	}
}

void drvUserInputEventHandler(uint8_t in_device_number, sysUserInputEventCategory in_event_category, sysUserInputEventType in_event_type, uint32_t in_event_param)
{
	switch (g_active_task)
	{
		case appAT_Emulation:
			if (in_event_type == sysUIET_Key)
			{
				switch (in_event_param)
				{
					// open config menu
					case sysVKC_F10:
						g_active_task = appAT_ConfigMenu;

						appOpenConfigMenu();
						break;

					case sysVKC_F2:
						g_active_task = appAT_FileBrowser;

						fbActivate("c:\\");
						break;

					default:
						emuHT1080UserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);
						break;
				}
			}
			else
			{
				emuHT1080UserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);
			}
			break;

		case appAT_FileBrowser:
			if (in_event_type == sysUIET_Key && in_event_param == sysVKC_ESCAPE)
			{
				fbDeactivate();
			}
			else
			{
				fbUserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);
			}
			break;

		case appAT_ConfigMenu:
			if (in_event_type == sysUIET_Key && in_event_param == sysVKC_ESCAPE)
			{
				gcmDeactivate();

				g_active_task = appAT_Emulation;
			}
			else
			{
				gcmUserInputEventHandler(in_device_number, in_event_category, in_event_type, in_event_param);
			}
			break;
	}
}

void fbFileSelectionHandler(void)
{
}

