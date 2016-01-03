#ifndef __drvConfig_h
#define __drvConfig_h

///////////////////////////////////////////////////////////////////////////////
// GUI Config

#define guiSCREEN_WIDTH 512
#define guiSCREEN_HEIGHT 256


#define guiCOLOR_DEPTH 24

#define guiemuZOOM 1
//#define guiemuBACKGROUND_COLOR 0x00ff0000
#define guiemuBACKGROUND_COLOR 0x00000000
#define guiemuFOREGROUND_COLOR 0x00ffffff

#define guiBITS_PER_PIXEL 1

///////////////////////////////////////////////////////////////////////////////
// Resource config
typedef int sysResourceAddress;

///////////////////////////////////////////////////////////////////////////////
// File system settings
//#define fileFAT_NO_LONG_FILENAME_SUPPORT
#define fileUSE_STANDARD_FILE_SYSTEM
#define fileFAT_BUFFERING_MODE fileFAT_BM_SYSTEM_AND_FILE
#define fileFAT_MAX_HANDLE_COUNT 8
#define fileFAT_READ_ONLY_FILESYSTEM

#endif