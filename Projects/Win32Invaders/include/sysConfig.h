#ifndef __drvConfig_h
#define __drvConfig_h

///////////////////////////////////////////////////////////////////////////////
// GUI Config

//#define guiSCREEN_LANDSCAPE

#ifdef guiSCREEN_LANDSCAPE
#define guiSCREEN_WIDTH 320
#define guiSCREEN_HEIGHT 240
#else
#define guiSCREEN_WIDTH 240
#define guiSCREEN_HEIGHT 320
#endif

#define guiCOLOR_DEPTH 24

#define guiemuZOOM 1
#define guiemuBACKGROUND_COLOR 0x00000000
#define guiemuFOREGROUND_COLOR 0xffffffff

#define guiBITS_PER_PIXEL 8

///////////////////////////////////////////////////////////////////////////////
// Resource config
typedef int sysResourceAddress;

///////////////////////////////////////////////////////////////////////////////
// File system settings
//#define fileFAT_NO_LONG_FILENAME_SUPPORT
#define fileFAT_BUFFERING_MODE fileFAT_BM_SYSTEM_AND_FILE
#define fileFAT_MAX_HANDLE_COUNT 8
#define fileFAT_READ_ONLY_FILESYSTEM

#endif