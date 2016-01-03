/*****************************************************************************/
/* Wave player routines                                                      */
/*                                                                           */
/* Copyright (C) 2015 Laszlo Arvai                                           */
/* All rights reserved.                                                      */
/*                                                                           */
/* This software may be modified and distributed under the terms             */
/* of the BSD license.  See the LICENSE file for details.                    */
/*****************************************************************************/

#ifndef __appWavePlayer_h
#define __appWavePlayer_h

///////////////////////////////////////////////////////////////////////////////
// Includes
#include <sysTypes.h>

///////////////////////////////////////////////////////////////////////////////
// Function prototypes
bool appWavePlayerStart(sysString in_file_name);
void appWavePlayerStop(void);
void appWavePlayerTask(void);

#endif
