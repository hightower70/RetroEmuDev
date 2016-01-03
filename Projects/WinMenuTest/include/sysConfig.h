#ifndef __drvConfig_h
#define __drvConfig_h

///////////////////////////////////////////////////////////////////////////////
// GUI Config

#define guiSCREEN_WIDTH 256
#define guiSCREEN_HEIGHT 192


#define guiCOLOR_DEPTH 1

#define guiemuZOOM 1
//#define guiemuBACKGROUND_COLOR 0x00ff0000
#define guiemuBACKGROUND_COLOR 0x00000000
#define guiemuFOREGROUND_COLOR 0x00ffffff

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