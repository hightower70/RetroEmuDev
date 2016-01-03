#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC32Invaders.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC32Invaders.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../../LibEmu/source/cpuI8080.c ../../../LibEmu/source/hwInvaders.c ../../../LibEmu/source/scrInvaders16bpp.c ../../../LibOS/drivers/PIC32/usb/usb_config.c ../../../LibOS/drivers/PIC32/usb/usb_host.c ../../../LibOS/drivers/PIC32/usb/usb_host_hid.c ../../../LibOS/drivers/PIC32/usb/usb_host_hid_device.c ../../../LibOS/drivers/PIC32/usb/usb_host_hid_parser.c ../../../LibOS/drivers/PIC32/source/drvPMP8.c ../../../LibOS/drivers/PIC32/source/drvSystemTimer.c ../../../LibOS/drivers/PIC32/source/drvUSBHIDHost.c ../../../LibOS/drivers/drvILI9320.c ../../../LibOS/drivers/drvKeyboardScancodeMapper.c ../../../LibOS/drivers/drvResourceArray.c ../../../LibOS/drivers/PIC32/source/drvWavePlayerPWM.c ../../../LibOS/drivers/PIC32/source/drvHighresTimer.c ../../../LibOS/source/guiColorGraphics.c ../../../LibOS/source/guiCommon.c ../../../LibOS/source/sysString.c ../../../LibOS/source/sysTimer.c ../../../LibOS/source/waveMixer.c ../../../LibOS/source/sysHighResTimer.c ../source/main.c ../source/sysInitialization.c ../source/emuInvadersResource.c ../source/romInvaders.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/462793587/cpuI8080.o ${OBJECTDIR}/_ext/462793587/hwInvaders.o ${OBJECTDIR}/_ext/462793587/scrInvaders16bpp.o ${OBJECTDIR}/_ext/2006777659/usb_config.o ${OBJECTDIR}/_ext/2006777659/usb_host.o ${OBJECTDIR}/_ext/2006777659/usb_host_hid.o ${OBJECTDIR}/_ext/2006777659/usb_host_hid_device.o ${OBJECTDIR}/_ext/2006777659/usb_host_hid_parser.o ${OBJECTDIR}/_ext/1971247418/drvPMP8.o ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o ${OBJECTDIR}/_ext/1971247418/drvUSBHIDHost.o ${OBJECTDIR}/_ext/563064790/drvILI9320.o ${OBJECTDIR}/_ext/563064790/drvKeyboardScancodeMapper.o ${OBJECTDIR}/_ext/563064790/drvResourceArray.o ${OBJECTDIR}/_ext/1971247418/drvWavePlayerPWM.o ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o ${OBJECTDIR}/_ext/860825648/guiColorGraphics.o ${OBJECTDIR}/_ext/860825648/guiCommon.o ${OBJECTDIR}/_ext/860825648/sysString.o ${OBJECTDIR}/_ext/860825648/sysTimer.o ${OBJECTDIR}/_ext/860825648/waveMixer.o ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o ${OBJECTDIR}/_ext/812168374/main.o ${OBJECTDIR}/_ext/812168374/sysInitialization.o ${OBJECTDIR}/_ext/812168374/emuInvadersResource.o ${OBJECTDIR}/_ext/812168374/romInvaders.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/462793587/cpuI8080.o.d ${OBJECTDIR}/_ext/462793587/hwInvaders.o.d ${OBJECTDIR}/_ext/462793587/scrInvaders16bpp.o.d ${OBJECTDIR}/_ext/2006777659/usb_config.o.d ${OBJECTDIR}/_ext/2006777659/usb_host.o.d ${OBJECTDIR}/_ext/2006777659/usb_host_hid.o.d ${OBJECTDIR}/_ext/2006777659/usb_host_hid_device.o.d ${OBJECTDIR}/_ext/2006777659/usb_host_hid_parser.o.d ${OBJECTDIR}/_ext/1971247418/drvPMP8.o.d ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o.d ${OBJECTDIR}/_ext/1971247418/drvUSBHIDHost.o.d ${OBJECTDIR}/_ext/563064790/drvILI9320.o.d ${OBJECTDIR}/_ext/563064790/drvKeyboardScancodeMapper.o.d ${OBJECTDIR}/_ext/563064790/drvResourceArray.o.d ${OBJECTDIR}/_ext/1971247418/drvWavePlayerPWM.o.d ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o.d ${OBJECTDIR}/_ext/860825648/guiColorGraphics.o.d ${OBJECTDIR}/_ext/860825648/guiCommon.o.d ${OBJECTDIR}/_ext/860825648/sysString.o.d ${OBJECTDIR}/_ext/860825648/sysTimer.o.d ${OBJECTDIR}/_ext/860825648/waveMixer.o.d ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o.d ${OBJECTDIR}/_ext/812168374/main.o.d ${OBJECTDIR}/_ext/812168374/sysInitialization.o.d ${OBJECTDIR}/_ext/812168374/emuInvadersResource.o.d ${OBJECTDIR}/_ext/812168374/romInvaders.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/462793587/cpuI8080.o ${OBJECTDIR}/_ext/462793587/hwInvaders.o ${OBJECTDIR}/_ext/462793587/scrInvaders16bpp.o ${OBJECTDIR}/_ext/2006777659/usb_config.o ${OBJECTDIR}/_ext/2006777659/usb_host.o ${OBJECTDIR}/_ext/2006777659/usb_host_hid.o ${OBJECTDIR}/_ext/2006777659/usb_host_hid_device.o ${OBJECTDIR}/_ext/2006777659/usb_host_hid_parser.o ${OBJECTDIR}/_ext/1971247418/drvPMP8.o ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o ${OBJECTDIR}/_ext/1971247418/drvUSBHIDHost.o ${OBJECTDIR}/_ext/563064790/drvILI9320.o ${OBJECTDIR}/_ext/563064790/drvKeyboardScancodeMapper.o ${OBJECTDIR}/_ext/563064790/drvResourceArray.o ${OBJECTDIR}/_ext/1971247418/drvWavePlayerPWM.o ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o ${OBJECTDIR}/_ext/860825648/guiColorGraphics.o ${OBJECTDIR}/_ext/860825648/guiCommon.o ${OBJECTDIR}/_ext/860825648/sysString.o ${OBJECTDIR}/_ext/860825648/sysTimer.o ${OBJECTDIR}/_ext/860825648/waveMixer.o ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o ${OBJECTDIR}/_ext/812168374/main.o ${OBJECTDIR}/_ext/812168374/sysInitialization.o ${OBJECTDIR}/_ext/812168374/emuInvadersResource.o ${OBJECTDIR}/_ext/812168374/romInvaders.o

# Source Files
SOURCEFILES=../../../LibEmu/source/cpuI8080.c ../../../LibEmu/source/hwInvaders.c ../../../LibEmu/source/scrInvaders16bpp.c ../../../LibOS/drivers/PIC32/usb/usb_config.c ../../../LibOS/drivers/PIC32/usb/usb_host.c ../../../LibOS/drivers/PIC32/usb/usb_host_hid.c ../../../LibOS/drivers/PIC32/usb/usb_host_hid_device.c ../../../LibOS/drivers/PIC32/usb/usb_host_hid_parser.c ../../../LibOS/drivers/PIC32/source/drvPMP8.c ../../../LibOS/drivers/PIC32/source/drvSystemTimer.c ../../../LibOS/drivers/PIC32/source/drvUSBHIDHost.c ../../../LibOS/drivers/drvILI9320.c ../../../LibOS/drivers/drvKeyboardScancodeMapper.c ../../../LibOS/drivers/drvResourceArray.c ../../../LibOS/drivers/PIC32/source/drvWavePlayerPWM.c ../../../LibOS/drivers/PIC32/source/drvHighresTimer.c ../../../LibOS/source/guiColorGraphics.c ../../../LibOS/source/guiCommon.c ../../../LibOS/source/sysString.c ../../../LibOS/source/sysTimer.c ../../../LibOS/source/waveMixer.c ../../../LibOS/source/sysHighResTimer.c ../source/main.c ../source/sysInitialization.c ../source/emuInvadersResource.c ../source/romInvaders.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/PIC32Invaders.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=32MX795F512L
MP_LINKER_FILE_OPTION=
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/462793587/cpuI8080.o: ../../../LibEmu/source/cpuI8080.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/462793587 
	@${RM} ${OBJECTDIR}/_ext/462793587/cpuI8080.o.d 
	@${RM} ${OBJECTDIR}/_ext/462793587/cpuI8080.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/462793587/cpuI8080.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/462793587/cpuI8080.o.d" -o ${OBJECTDIR}/_ext/462793587/cpuI8080.o ../../../LibEmu/source/cpuI8080.c   
	
${OBJECTDIR}/_ext/462793587/hwInvaders.o: ../../../LibEmu/source/hwInvaders.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/462793587 
	@${RM} ${OBJECTDIR}/_ext/462793587/hwInvaders.o.d 
	@${RM} ${OBJECTDIR}/_ext/462793587/hwInvaders.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/462793587/hwInvaders.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/462793587/hwInvaders.o.d" -o ${OBJECTDIR}/_ext/462793587/hwInvaders.o ../../../LibEmu/source/hwInvaders.c   
	
${OBJECTDIR}/_ext/462793587/scrInvaders16bpp.o: ../../../LibEmu/source/scrInvaders16bpp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/462793587 
	@${RM} ${OBJECTDIR}/_ext/462793587/scrInvaders16bpp.o.d 
	@${RM} ${OBJECTDIR}/_ext/462793587/scrInvaders16bpp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/462793587/scrInvaders16bpp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/462793587/scrInvaders16bpp.o.d" -o ${OBJECTDIR}/_ext/462793587/scrInvaders16bpp.o ../../../LibEmu/source/scrInvaders16bpp.c   
	
${OBJECTDIR}/_ext/2006777659/usb_config.o: ../../../LibOS/drivers/PIC32/usb/usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2006777659 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_config.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2006777659/usb_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/2006777659/usb_config.o.d" -o ${OBJECTDIR}/_ext/2006777659/usb_config.o ../../../LibOS/drivers/PIC32/usb/usb_config.c   
	
${OBJECTDIR}/_ext/2006777659/usb_host.o: ../../../LibOS/drivers/PIC32/usb/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2006777659 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2006777659/usb_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/2006777659/usb_host.o.d" -o ${OBJECTDIR}/_ext/2006777659/usb_host.o ../../../LibOS/drivers/PIC32/usb/usb_host.c   
	
${OBJECTDIR}/_ext/2006777659/usb_host_hid.o: ../../../LibOS/drivers/PIC32/usb/usb_host_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2006777659 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_host_hid.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2006777659/usb_host_hid.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/2006777659/usb_host_hid.o.d" -o ${OBJECTDIR}/_ext/2006777659/usb_host_hid.o ../../../LibOS/drivers/PIC32/usb/usb_host_hid.c   
	
${OBJECTDIR}/_ext/2006777659/usb_host_hid_device.o: ../../../LibOS/drivers/PIC32/usb/usb_host_hid_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2006777659 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_host_hid_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_host_hid_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2006777659/usb_host_hid_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/2006777659/usb_host_hid_device.o.d" -o ${OBJECTDIR}/_ext/2006777659/usb_host_hid_device.o ../../../LibOS/drivers/PIC32/usb/usb_host_hid_device.c   
	
${OBJECTDIR}/_ext/2006777659/usb_host_hid_parser.o: ../../../LibOS/drivers/PIC32/usb/usb_host_hid_parser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2006777659 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_host_hid_parser.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2006777659/usb_host_hid_parser.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/2006777659/usb_host_hid_parser.o.d" -o ${OBJECTDIR}/_ext/2006777659/usb_host_hid_parser.o ../../../LibOS/drivers/PIC32/usb/usb_host_hid_parser.c   
	
${OBJECTDIR}/_ext/1971247418/drvPMP8.o: ../../../LibOS/drivers/PIC32/source/drvPMP8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1971247418 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvPMP8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvPMP8.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971247418/drvPMP8.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1971247418/drvPMP8.o.d" -o ${OBJECTDIR}/_ext/1971247418/drvPMP8.o ../../../LibOS/drivers/PIC32/source/drvPMP8.c   
	
${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o: ../../../LibOS/drivers/PIC32/source/drvSystemTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1971247418 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o.d" -o ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o ../../../LibOS/drivers/PIC32/source/drvSystemTimer.c   
	
${OBJECTDIR}/_ext/1971247418/drvUSBHIDHost.o: ../../../LibOS/drivers/PIC32/source/drvUSBHIDHost.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1971247418 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvUSBHIDHost.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvUSBHIDHost.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971247418/drvUSBHIDHost.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1971247418/drvUSBHIDHost.o.d" -o ${OBJECTDIR}/_ext/1971247418/drvUSBHIDHost.o ../../../LibOS/drivers/PIC32/source/drvUSBHIDHost.c   
	
${OBJECTDIR}/_ext/563064790/drvILI9320.o: ../../../LibOS/drivers/drvILI9320.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/563064790 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvILI9320.o.d 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvILI9320.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/563064790/drvILI9320.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/563064790/drvILI9320.o.d" -o ${OBJECTDIR}/_ext/563064790/drvILI9320.o ../../../LibOS/drivers/drvILI9320.c   
	
${OBJECTDIR}/_ext/563064790/drvKeyboardScancodeMapper.o: ../../../LibOS/drivers/drvKeyboardScancodeMapper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/563064790 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvKeyboardScancodeMapper.o.d 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvKeyboardScancodeMapper.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/563064790/drvKeyboardScancodeMapper.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/563064790/drvKeyboardScancodeMapper.o.d" -o ${OBJECTDIR}/_ext/563064790/drvKeyboardScancodeMapper.o ../../../LibOS/drivers/drvKeyboardScancodeMapper.c   
	
${OBJECTDIR}/_ext/563064790/drvResourceArray.o: ../../../LibOS/drivers/drvResourceArray.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/563064790 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvResourceArray.o.d 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvResourceArray.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/563064790/drvResourceArray.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/563064790/drvResourceArray.o.d" -o ${OBJECTDIR}/_ext/563064790/drvResourceArray.o ../../../LibOS/drivers/drvResourceArray.c   
	
${OBJECTDIR}/_ext/1971247418/drvWavePlayerPWM.o: ../../../LibOS/drivers/PIC32/source/drvWavePlayerPWM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1971247418 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvWavePlayerPWM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvWavePlayerPWM.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971247418/drvWavePlayerPWM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1971247418/drvWavePlayerPWM.o.d" -o ${OBJECTDIR}/_ext/1971247418/drvWavePlayerPWM.o ../../../LibOS/drivers/PIC32/source/drvWavePlayerPWM.c   
	
${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o: ../../../LibOS/drivers/PIC32/source/drvHighresTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1971247418 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o.d" -o ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o ../../../LibOS/drivers/PIC32/source/drvHighresTimer.c   
	
${OBJECTDIR}/_ext/860825648/guiColorGraphics.o: ../../../LibOS/source/guiColorGraphics.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/guiColorGraphics.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/guiColorGraphics.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/guiColorGraphics.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/guiColorGraphics.o.d" -o ${OBJECTDIR}/_ext/860825648/guiColorGraphics.o ../../../LibOS/source/guiColorGraphics.c   
	
${OBJECTDIR}/_ext/860825648/guiCommon.o: ../../../LibOS/source/guiCommon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/guiCommon.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/guiCommon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/guiCommon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/guiCommon.o.d" -o ${OBJECTDIR}/_ext/860825648/guiCommon.o ../../../LibOS/source/guiCommon.c   
	
${OBJECTDIR}/_ext/860825648/sysString.o: ../../../LibOS/source/sysString.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysString.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysString.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/sysString.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/sysString.o.d" -o ${OBJECTDIR}/_ext/860825648/sysString.o ../../../LibOS/source/sysString.c   
	
${OBJECTDIR}/_ext/860825648/sysTimer.o: ../../../LibOS/source/sysTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/sysTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/sysTimer.o.d" -o ${OBJECTDIR}/_ext/860825648/sysTimer.o ../../../LibOS/source/sysTimer.c   
	
${OBJECTDIR}/_ext/860825648/waveMixer.o: ../../../LibOS/source/waveMixer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/waveMixer.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/waveMixer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/waveMixer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/waveMixer.o.d" -o ${OBJECTDIR}/_ext/860825648/waveMixer.o ../../../LibOS/source/waveMixer.c   
	
${OBJECTDIR}/_ext/860825648/sysHighResTimer.o: ../../../LibOS/source/sysHighResTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/sysHighResTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/sysHighResTimer.o.d" -o ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o ../../../LibOS/source/sysHighResTimer.c   
	
${OBJECTDIR}/_ext/812168374/main.o: ../source/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/812168374 
	@${RM} ${OBJECTDIR}/_ext/812168374/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/812168374/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/812168374/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/812168374/main.o.d" -o ${OBJECTDIR}/_ext/812168374/main.o ../source/main.c   
	
${OBJECTDIR}/_ext/812168374/sysInitialization.o: ../source/sysInitialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/812168374 
	@${RM} ${OBJECTDIR}/_ext/812168374/sysInitialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/812168374/sysInitialization.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/812168374/sysInitialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/812168374/sysInitialization.o.d" -o ${OBJECTDIR}/_ext/812168374/sysInitialization.o ../source/sysInitialization.c   
	
${OBJECTDIR}/_ext/812168374/emuInvadersResource.o: ../source/emuInvadersResource.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/812168374 
	@${RM} ${OBJECTDIR}/_ext/812168374/emuInvadersResource.o.d 
	@${RM} ${OBJECTDIR}/_ext/812168374/emuInvadersResource.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/812168374/emuInvadersResource.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/812168374/emuInvadersResource.o.d" -o ${OBJECTDIR}/_ext/812168374/emuInvadersResource.o ../source/emuInvadersResource.c   
	
${OBJECTDIR}/_ext/812168374/romInvaders.o: ../source/romInvaders.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/812168374 
	@${RM} ${OBJECTDIR}/_ext/812168374/romInvaders.o.d 
	@${RM} ${OBJECTDIR}/_ext/812168374/romInvaders.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/812168374/romInvaders.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/812168374/romInvaders.o.d" -o ${OBJECTDIR}/_ext/812168374/romInvaders.o ../source/romInvaders.c   
	
else
${OBJECTDIR}/_ext/462793587/cpuI8080.o: ../../../LibEmu/source/cpuI8080.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/462793587 
	@${RM} ${OBJECTDIR}/_ext/462793587/cpuI8080.o.d 
	@${RM} ${OBJECTDIR}/_ext/462793587/cpuI8080.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/462793587/cpuI8080.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/462793587/cpuI8080.o.d" -o ${OBJECTDIR}/_ext/462793587/cpuI8080.o ../../../LibEmu/source/cpuI8080.c   
	
${OBJECTDIR}/_ext/462793587/hwInvaders.o: ../../../LibEmu/source/hwInvaders.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/462793587 
	@${RM} ${OBJECTDIR}/_ext/462793587/hwInvaders.o.d 
	@${RM} ${OBJECTDIR}/_ext/462793587/hwInvaders.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/462793587/hwInvaders.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/462793587/hwInvaders.o.d" -o ${OBJECTDIR}/_ext/462793587/hwInvaders.o ../../../LibEmu/source/hwInvaders.c   
	
${OBJECTDIR}/_ext/462793587/scrInvaders16bpp.o: ../../../LibEmu/source/scrInvaders16bpp.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/462793587 
	@${RM} ${OBJECTDIR}/_ext/462793587/scrInvaders16bpp.o.d 
	@${RM} ${OBJECTDIR}/_ext/462793587/scrInvaders16bpp.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/462793587/scrInvaders16bpp.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/462793587/scrInvaders16bpp.o.d" -o ${OBJECTDIR}/_ext/462793587/scrInvaders16bpp.o ../../../LibEmu/source/scrInvaders16bpp.c   
	
${OBJECTDIR}/_ext/2006777659/usb_config.o: ../../../LibOS/drivers/PIC32/usb/usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2006777659 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_config.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2006777659/usb_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/2006777659/usb_config.o.d" -o ${OBJECTDIR}/_ext/2006777659/usb_config.o ../../../LibOS/drivers/PIC32/usb/usb_config.c   
	
${OBJECTDIR}/_ext/2006777659/usb_host.o: ../../../LibOS/drivers/PIC32/usb/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2006777659 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2006777659/usb_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/2006777659/usb_host.o.d" -o ${OBJECTDIR}/_ext/2006777659/usb_host.o ../../../LibOS/drivers/PIC32/usb/usb_host.c   
	
${OBJECTDIR}/_ext/2006777659/usb_host_hid.o: ../../../LibOS/drivers/PIC32/usb/usb_host_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2006777659 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_host_hid.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2006777659/usb_host_hid.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/2006777659/usb_host_hid.o.d" -o ${OBJECTDIR}/_ext/2006777659/usb_host_hid.o ../../../LibOS/drivers/PIC32/usb/usb_host_hid.c   
	
${OBJECTDIR}/_ext/2006777659/usb_host_hid_device.o: ../../../LibOS/drivers/PIC32/usb/usb_host_hid_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2006777659 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_host_hid_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_host_hid_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2006777659/usb_host_hid_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/2006777659/usb_host_hid_device.o.d" -o ${OBJECTDIR}/_ext/2006777659/usb_host_hid_device.o ../../../LibOS/drivers/PIC32/usb/usb_host_hid_device.c   
	
${OBJECTDIR}/_ext/2006777659/usb_host_hid_parser.o: ../../../LibOS/drivers/PIC32/usb/usb_host_hid_parser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/2006777659 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/2006777659/usb_host_hid_parser.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/2006777659/usb_host_hid_parser.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/2006777659/usb_host_hid_parser.o.d" -o ${OBJECTDIR}/_ext/2006777659/usb_host_hid_parser.o ../../../LibOS/drivers/PIC32/usb/usb_host_hid_parser.c   
	
${OBJECTDIR}/_ext/1971247418/drvPMP8.o: ../../../LibOS/drivers/PIC32/source/drvPMP8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1971247418 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvPMP8.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvPMP8.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971247418/drvPMP8.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1971247418/drvPMP8.o.d" -o ${OBJECTDIR}/_ext/1971247418/drvPMP8.o ../../../LibOS/drivers/PIC32/source/drvPMP8.c   
	
${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o: ../../../LibOS/drivers/PIC32/source/drvSystemTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1971247418 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o.d" -o ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o ../../../LibOS/drivers/PIC32/source/drvSystemTimer.c   
	
${OBJECTDIR}/_ext/1971247418/drvUSBHIDHost.o: ../../../LibOS/drivers/PIC32/source/drvUSBHIDHost.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1971247418 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvUSBHIDHost.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvUSBHIDHost.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971247418/drvUSBHIDHost.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1971247418/drvUSBHIDHost.o.d" -o ${OBJECTDIR}/_ext/1971247418/drvUSBHIDHost.o ../../../LibOS/drivers/PIC32/source/drvUSBHIDHost.c   
	
${OBJECTDIR}/_ext/563064790/drvILI9320.o: ../../../LibOS/drivers/drvILI9320.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/563064790 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvILI9320.o.d 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvILI9320.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/563064790/drvILI9320.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/563064790/drvILI9320.o.d" -o ${OBJECTDIR}/_ext/563064790/drvILI9320.o ../../../LibOS/drivers/drvILI9320.c   
	
${OBJECTDIR}/_ext/563064790/drvKeyboardScancodeMapper.o: ../../../LibOS/drivers/drvKeyboardScancodeMapper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/563064790 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvKeyboardScancodeMapper.o.d 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvKeyboardScancodeMapper.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/563064790/drvKeyboardScancodeMapper.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/563064790/drvKeyboardScancodeMapper.o.d" -o ${OBJECTDIR}/_ext/563064790/drvKeyboardScancodeMapper.o ../../../LibOS/drivers/drvKeyboardScancodeMapper.c   
	
${OBJECTDIR}/_ext/563064790/drvResourceArray.o: ../../../LibOS/drivers/drvResourceArray.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/563064790 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvResourceArray.o.d 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvResourceArray.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/563064790/drvResourceArray.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/563064790/drvResourceArray.o.d" -o ${OBJECTDIR}/_ext/563064790/drvResourceArray.o ../../../LibOS/drivers/drvResourceArray.c   
	
${OBJECTDIR}/_ext/1971247418/drvWavePlayerPWM.o: ../../../LibOS/drivers/PIC32/source/drvWavePlayerPWM.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1971247418 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvWavePlayerPWM.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvWavePlayerPWM.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971247418/drvWavePlayerPWM.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1971247418/drvWavePlayerPWM.o.d" -o ${OBJECTDIR}/_ext/1971247418/drvWavePlayerPWM.o ../../../LibOS/drivers/PIC32/source/drvWavePlayerPWM.c   
	
${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o: ../../../LibOS/drivers/PIC32/source/drvHighresTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1971247418 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o.d" -o ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o ../../../LibOS/drivers/PIC32/source/drvHighresTimer.c   
	
${OBJECTDIR}/_ext/860825648/guiColorGraphics.o: ../../../LibOS/source/guiColorGraphics.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/guiColorGraphics.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/guiColorGraphics.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/guiColorGraphics.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/guiColorGraphics.o.d" -o ${OBJECTDIR}/_ext/860825648/guiColorGraphics.o ../../../LibOS/source/guiColorGraphics.c   
	
${OBJECTDIR}/_ext/860825648/guiCommon.o: ../../../LibOS/source/guiCommon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/guiCommon.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/guiCommon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/guiCommon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/guiCommon.o.d" -o ${OBJECTDIR}/_ext/860825648/guiCommon.o ../../../LibOS/source/guiCommon.c   
	
${OBJECTDIR}/_ext/860825648/sysString.o: ../../../LibOS/source/sysString.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysString.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysString.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/sysString.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/sysString.o.d" -o ${OBJECTDIR}/_ext/860825648/sysString.o ../../../LibOS/source/sysString.c   
	
${OBJECTDIR}/_ext/860825648/sysTimer.o: ../../../LibOS/source/sysTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/sysTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/sysTimer.o.d" -o ${OBJECTDIR}/_ext/860825648/sysTimer.o ../../../LibOS/source/sysTimer.c   
	
${OBJECTDIR}/_ext/860825648/waveMixer.o: ../../../LibOS/source/waveMixer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/waveMixer.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/waveMixer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/waveMixer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/waveMixer.o.d" -o ${OBJECTDIR}/_ext/860825648/waveMixer.o ../../../LibOS/source/waveMixer.c   
	
${OBJECTDIR}/_ext/860825648/sysHighResTimer.o: ../../../LibOS/source/sysHighResTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/sysHighResTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/sysHighResTimer.o.d" -o ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o ../../../LibOS/source/sysHighResTimer.c   
	
${OBJECTDIR}/_ext/812168374/main.o: ../source/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/812168374 
	@${RM} ${OBJECTDIR}/_ext/812168374/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/812168374/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/812168374/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/812168374/main.o.d" -o ${OBJECTDIR}/_ext/812168374/main.o ../source/main.c   
	
${OBJECTDIR}/_ext/812168374/sysInitialization.o: ../source/sysInitialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/812168374 
	@${RM} ${OBJECTDIR}/_ext/812168374/sysInitialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/812168374/sysInitialization.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/812168374/sysInitialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/812168374/sysInitialization.o.d" -o ${OBJECTDIR}/_ext/812168374/sysInitialization.o ../source/sysInitialization.c   
	
${OBJECTDIR}/_ext/812168374/emuInvadersResource.o: ../source/emuInvadersResource.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/812168374 
	@${RM} ${OBJECTDIR}/_ext/812168374/emuInvadersResource.o.d 
	@${RM} ${OBJECTDIR}/_ext/812168374/emuInvadersResource.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/812168374/emuInvadersResource.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/812168374/emuInvadersResource.o.d" -o ${OBJECTDIR}/_ext/812168374/emuInvadersResource.o ../source/emuInvadersResource.c   
	
${OBJECTDIR}/_ext/812168374/romInvaders.o: ../source/romInvaders.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/812168374 
	@${RM} ${OBJECTDIR}/_ext/812168374/romInvaders.o.d 
	@${RM} ${OBJECTDIR}/_ext/812168374/romInvaders.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/812168374/romInvaders.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -O3 -D_SUPPRESS_PLIB_WARNING -I"../../../LibOS/include" -I"../../../LibEmu/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/812168374/romInvaders.o.d" -o ${OBJECTDIR}/_ext/812168374/romInvaders.o ../source/romInvaders.c   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/PIC32Invaders.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PIC32MXSK=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC32Invaders.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}              -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PIC32MXSK=1,--defsym=_min_heap_size=8192,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/PIC32Invaders.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC32Invaders.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=8192,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/PIC32Invaders.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
