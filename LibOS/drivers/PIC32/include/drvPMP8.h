#ifndef __drvPMP8_h
#define __drvPMP8_h

#include <sysTypes.h>

void drvPMP8Init(void);
void drvPMP8WriteByte(uint8_t in_address, uint8_t in_data);
void drvPMP8WaitBusy(void);
void drvPMP8WriteBlock(uint8_t in_address, uint8_t* in_block_address, uint32_t in_block_length);
void drvPMP8WriteDoubleByteBlock(uint8_t in_address, uint8_t in_first_byte, uint8_t in_second_byte, uint32_t in_block_length);


#endif