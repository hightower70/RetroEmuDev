#ifndef __drvUSBHIDHost_h
#define __drvUSBHIDHost_h

#include <sysTypes.h>

typedef enum
{
		drvUHHEC_Pressed,
		drvUHHEC_Repeated,
		drvUHHEC_Released
} drvUSBHIDHostEventCategory;

typedef  enum
{
		drvUHHET_JoyXAxis,
		drvUHHET_JoyYAxis,
		drvUHHET_JoyButton
} drvUSBHIDHostEventType;

extern void drvUSBHIHostEventHandler(uint8_t in_device_number, drvUSBHIDHostEventCategory in_event_category, drvUSBHIDHostEventType in_event_type, uint32_t in_event_param);

#endif