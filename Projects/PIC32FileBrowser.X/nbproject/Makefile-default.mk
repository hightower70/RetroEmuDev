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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC32FileBrowser.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/PIC32FileBrowser.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../LibOS/drivers/PIC32/source/drvPMP8.c ../../LibOS/drivers/PIC32/source/drvSystemTimer.c ../../LibOS/drivers/PIC32/source/drvSDCSPI.c ../../LibOS/drivers/PIC32/source/drvUSBHIDHost.c ../../LibOS/drivers/PIC32/usb/usb_config.c ../../LibOS/drivers/PIC32/usb/usb_host.c ../../LibOS/drivers/PIC32/usb/usb_host_hid.c ../../LibOS/drivers/PIC32/usb/usb_host_hid_device.c ../../LibOS/drivers/PIC32/usb/usb_host_hid_parser.c ../../LibOS/drivers/drvILI9320.c ../../LibOS/drivers/drvSDCard.c ../../LibOS/drivers/drvKeyboardScancodeMapper.c ../../LibOS/source/sysTimer.c ../../LibOS/source/guiCommon.c ../../LibOS/source/guiColorGraphics.c ../../LibOS/drivers/drvResourceArray.c ../../LibOS/source/sysString.c ../../LibOS/source/fbBuffer.c ../../LibOS/source/fbColorRenderer.c ../../LibOS/source/fbFileBrowser.c ../../LibOS/source/fbFileEnumerator.c ../../LibOS/source/fbIconMapper.c ../../LibOS/source/fileFAT.c ../../LibOS/source/fileFATFunctionWrapper.c ../../LibOS/source/fileUtils.c ../../LibOS/source/fileVolumes.c ../../LibOS/source/sysDateTime.c ../../LibOS/source/fbUserInputHandler.c source/main.c source/sysInitialization.c source/fbResource.c source/uart2.c source/uart2to1.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/465853749/drvPMP8.o ${OBJECTDIR}/_ext/465853749/drvSystemTimer.o ${OBJECTDIR}/_ext/465853749/drvSDCSPI.o ${OBJECTDIR}/_ext/465853749/drvUSBHIDHost.o ${OBJECTDIR}/_ext/774899924/usb_config.o ${OBJECTDIR}/_ext/774899924/usb_host.o ${OBJECTDIR}/_ext/774899924/usb_host_hid.o ${OBJECTDIR}/_ext/774899924/usb_host_hid_device.o ${OBJECTDIR}/_ext/774899924/usb_host_hid_parser.o ${OBJECTDIR}/_ext/727035557/drvILI9320.o ${OBJECTDIR}/_ext/727035557/drvSDCard.o ${OBJECTDIR}/_ext/727035557/drvKeyboardScancodeMapper.o ${OBJECTDIR}/_ext/1904831615/sysTimer.o ${OBJECTDIR}/_ext/1904831615/guiCommon.o ${OBJECTDIR}/_ext/1904831615/guiColorGraphics.o ${OBJECTDIR}/_ext/727035557/drvResourceArray.o ${OBJECTDIR}/_ext/1904831615/sysString.o ${OBJECTDIR}/_ext/1904831615/fbBuffer.o ${OBJECTDIR}/_ext/1904831615/fbColorRenderer.o ${OBJECTDIR}/_ext/1904831615/fbFileBrowser.o ${OBJECTDIR}/_ext/1904831615/fbFileEnumerator.o ${OBJECTDIR}/_ext/1904831615/fbIconMapper.o ${OBJECTDIR}/_ext/1904831615/fileFAT.o ${OBJECTDIR}/_ext/1904831615/fileFATFunctionWrapper.o ${OBJECTDIR}/_ext/1904831615/fileUtils.o ${OBJECTDIR}/_ext/1904831615/fileVolumes.o ${OBJECTDIR}/_ext/1904831615/sysDateTime.o ${OBJECTDIR}/_ext/1904831615/fbUserInputHandler.o ${OBJECTDIR}/source/main.o ${OBJECTDIR}/source/sysInitialization.o ${OBJECTDIR}/source/fbResource.o ${OBJECTDIR}/source/uart2.o ${OBJECTDIR}/source/uart2to1.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/465853749/drvPMP8.o.d ${OBJECTDIR}/_ext/465853749/drvSystemTimer.o.d ${OBJECTDIR}/_ext/465853749/drvSDCSPI.o.d ${OBJECTDIR}/_ext/465853749/drvUSBHIDHost.o.d ${OBJECTDIR}/_ext/774899924/usb_config.o.d ${OBJECTDIR}/_ext/774899924/usb_host.o.d ${OBJECTDIR}/_ext/774899924/usb_host_hid.o.d ${OBJECTDIR}/_ext/774899924/usb_host_hid_device.o.d ${OBJECTDIR}/_ext/774899924/usb_host_hid_parser.o.d ${OBJECTDIR}/_ext/727035557/drvILI9320.o.d ${OBJECTDIR}/_ext/727035557/drvSDCard.o.d ${OBJECTDIR}/_ext/727035557/drvKeyboardScancodeMapper.o.d ${OBJECTDIR}/_ext/1904831615/sysTimer.o.d ${OBJECTDIR}/_ext/1904831615/guiCommon.o.d ${OBJECTDIR}/_ext/1904831615/guiColorGraphics.o.d ${OBJECTDIR}/_ext/727035557/drvResourceArray.o.d ${OBJECTDIR}/_ext/1904831615/sysString.o.d ${OBJECTDIR}/_ext/1904831615/fbBuffer.o.d ${OBJECTDIR}/_ext/1904831615/fbColorRenderer.o.d ${OBJECTDIR}/_ext/1904831615/fbFileBrowser.o.d ${OBJECTDIR}/_ext/1904831615/fbFileEnumerator.o.d ${OBJECTDIR}/_ext/1904831615/fbIconMapper.o.d ${OBJECTDIR}/_ext/1904831615/fileFAT.o.d ${OBJECTDIR}/_ext/1904831615/fileFATFunctionWrapper.o.d ${OBJECTDIR}/_ext/1904831615/fileUtils.o.d ${OBJECTDIR}/_ext/1904831615/fileVolumes.o.d ${OBJECTDIR}/_ext/1904831615/sysDateTime.o.d ${OBJECTDIR}/_ext/1904831615/fbUserInputHandler.o.d ${OBJECTDIR}/source/main.o.d ${OBJECTDIR}/source/sysInitialization.o.d ${OBJECTDIR}/source/fbResource.o.d ${OBJECTDIR}/source/uart2.o.d ${OBJECTDIR}/source/uart2to1.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/465853749/drvPMP8.o ${OBJECTDIR}/_ext/465853749/drvSystemTimer.o ${OBJECTDIR}/_ext/465853749/drvSDCSPI.o ${OBJECTDIR}/_ext/465853749/drvUSBHIDHost.o ${OBJECTDIR}/_ext/774899924/usb_config.o ${OBJECTDIR}/_ext/774899924/usb_host.o ${OBJECTDIR}/_ext/774899924/usb_host_hid.o ${OBJECTDIR}/_ext/774899924/usb_host_hid_device.o ${OBJECTDIR}/_ext/774899924/usb_host_hid_parser.o ${OBJECTDIR}/_ext/727035557/drvILI9320.o ${OBJECTDIR}/_ext/727035557/drvSDCard.o ${OBJECTDIR}/_ext/727035557/drvKeyboardScancodeMapper.o ${OBJECTDIR}/_ext/1904831615/sysTimer.o ${OBJECTDIR}/_ext/1904831615/guiCommon.o ${OBJECTDIR}/_ext/1904831615/guiColorGraphics.o ${OBJECTDIR}/_ext/727035557/drvResourceArray.o ${OBJECTDIR}/_ext/1904831615/sysString.o ${OBJECTDIR}/_ext/1904831615/fbBuffer.o ${OBJECTDIR}/_ext/1904831615/fbColorRenderer.o ${OBJECTDIR}/_ext/1904831615/fbFileBrowser.o ${OBJECTDIR}/_ext/1904831615/fbFileEnumerator.o ${OBJECTDIR}/_ext/1904831615/fbIconMapper.o ${OBJECTDIR}/_ext/1904831615/fileFAT.o ${OBJECTDIR}/_ext/1904831615/fileFATFunctionWrapper.o ${OBJECTDIR}/_ext/1904831615/fileUtils.o ${OBJECTDIR}/_ext/1904831615/fileVolumes.o ${OBJECTDIR}/_ext/1904831615/sysDateTime.o ${OBJECTDIR}/_ext/1904831615/fbUserInputHandler.o ${OBJECTDIR}/source/main.o ${OBJECTDIR}/source/sysInitialization.o ${OBJECTDIR}/source/fbResource.o ${OBJECTDIR}/source/uart2.o ${OBJECTDIR}/source/uart2to1.o

# Source Files
SOURCEFILES=../../LibOS/drivers/PIC32/source/drvPMP8.c ../../LibOS/drivers/PIC32/source/drvSystemTimer.c ../../LibOS/drivers/PIC32/source/drvSDCSPI.c ../../LibOS/drivers/PIC32/source/drvUSBHIDHost.c ../../LibOS/drivers/PIC32/usb/usb_config.c ../../LibOS/drivers/PIC32/usb/usb_host.c ../../LibOS/drivers/PIC32/usb/usb_host_hid.c ../../LibOS/drivers/PIC32/usb/usb_host_hid_device.c ../../LibOS/drivers/PIC32/usb/usb_host_hid_parser.c ../../LibOS/drivers/drvILI9320.c ../../LibOS/drivers/drvSDCard.c ../../LibOS/drivers/drvKeyboardScancodeMapper.c ../../LibOS/source/sysTimer.c ../../LibOS/source/guiCommon.c ../../LibOS/source/guiColorGraphics.c ../../LibOS/drivers/drvResourceArray.c ../../LibOS/source/sysString.c ../../LibOS/source/fbBuffer.c ../../LibOS/source/fbColorRenderer.c ../../LibOS/source/fbFileBrowser.c ../../LibOS/source/fbFileEnumerator.c ../../LibOS/source/fbIconMapper.c ../../LibOS/source/fileFAT.c ../../LibOS/source/fileFATFunctionWrapper.c ../../LibOS/source/fileUtils.c ../../LibOS/source/fileVolumes.c ../../LibOS/source/sysDateTime.c ../../LibOS/source/fbUserInputHandler.c source/main.c source/sysInitialization.c source/fbResource.c source/uart2.c source/uart2to1.c


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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/PIC32FileBrowser.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/_ext/465853749/drvPMP8.o: ../../LibOS/drivers/PIC32/source/drvPMP8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/465853749 
	@${RM} ${OBJECTDIR}/_ext/465853749/drvPMP8.o.d 
	@${RM} ${OBJECTDIR}/_ext/465853749/drvPMP8.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/465853749/drvPMP8.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/465853749/drvPMP8.o.d" -o ${OBJECTDIR}/_ext/465853749/drvPMP8.o ../../LibOS/drivers/PIC32/source/drvPMP8.c   
	
${OBJECTDIR}/_ext/465853749/drvSystemTimer.o: ../../LibOS/drivers/PIC32/source/drvSystemTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/465853749 
	@${RM} ${OBJECTDIR}/_ext/465853749/drvSystemTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/465853749/drvSystemTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/465853749/drvSystemTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/465853749/drvSystemTimer.o.d" -o ${OBJECTDIR}/_ext/465853749/drvSystemTimer.o ../../LibOS/drivers/PIC32/source/drvSystemTimer.c   
	
${OBJECTDIR}/_ext/465853749/drvSDCSPI.o: ../../LibOS/drivers/PIC32/source/drvSDCSPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/465853749 
	@${RM} ${OBJECTDIR}/_ext/465853749/drvSDCSPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/465853749/drvSDCSPI.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/465853749/drvSDCSPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/465853749/drvSDCSPI.o.d" -o ${OBJECTDIR}/_ext/465853749/drvSDCSPI.o ../../LibOS/drivers/PIC32/source/drvSDCSPI.c   
	
${OBJECTDIR}/_ext/465853749/drvUSBHIDHost.o: ../../LibOS/drivers/PIC32/source/drvUSBHIDHost.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/465853749 
	@${RM} ${OBJECTDIR}/_ext/465853749/drvUSBHIDHost.o.d 
	@${RM} ${OBJECTDIR}/_ext/465853749/drvUSBHIDHost.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/465853749/drvUSBHIDHost.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/465853749/drvUSBHIDHost.o.d" -o ${OBJECTDIR}/_ext/465853749/drvUSBHIDHost.o ../../LibOS/drivers/PIC32/source/drvUSBHIDHost.c   
	
${OBJECTDIR}/_ext/774899924/usb_config.o: ../../LibOS/drivers/PIC32/usb/usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/774899924 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_config.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/774899924/usb_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/774899924/usb_config.o.d" -o ${OBJECTDIR}/_ext/774899924/usb_config.o ../../LibOS/drivers/PIC32/usb/usb_config.c   
	
${OBJECTDIR}/_ext/774899924/usb_host.o: ../../LibOS/drivers/PIC32/usb/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/774899924 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/774899924/usb_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/774899924/usb_host.o.d" -o ${OBJECTDIR}/_ext/774899924/usb_host.o ../../LibOS/drivers/PIC32/usb/usb_host.c   
	
${OBJECTDIR}/_ext/774899924/usb_host_hid.o: ../../LibOS/drivers/PIC32/usb/usb_host_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/774899924 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_host_hid.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/774899924/usb_host_hid.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/774899924/usb_host_hid.o.d" -o ${OBJECTDIR}/_ext/774899924/usb_host_hid.o ../../LibOS/drivers/PIC32/usb/usb_host_hid.c   
	
${OBJECTDIR}/_ext/774899924/usb_host_hid_device.o: ../../LibOS/drivers/PIC32/usb/usb_host_hid_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/774899924 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_host_hid_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_host_hid_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/774899924/usb_host_hid_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/774899924/usb_host_hid_device.o.d" -o ${OBJECTDIR}/_ext/774899924/usb_host_hid_device.o ../../LibOS/drivers/PIC32/usb/usb_host_hid_device.c   
	
${OBJECTDIR}/_ext/774899924/usb_host_hid_parser.o: ../../LibOS/drivers/PIC32/usb/usb_host_hid_parser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/774899924 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_host_hid_parser.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/774899924/usb_host_hid_parser.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/774899924/usb_host_hid_parser.o.d" -o ${OBJECTDIR}/_ext/774899924/usb_host_hid_parser.o ../../LibOS/drivers/PIC32/usb/usb_host_hid_parser.c   
	
${OBJECTDIR}/_ext/727035557/drvILI9320.o: ../../LibOS/drivers/drvILI9320.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/727035557 
	@${RM} ${OBJECTDIR}/_ext/727035557/drvILI9320.o.d 
	@${RM} ${OBJECTDIR}/_ext/727035557/drvILI9320.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/727035557/drvILI9320.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/727035557/drvILI9320.o.d" -o ${OBJECTDIR}/_ext/727035557/drvILI9320.o ../../LibOS/drivers/drvILI9320.c   
	
${OBJECTDIR}/_ext/727035557/drvSDCard.o: ../../LibOS/drivers/drvSDCard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/727035557 
	@${RM} ${OBJECTDIR}/_ext/727035557/drvSDCard.o.d 
	@${RM} ${OBJECTDIR}/_ext/727035557/drvSDCard.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/727035557/drvSDCard.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/727035557/drvSDCard.o.d" -o ${OBJECTDIR}/_ext/727035557/drvSDCard.o ../../LibOS/drivers/drvSDCard.c   
	
${OBJECTDIR}/_ext/727035557/drvKeyboardScancodeMapper.o: ../../LibOS/drivers/drvKeyboardScancodeMapper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/727035557 
	@${RM} ${OBJECTDIR}/_ext/727035557/drvKeyboardScancodeMapper.o.d 
	@${RM} ${OBJECTDIR}/_ext/727035557/drvKeyboardScancodeMapper.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/727035557/drvKeyboardScancodeMapper.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/727035557/drvKeyboardScancodeMapper.o.d" -o ${OBJECTDIR}/_ext/727035557/drvKeyboardScancodeMapper.o ../../LibOS/drivers/drvKeyboardScancodeMapper.c   
	
${OBJECTDIR}/_ext/1904831615/sysTimer.o: ../../LibOS/source/sysTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/sysTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/sysTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/sysTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/sysTimer.o.d" -o ${OBJECTDIR}/_ext/1904831615/sysTimer.o ../../LibOS/source/sysTimer.c   
	
${OBJECTDIR}/_ext/1904831615/guiCommon.o: ../../LibOS/source/guiCommon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/guiCommon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/guiCommon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/guiCommon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/guiCommon.o.d" -o ${OBJECTDIR}/_ext/1904831615/guiCommon.o ../../LibOS/source/guiCommon.c   
	
${OBJECTDIR}/_ext/1904831615/guiColorGraphics.o: ../../LibOS/source/guiColorGraphics.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/guiColorGraphics.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/guiColorGraphics.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/guiColorGraphics.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/guiColorGraphics.o.d" -o ${OBJECTDIR}/_ext/1904831615/guiColorGraphics.o ../../LibOS/source/guiColorGraphics.c   
	
${OBJECTDIR}/_ext/727035557/drvResourceArray.o: ../../LibOS/drivers/drvResourceArray.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/727035557 
	@${RM} ${OBJECTDIR}/_ext/727035557/drvResourceArray.o.d 
	@${RM} ${OBJECTDIR}/_ext/727035557/drvResourceArray.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/727035557/drvResourceArray.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/727035557/drvResourceArray.o.d" -o ${OBJECTDIR}/_ext/727035557/drvResourceArray.o ../../LibOS/drivers/drvResourceArray.c   
	
${OBJECTDIR}/_ext/1904831615/sysString.o: ../../LibOS/source/sysString.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/sysString.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/sysString.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/sysString.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/sysString.o.d" -o ${OBJECTDIR}/_ext/1904831615/sysString.o ../../LibOS/source/sysString.c   
	
${OBJECTDIR}/_ext/1904831615/fbBuffer.o: ../../LibOS/source/fbBuffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbBuffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbBuffer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fbBuffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fbBuffer.o.d" -o ${OBJECTDIR}/_ext/1904831615/fbBuffer.o ../../LibOS/source/fbBuffer.c   
	
${OBJECTDIR}/_ext/1904831615/fbColorRenderer.o: ../../LibOS/source/fbColorRenderer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbColorRenderer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbColorRenderer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fbColorRenderer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fbColorRenderer.o.d" -o ${OBJECTDIR}/_ext/1904831615/fbColorRenderer.o ../../LibOS/source/fbColorRenderer.c   
	
${OBJECTDIR}/_ext/1904831615/fbFileBrowser.o: ../../LibOS/source/fbFileBrowser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbFileBrowser.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbFileBrowser.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fbFileBrowser.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fbFileBrowser.o.d" -o ${OBJECTDIR}/_ext/1904831615/fbFileBrowser.o ../../LibOS/source/fbFileBrowser.c   
	
${OBJECTDIR}/_ext/1904831615/fbFileEnumerator.o: ../../LibOS/source/fbFileEnumerator.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbFileEnumerator.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbFileEnumerator.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fbFileEnumerator.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fbFileEnumerator.o.d" -o ${OBJECTDIR}/_ext/1904831615/fbFileEnumerator.o ../../LibOS/source/fbFileEnumerator.c   
	
${OBJECTDIR}/_ext/1904831615/fbIconMapper.o: ../../LibOS/source/fbIconMapper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbIconMapper.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbIconMapper.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fbIconMapper.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fbIconMapper.o.d" -o ${OBJECTDIR}/_ext/1904831615/fbIconMapper.o ../../LibOS/source/fbIconMapper.c   
	
${OBJECTDIR}/_ext/1904831615/fileFAT.o: ../../LibOS/source/fileFAT.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fileFAT.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fileFAT.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fileFAT.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fileFAT.o.d" -o ${OBJECTDIR}/_ext/1904831615/fileFAT.o ../../LibOS/source/fileFAT.c   
	
${OBJECTDIR}/_ext/1904831615/fileFATFunctionWrapper.o: ../../LibOS/source/fileFATFunctionWrapper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fileFATFunctionWrapper.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fileFATFunctionWrapper.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fileFATFunctionWrapper.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fileFATFunctionWrapper.o.d" -o ${OBJECTDIR}/_ext/1904831615/fileFATFunctionWrapper.o ../../LibOS/source/fileFATFunctionWrapper.c   
	
${OBJECTDIR}/_ext/1904831615/fileUtils.o: ../../LibOS/source/fileUtils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fileUtils.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fileUtils.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fileUtils.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fileUtils.o.d" -o ${OBJECTDIR}/_ext/1904831615/fileUtils.o ../../LibOS/source/fileUtils.c   
	
${OBJECTDIR}/_ext/1904831615/fileVolumes.o: ../../LibOS/source/fileVolumes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fileVolumes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fileVolumes.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fileVolumes.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fileVolumes.o.d" -o ${OBJECTDIR}/_ext/1904831615/fileVolumes.o ../../LibOS/source/fileVolumes.c   
	
${OBJECTDIR}/_ext/1904831615/sysDateTime.o: ../../LibOS/source/sysDateTime.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/sysDateTime.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/sysDateTime.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/sysDateTime.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/sysDateTime.o.d" -o ${OBJECTDIR}/_ext/1904831615/sysDateTime.o ../../LibOS/source/sysDateTime.c   
	
${OBJECTDIR}/_ext/1904831615/fbUserInputHandler.o: ../../LibOS/source/fbUserInputHandler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbUserInputHandler.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbUserInputHandler.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fbUserInputHandler.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fbUserInputHandler.o.d" -o ${OBJECTDIR}/_ext/1904831615/fbUserInputHandler.o ../../LibOS/source/fbUserInputHandler.c   
	
${OBJECTDIR}/source/main.o: source/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/main.o.d 
	@${RM} ${OBJECTDIR}/source/main.o 
	@${FIXDEPS} "${OBJECTDIR}/source/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/source/main.o.d" -o ${OBJECTDIR}/source/main.o source/main.c   
	
${OBJECTDIR}/source/sysInitialization.o: source/sysInitialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/sysInitialization.o.d 
	@${RM} ${OBJECTDIR}/source/sysInitialization.o 
	@${FIXDEPS} "${OBJECTDIR}/source/sysInitialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/source/sysInitialization.o.d" -o ${OBJECTDIR}/source/sysInitialization.o source/sysInitialization.c   
	
${OBJECTDIR}/source/fbResource.o: source/fbResource.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/fbResource.o.d 
	@${RM} ${OBJECTDIR}/source/fbResource.o 
	@${FIXDEPS} "${OBJECTDIR}/source/fbResource.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/source/fbResource.o.d" -o ${OBJECTDIR}/source/fbResource.o source/fbResource.c   
	
${OBJECTDIR}/source/uart2.o: source/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/uart2.o.d 
	@${RM} ${OBJECTDIR}/source/uart2.o 
	@${FIXDEPS} "${OBJECTDIR}/source/uart2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/source/uart2.o.d" -o ${OBJECTDIR}/source/uart2.o source/uart2.c   
	
${OBJECTDIR}/source/uart2to1.o: source/uart2to1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/uart2to1.o.d 
	@${RM} ${OBJECTDIR}/source/uart2to1.o 
	@${FIXDEPS} "${OBJECTDIR}/source/uart2to1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/source/uart2to1.o.d" -o ${OBJECTDIR}/source/uart2to1.o source/uart2to1.c   
	
else
${OBJECTDIR}/_ext/465853749/drvPMP8.o: ../../LibOS/drivers/PIC32/source/drvPMP8.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/465853749 
	@${RM} ${OBJECTDIR}/_ext/465853749/drvPMP8.o.d 
	@${RM} ${OBJECTDIR}/_ext/465853749/drvPMP8.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/465853749/drvPMP8.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/465853749/drvPMP8.o.d" -o ${OBJECTDIR}/_ext/465853749/drvPMP8.o ../../LibOS/drivers/PIC32/source/drvPMP8.c   
	
${OBJECTDIR}/_ext/465853749/drvSystemTimer.o: ../../LibOS/drivers/PIC32/source/drvSystemTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/465853749 
	@${RM} ${OBJECTDIR}/_ext/465853749/drvSystemTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/465853749/drvSystemTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/465853749/drvSystemTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/465853749/drvSystemTimer.o.d" -o ${OBJECTDIR}/_ext/465853749/drvSystemTimer.o ../../LibOS/drivers/PIC32/source/drvSystemTimer.c   
	
${OBJECTDIR}/_ext/465853749/drvSDCSPI.o: ../../LibOS/drivers/PIC32/source/drvSDCSPI.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/465853749 
	@${RM} ${OBJECTDIR}/_ext/465853749/drvSDCSPI.o.d 
	@${RM} ${OBJECTDIR}/_ext/465853749/drvSDCSPI.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/465853749/drvSDCSPI.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/465853749/drvSDCSPI.o.d" -o ${OBJECTDIR}/_ext/465853749/drvSDCSPI.o ../../LibOS/drivers/PIC32/source/drvSDCSPI.c   
	
${OBJECTDIR}/_ext/465853749/drvUSBHIDHost.o: ../../LibOS/drivers/PIC32/source/drvUSBHIDHost.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/465853749 
	@${RM} ${OBJECTDIR}/_ext/465853749/drvUSBHIDHost.o.d 
	@${RM} ${OBJECTDIR}/_ext/465853749/drvUSBHIDHost.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/465853749/drvUSBHIDHost.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/465853749/drvUSBHIDHost.o.d" -o ${OBJECTDIR}/_ext/465853749/drvUSBHIDHost.o ../../LibOS/drivers/PIC32/source/drvUSBHIDHost.c   
	
${OBJECTDIR}/_ext/774899924/usb_config.o: ../../LibOS/drivers/PIC32/usb/usb_config.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/774899924 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_config.o.d 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_config.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/774899924/usb_config.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/774899924/usb_config.o.d" -o ${OBJECTDIR}/_ext/774899924/usb_config.o ../../LibOS/drivers/PIC32/usb/usb_config.c   
	
${OBJECTDIR}/_ext/774899924/usb_host.o: ../../LibOS/drivers/PIC32/usb/usb_host.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/774899924 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_host.o.d 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_host.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/774899924/usb_host.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/774899924/usb_host.o.d" -o ${OBJECTDIR}/_ext/774899924/usb_host.o ../../LibOS/drivers/PIC32/usb/usb_host.c   
	
${OBJECTDIR}/_ext/774899924/usb_host_hid.o: ../../LibOS/drivers/PIC32/usb/usb_host_hid.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/774899924 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_host_hid.o.d 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_host_hid.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/774899924/usb_host_hid.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/774899924/usb_host_hid.o.d" -o ${OBJECTDIR}/_ext/774899924/usb_host_hid.o ../../LibOS/drivers/PIC32/usb/usb_host_hid.c   
	
${OBJECTDIR}/_ext/774899924/usb_host_hid_device.o: ../../LibOS/drivers/PIC32/usb/usb_host_hid_device.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/774899924 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_host_hid_device.o.d 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_host_hid_device.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/774899924/usb_host_hid_device.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/774899924/usb_host_hid_device.o.d" -o ${OBJECTDIR}/_ext/774899924/usb_host_hid_device.o ../../LibOS/drivers/PIC32/usb/usb_host_hid_device.c   
	
${OBJECTDIR}/_ext/774899924/usb_host_hid_parser.o: ../../LibOS/drivers/PIC32/usb/usb_host_hid_parser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/774899924 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_host_hid_parser.o.d 
	@${RM} ${OBJECTDIR}/_ext/774899924/usb_host_hid_parser.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/774899924/usb_host_hid_parser.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/774899924/usb_host_hid_parser.o.d" -o ${OBJECTDIR}/_ext/774899924/usb_host_hid_parser.o ../../LibOS/drivers/PIC32/usb/usb_host_hid_parser.c   
	
${OBJECTDIR}/_ext/727035557/drvILI9320.o: ../../LibOS/drivers/drvILI9320.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/727035557 
	@${RM} ${OBJECTDIR}/_ext/727035557/drvILI9320.o.d 
	@${RM} ${OBJECTDIR}/_ext/727035557/drvILI9320.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/727035557/drvILI9320.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/727035557/drvILI9320.o.d" -o ${OBJECTDIR}/_ext/727035557/drvILI9320.o ../../LibOS/drivers/drvILI9320.c   
	
${OBJECTDIR}/_ext/727035557/drvSDCard.o: ../../LibOS/drivers/drvSDCard.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/727035557 
	@${RM} ${OBJECTDIR}/_ext/727035557/drvSDCard.o.d 
	@${RM} ${OBJECTDIR}/_ext/727035557/drvSDCard.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/727035557/drvSDCard.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/727035557/drvSDCard.o.d" -o ${OBJECTDIR}/_ext/727035557/drvSDCard.o ../../LibOS/drivers/drvSDCard.c   
	
${OBJECTDIR}/_ext/727035557/drvKeyboardScancodeMapper.o: ../../LibOS/drivers/drvKeyboardScancodeMapper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/727035557 
	@${RM} ${OBJECTDIR}/_ext/727035557/drvKeyboardScancodeMapper.o.d 
	@${RM} ${OBJECTDIR}/_ext/727035557/drvKeyboardScancodeMapper.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/727035557/drvKeyboardScancodeMapper.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/727035557/drvKeyboardScancodeMapper.o.d" -o ${OBJECTDIR}/_ext/727035557/drvKeyboardScancodeMapper.o ../../LibOS/drivers/drvKeyboardScancodeMapper.c   
	
${OBJECTDIR}/_ext/1904831615/sysTimer.o: ../../LibOS/source/sysTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/sysTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/sysTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/sysTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/sysTimer.o.d" -o ${OBJECTDIR}/_ext/1904831615/sysTimer.o ../../LibOS/source/sysTimer.c   
	
${OBJECTDIR}/_ext/1904831615/guiCommon.o: ../../LibOS/source/guiCommon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/guiCommon.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/guiCommon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/guiCommon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/guiCommon.o.d" -o ${OBJECTDIR}/_ext/1904831615/guiCommon.o ../../LibOS/source/guiCommon.c   
	
${OBJECTDIR}/_ext/1904831615/guiColorGraphics.o: ../../LibOS/source/guiColorGraphics.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/guiColorGraphics.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/guiColorGraphics.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/guiColorGraphics.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/guiColorGraphics.o.d" -o ${OBJECTDIR}/_ext/1904831615/guiColorGraphics.o ../../LibOS/source/guiColorGraphics.c   
	
${OBJECTDIR}/_ext/727035557/drvResourceArray.o: ../../LibOS/drivers/drvResourceArray.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/727035557 
	@${RM} ${OBJECTDIR}/_ext/727035557/drvResourceArray.o.d 
	@${RM} ${OBJECTDIR}/_ext/727035557/drvResourceArray.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/727035557/drvResourceArray.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/727035557/drvResourceArray.o.d" -o ${OBJECTDIR}/_ext/727035557/drvResourceArray.o ../../LibOS/drivers/drvResourceArray.c   
	
${OBJECTDIR}/_ext/1904831615/sysString.o: ../../LibOS/source/sysString.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/sysString.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/sysString.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/sysString.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/sysString.o.d" -o ${OBJECTDIR}/_ext/1904831615/sysString.o ../../LibOS/source/sysString.c   
	
${OBJECTDIR}/_ext/1904831615/fbBuffer.o: ../../LibOS/source/fbBuffer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbBuffer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbBuffer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fbBuffer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fbBuffer.o.d" -o ${OBJECTDIR}/_ext/1904831615/fbBuffer.o ../../LibOS/source/fbBuffer.c   
	
${OBJECTDIR}/_ext/1904831615/fbColorRenderer.o: ../../LibOS/source/fbColorRenderer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbColorRenderer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbColorRenderer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fbColorRenderer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fbColorRenderer.o.d" -o ${OBJECTDIR}/_ext/1904831615/fbColorRenderer.o ../../LibOS/source/fbColorRenderer.c   
	
${OBJECTDIR}/_ext/1904831615/fbFileBrowser.o: ../../LibOS/source/fbFileBrowser.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbFileBrowser.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbFileBrowser.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fbFileBrowser.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fbFileBrowser.o.d" -o ${OBJECTDIR}/_ext/1904831615/fbFileBrowser.o ../../LibOS/source/fbFileBrowser.c   
	
${OBJECTDIR}/_ext/1904831615/fbFileEnumerator.o: ../../LibOS/source/fbFileEnumerator.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbFileEnumerator.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbFileEnumerator.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fbFileEnumerator.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fbFileEnumerator.o.d" -o ${OBJECTDIR}/_ext/1904831615/fbFileEnumerator.o ../../LibOS/source/fbFileEnumerator.c   
	
${OBJECTDIR}/_ext/1904831615/fbIconMapper.o: ../../LibOS/source/fbIconMapper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbIconMapper.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbIconMapper.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fbIconMapper.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fbIconMapper.o.d" -o ${OBJECTDIR}/_ext/1904831615/fbIconMapper.o ../../LibOS/source/fbIconMapper.c   
	
${OBJECTDIR}/_ext/1904831615/fileFAT.o: ../../LibOS/source/fileFAT.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fileFAT.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fileFAT.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fileFAT.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fileFAT.o.d" -o ${OBJECTDIR}/_ext/1904831615/fileFAT.o ../../LibOS/source/fileFAT.c   
	
${OBJECTDIR}/_ext/1904831615/fileFATFunctionWrapper.o: ../../LibOS/source/fileFATFunctionWrapper.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fileFATFunctionWrapper.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fileFATFunctionWrapper.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fileFATFunctionWrapper.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fileFATFunctionWrapper.o.d" -o ${OBJECTDIR}/_ext/1904831615/fileFATFunctionWrapper.o ../../LibOS/source/fileFATFunctionWrapper.c   
	
${OBJECTDIR}/_ext/1904831615/fileUtils.o: ../../LibOS/source/fileUtils.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fileUtils.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fileUtils.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fileUtils.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fileUtils.o.d" -o ${OBJECTDIR}/_ext/1904831615/fileUtils.o ../../LibOS/source/fileUtils.c   
	
${OBJECTDIR}/_ext/1904831615/fileVolumes.o: ../../LibOS/source/fileVolumes.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fileVolumes.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fileVolumes.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fileVolumes.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fileVolumes.o.d" -o ${OBJECTDIR}/_ext/1904831615/fileVolumes.o ../../LibOS/source/fileVolumes.c   
	
${OBJECTDIR}/_ext/1904831615/sysDateTime.o: ../../LibOS/source/sysDateTime.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/sysDateTime.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/sysDateTime.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/sysDateTime.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/sysDateTime.o.d" -o ${OBJECTDIR}/_ext/1904831615/sysDateTime.o ../../LibOS/source/sysDateTime.c   
	
${OBJECTDIR}/_ext/1904831615/fbUserInputHandler.o: ../../LibOS/source/fbUserInputHandler.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1904831615 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbUserInputHandler.o.d 
	@${RM} ${OBJECTDIR}/_ext/1904831615/fbUserInputHandler.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1904831615/fbUserInputHandler.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1904831615/fbUserInputHandler.o.d" -o ${OBJECTDIR}/_ext/1904831615/fbUserInputHandler.o ../../LibOS/source/fbUserInputHandler.c   
	
${OBJECTDIR}/source/main.o: source/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/main.o.d 
	@${RM} ${OBJECTDIR}/source/main.o 
	@${FIXDEPS} "${OBJECTDIR}/source/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/source/main.o.d" -o ${OBJECTDIR}/source/main.o source/main.c   
	
${OBJECTDIR}/source/sysInitialization.o: source/sysInitialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/sysInitialization.o.d 
	@${RM} ${OBJECTDIR}/source/sysInitialization.o 
	@${FIXDEPS} "${OBJECTDIR}/source/sysInitialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/source/sysInitialization.o.d" -o ${OBJECTDIR}/source/sysInitialization.o source/sysInitialization.c   
	
${OBJECTDIR}/source/fbResource.o: source/fbResource.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/fbResource.o.d 
	@${RM} ${OBJECTDIR}/source/fbResource.o 
	@${FIXDEPS} "${OBJECTDIR}/source/fbResource.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/source/fbResource.o.d" -o ${OBJECTDIR}/source/fbResource.o source/fbResource.c   
	
${OBJECTDIR}/source/uart2.o: source/uart2.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/uart2.o.d 
	@${RM} ${OBJECTDIR}/source/uart2.o 
	@${FIXDEPS} "${OBJECTDIR}/source/uart2.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/source/uart2.o.d" -o ${OBJECTDIR}/source/uart2.o source/uart2.c   
	
${OBJECTDIR}/source/uart2to1.o: source/uart2to1.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/source 
	@${RM} ${OBJECTDIR}/source/uart2to1.o.d 
	@${RM} ${OBJECTDIR}/source/uart2to1.o 
	@${FIXDEPS} "${OBJECTDIR}/source/uart2to1.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -DDEBUG_MODE -I"../../LibOS/include" -I"include" -I"../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/source/uart2to1.o.d" -o ${OBJECTDIR}/source/uart2to1.o source/uart2to1.c   
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/PIC32FileBrowser.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PIC32MXSK=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC32FileBrowser.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}              -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PIC32MXSK=1,--defsym=_min_heap_size=8192,--defsym=_min_stack_size=8192,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/PIC32FileBrowser.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/PIC32FileBrowser.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=_min_heap_size=8192,--defsym=_min_stack_size=8192,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/PIC32FileBrowser.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
