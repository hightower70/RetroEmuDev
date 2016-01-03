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
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Homelab.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Homelab.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../../../LibEmu/resources/homelab/hl3_chargen.c ../../../LibEmu/resources/homelab/hl3_rom.c ../../../LibEmu/resources/homelab/hl4_rom.c ../../../LibEmu/source/cpuZ80.c ../../../LibEmu/source/hwHomeLab.c ../../../LibEmu/source/scrHomeLabbw.c ../../../LibOS/drivers/PIC32/source/drvHighresTimer.c ../../../LibOS/drivers/PIC32/source/drvSystemTimer.c ../../../LibOS/drivers/PIC32/source/drvBWVideo.c ../../../LibOS/source/sysDateTime.c ../../../LibOS/source/sysHighResTimer.c ../../../LibOS/source/sysString.c ../../../LibOS/source/sysTimer.c ../../../LibOS/drivers/drvBlackAndWhiteSWRenderer.c ../../../LibOS/drivers/drvResourceArray.c ../../../LibOS/source/guiBlackAndWhiteGraphics.c ../../../LibOS/source/guiCommon.c ../source/appSettings.c ../source/sysInitialization.c ../source/main.c ../source/sysResource.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/155236340/hl3_chargen.o ${OBJECTDIR}/_ext/155236340/hl3_rom.o ${OBJECTDIR}/_ext/155236340/hl4_rom.o ${OBJECTDIR}/_ext/462793587/cpuZ80.o ${OBJECTDIR}/_ext/462793587/hwHomeLab.o ${OBJECTDIR}/_ext/462793587/scrHomeLabbw.o ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o ${OBJECTDIR}/_ext/1971247418/drvBWVideo.o ${OBJECTDIR}/_ext/860825648/sysDateTime.o ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o ${OBJECTDIR}/_ext/860825648/sysString.o ${OBJECTDIR}/_ext/860825648/sysTimer.o ${OBJECTDIR}/_ext/563064790/drvBlackAndWhiteSWRenderer.o ${OBJECTDIR}/_ext/563064790/drvResourceArray.o ${OBJECTDIR}/_ext/860825648/guiBlackAndWhiteGraphics.o ${OBJECTDIR}/_ext/860825648/guiCommon.o ${OBJECTDIR}/_ext/812168374/appSettings.o ${OBJECTDIR}/_ext/812168374/sysInitialization.o ${OBJECTDIR}/_ext/812168374/main.o ${OBJECTDIR}/_ext/812168374/sysResource.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/155236340/hl3_chargen.o.d ${OBJECTDIR}/_ext/155236340/hl3_rom.o.d ${OBJECTDIR}/_ext/155236340/hl4_rom.o.d ${OBJECTDIR}/_ext/462793587/cpuZ80.o.d ${OBJECTDIR}/_ext/462793587/hwHomeLab.o.d ${OBJECTDIR}/_ext/462793587/scrHomeLabbw.o.d ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o.d ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o.d ${OBJECTDIR}/_ext/1971247418/drvBWVideo.o.d ${OBJECTDIR}/_ext/860825648/sysDateTime.o.d ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o.d ${OBJECTDIR}/_ext/860825648/sysString.o.d ${OBJECTDIR}/_ext/860825648/sysTimer.o.d ${OBJECTDIR}/_ext/563064790/drvBlackAndWhiteSWRenderer.o.d ${OBJECTDIR}/_ext/563064790/drvResourceArray.o.d ${OBJECTDIR}/_ext/860825648/guiBlackAndWhiteGraphics.o.d ${OBJECTDIR}/_ext/860825648/guiCommon.o.d ${OBJECTDIR}/_ext/812168374/appSettings.o.d ${OBJECTDIR}/_ext/812168374/sysInitialization.o.d ${OBJECTDIR}/_ext/812168374/main.o.d ${OBJECTDIR}/_ext/812168374/sysResource.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/155236340/hl3_chargen.o ${OBJECTDIR}/_ext/155236340/hl3_rom.o ${OBJECTDIR}/_ext/155236340/hl4_rom.o ${OBJECTDIR}/_ext/462793587/cpuZ80.o ${OBJECTDIR}/_ext/462793587/hwHomeLab.o ${OBJECTDIR}/_ext/462793587/scrHomeLabbw.o ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o ${OBJECTDIR}/_ext/1971247418/drvBWVideo.o ${OBJECTDIR}/_ext/860825648/sysDateTime.o ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o ${OBJECTDIR}/_ext/860825648/sysString.o ${OBJECTDIR}/_ext/860825648/sysTimer.o ${OBJECTDIR}/_ext/563064790/drvBlackAndWhiteSWRenderer.o ${OBJECTDIR}/_ext/563064790/drvResourceArray.o ${OBJECTDIR}/_ext/860825648/guiBlackAndWhiteGraphics.o ${OBJECTDIR}/_ext/860825648/guiCommon.o ${OBJECTDIR}/_ext/812168374/appSettings.o ${OBJECTDIR}/_ext/812168374/sysInitialization.o ${OBJECTDIR}/_ext/812168374/main.o ${OBJECTDIR}/_ext/812168374/sysResource.o

# Source Files
SOURCEFILES=../../../LibEmu/resources/homelab/hl3_chargen.c ../../../LibEmu/resources/homelab/hl3_rom.c ../../../LibEmu/resources/homelab/hl4_rom.c ../../../LibEmu/source/cpuZ80.c ../../../LibEmu/source/hwHomeLab.c ../../../LibEmu/source/scrHomeLabbw.c ../../../LibOS/drivers/PIC32/source/drvHighresTimer.c ../../../LibOS/drivers/PIC32/source/drvSystemTimer.c ../../../LibOS/drivers/PIC32/source/drvBWVideo.c ../../../LibOS/source/sysDateTime.c ../../../LibOS/source/sysHighResTimer.c ../../../LibOS/source/sysString.c ../../../LibOS/source/sysTimer.c ../../../LibOS/drivers/drvBlackAndWhiteSWRenderer.c ../../../LibOS/drivers/drvResourceArray.c ../../../LibOS/source/guiBlackAndWhiteGraphics.c ../../../LibOS/source/guiCommon.c ../source/appSettings.c ../source/sysInitialization.c ../source/main.c ../source/sysResource.c


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
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Homelab.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

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
${OBJECTDIR}/_ext/155236340/hl3_chargen.o: ../../../LibEmu/resources/homelab/hl3_chargen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/155236340 
	@${RM} ${OBJECTDIR}/_ext/155236340/hl3_chargen.o.d 
	@${RM} ${OBJECTDIR}/_ext/155236340/hl3_chargen.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/155236340/hl3_chargen.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/155236340/hl3_chargen.o.d" -o ${OBJECTDIR}/_ext/155236340/hl3_chargen.o ../../../LibEmu/resources/homelab/hl3_chargen.c    -G 0
	
${OBJECTDIR}/_ext/155236340/hl3_rom.o: ../../../LibEmu/resources/homelab/hl3_rom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/155236340 
	@${RM} ${OBJECTDIR}/_ext/155236340/hl3_rom.o.d 
	@${RM} ${OBJECTDIR}/_ext/155236340/hl3_rom.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/155236340/hl3_rom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/155236340/hl3_rom.o.d" -o ${OBJECTDIR}/_ext/155236340/hl3_rom.o ../../../LibEmu/resources/homelab/hl3_rom.c    -G 0
	
${OBJECTDIR}/_ext/155236340/hl4_rom.o: ../../../LibEmu/resources/homelab/hl4_rom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/155236340 
	@${RM} ${OBJECTDIR}/_ext/155236340/hl4_rom.o.d 
	@${RM} ${OBJECTDIR}/_ext/155236340/hl4_rom.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/155236340/hl4_rom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/155236340/hl4_rom.o.d" -o ${OBJECTDIR}/_ext/155236340/hl4_rom.o ../../../LibEmu/resources/homelab/hl4_rom.c    -G 0
	
${OBJECTDIR}/_ext/462793587/cpuZ80.o: ../../../LibEmu/source/cpuZ80.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/462793587 
	@${RM} ${OBJECTDIR}/_ext/462793587/cpuZ80.o.d 
	@${RM} ${OBJECTDIR}/_ext/462793587/cpuZ80.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/462793587/cpuZ80.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/462793587/cpuZ80.o.d" -o ${OBJECTDIR}/_ext/462793587/cpuZ80.o ../../../LibEmu/source/cpuZ80.c    -G 0
	
${OBJECTDIR}/_ext/462793587/hwHomeLab.o: ../../../LibEmu/source/hwHomeLab.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/462793587 
	@${RM} ${OBJECTDIR}/_ext/462793587/hwHomeLab.o.d 
	@${RM} ${OBJECTDIR}/_ext/462793587/hwHomeLab.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/462793587/hwHomeLab.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/462793587/hwHomeLab.o.d" -o ${OBJECTDIR}/_ext/462793587/hwHomeLab.o ../../../LibEmu/source/hwHomeLab.c    -G 0
	
${OBJECTDIR}/_ext/462793587/scrHomeLabbw.o: ../../../LibEmu/source/scrHomeLabbw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/462793587 
	@${RM} ${OBJECTDIR}/_ext/462793587/scrHomeLabbw.o.d 
	@${RM} ${OBJECTDIR}/_ext/462793587/scrHomeLabbw.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/462793587/scrHomeLabbw.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/462793587/scrHomeLabbw.o.d" -o ${OBJECTDIR}/_ext/462793587/scrHomeLabbw.o ../../../LibEmu/source/scrHomeLabbw.c    -G 0
	
${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o: ../../../LibOS/drivers/PIC32/source/drvHighresTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1971247418 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o.d" -o ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o ../../../LibOS/drivers/PIC32/source/drvHighresTimer.c    -G 0
	
${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o: ../../../LibOS/drivers/PIC32/source/drvSystemTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1971247418 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o.d" -o ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o ../../../LibOS/drivers/PIC32/source/drvSystemTimer.c    -G 0
	
${OBJECTDIR}/_ext/1971247418/drvBWVideo.o: ../../../LibOS/drivers/PIC32/source/drvBWVideo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1971247418 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvBWVideo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvBWVideo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971247418/drvBWVideo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1971247418/drvBWVideo.o.d" -o ${OBJECTDIR}/_ext/1971247418/drvBWVideo.o ../../../LibOS/drivers/PIC32/source/drvBWVideo.c    -G 0
	
${OBJECTDIR}/_ext/860825648/sysDateTime.o: ../../../LibOS/source/sysDateTime.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysDateTime.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysDateTime.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/sysDateTime.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/sysDateTime.o.d" -o ${OBJECTDIR}/_ext/860825648/sysDateTime.o ../../../LibOS/source/sysDateTime.c    -G 0
	
${OBJECTDIR}/_ext/860825648/sysHighResTimer.o: ../../../LibOS/source/sysHighResTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/sysHighResTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/sysHighResTimer.o.d" -o ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o ../../../LibOS/source/sysHighResTimer.c    -G 0
	
${OBJECTDIR}/_ext/860825648/sysString.o: ../../../LibOS/source/sysString.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysString.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysString.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/sysString.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/sysString.o.d" -o ${OBJECTDIR}/_ext/860825648/sysString.o ../../../LibOS/source/sysString.c    -G 0
	
${OBJECTDIR}/_ext/860825648/sysTimer.o: ../../../LibOS/source/sysTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/sysTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/sysTimer.o.d" -o ${OBJECTDIR}/_ext/860825648/sysTimer.o ../../../LibOS/source/sysTimer.c    -G 0
	
${OBJECTDIR}/_ext/563064790/drvBlackAndWhiteSWRenderer.o: ../../../LibOS/drivers/drvBlackAndWhiteSWRenderer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/563064790 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvBlackAndWhiteSWRenderer.o.d 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvBlackAndWhiteSWRenderer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/563064790/drvBlackAndWhiteSWRenderer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/563064790/drvBlackAndWhiteSWRenderer.o.d" -o ${OBJECTDIR}/_ext/563064790/drvBlackAndWhiteSWRenderer.o ../../../LibOS/drivers/drvBlackAndWhiteSWRenderer.c    -G 0
	
${OBJECTDIR}/_ext/563064790/drvResourceArray.o: ../../../LibOS/drivers/drvResourceArray.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/563064790 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvResourceArray.o.d 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvResourceArray.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/563064790/drvResourceArray.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/563064790/drvResourceArray.o.d" -o ${OBJECTDIR}/_ext/563064790/drvResourceArray.o ../../../LibOS/drivers/drvResourceArray.c    -G 0
	
${OBJECTDIR}/_ext/860825648/guiBlackAndWhiteGraphics.o: ../../../LibOS/source/guiBlackAndWhiteGraphics.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/guiBlackAndWhiteGraphics.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/guiBlackAndWhiteGraphics.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/guiBlackAndWhiteGraphics.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/guiBlackAndWhiteGraphics.o.d" -o ${OBJECTDIR}/_ext/860825648/guiBlackAndWhiteGraphics.o ../../../LibOS/source/guiBlackAndWhiteGraphics.c    -G 0
	
${OBJECTDIR}/_ext/860825648/guiCommon.o: ../../../LibOS/source/guiCommon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/guiCommon.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/guiCommon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/guiCommon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/guiCommon.o.d" -o ${OBJECTDIR}/_ext/860825648/guiCommon.o ../../../LibOS/source/guiCommon.c    -G 0
	
${OBJECTDIR}/_ext/812168374/appSettings.o: ../source/appSettings.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/812168374 
	@${RM} ${OBJECTDIR}/_ext/812168374/appSettings.o.d 
	@${RM} ${OBJECTDIR}/_ext/812168374/appSettings.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/812168374/appSettings.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/812168374/appSettings.o.d" -o ${OBJECTDIR}/_ext/812168374/appSettings.o ../source/appSettings.c    -G 0
	
${OBJECTDIR}/_ext/812168374/sysInitialization.o: ../source/sysInitialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/812168374 
	@${RM} ${OBJECTDIR}/_ext/812168374/sysInitialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/812168374/sysInitialization.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/812168374/sysInitialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/812168374/sysInitialization.o.d" -o ${OBJECTDIR}/_ext/812168374/sysInitialization.o ../source/sysInitialization.c    -G 0
	
${OBJECTDIR}/_ext/812168374/main.o: ../source/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/812168374 
	@${RM} ${OBJECTDIR}/_ext/812168374/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/812168374/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/812168374/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/812168374/main.o.d" -o ${OBJECTDIR}/_ext/812168374/main.o ../source/main.c    -G 0
	
${OBJECTDIR}/_ext/812168374/sysResource.o: ../source/sysResource.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/812168374 
	@${RM} ${OBJECTDIR}/_ext/812168374/sysResource.o.d 
	@${RM} ${OBJECTDIR}/_ext/812168374/sysResource.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/812168374/sysResource.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE) -g -D__DEBUG -D__MPLAB_DEBUGGER_PIC32MXSK=1 -fframe-base-loclist  -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/812168374/sysResource.o.d" -o ${OBJECTDIR}/_ext/812168374/sysResource.o ../source/sysResource.c    -G 0
	
else
${OBJECTDIR}/_ext/155236340/hl3_chargen.o: ../../../LibEmu/resources/homelab/hl3_chargen.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/155236340 
	@${RM} ${OBJECTDIR}/_ext/155236340/hl3_chargen.o.d 
	@${RM} ${OBJECTDIR}/_ext/155236340/hl3_chargen.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/155236340/hl3_chargen.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/155236340/hl3_chargen.o.d" -o ${OBJECTDIR}/_ext/155236340/hl3_chargen.o ../../../LibEmu/resources/homelab/hl3_chargen.c    -G 0
	
${OBJECTDIR}/_ext/155236340/hl3_rom.o: ../../../LibEmu/resources/homelab/hl3_rom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/155236340 
	@${RM} ${OBJECTDIR}/_ext/155236340/hl3_rom.o.d 
	@${RM} ${OBJECTDIR}/_ext/155236340/hl3_rom.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/155236340/hl3_rom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/155236340/hl3_rom.o.d" -o ${OBJECTDIR}/_ext/155236340/hl3_rom.o ../../../LibEmu/resources/homelab/hl3_rom.c    -G 0
	
${OBJECTDIR}/_ext/155236340/hl4_rom.o: ../../../LibEmu/resources/homelab/hl4_rom.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/155236340 
	@${RM} ${OBJECTDIR}/_ext/155236340/hl4_rom.o.d 
	@${RM} ${OBJECTDIR}/_ext/155236340/hl4_rom.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/155236340/hl4_rom.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/155236340/hl4_rom.o.d" -o ${OBJECTDIR}/_ext/155236340/hl4_rom.o ../../../LibEmu/resources/homelab/hl4_rom.c    -G 0
	
${OBJECTDIR}/_ext/462793587/cpuZ80.o: ../../../LibEmu/source/cpuZ80.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/462793587 
	@${RM} ${OBJECTDIR}/_ext/462793587/cpuZ80.o.d 
	@${RM} ${OBJECTDIR}/_ext/462793587/cpuZ80.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/462793587/cpuZ80.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/462793587/cpuZ80.o.d" -o ${OBJECTDIR}/_ext/462793587/cpuZ80.o ../../../LibEmu/source/cpuZ80.c    -G 0
	
${OBJECTDIR}/_ext/462793587/hwHomeLab.o: ../../../LibEmu/source/hwHomeLab.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/462793587 
	@${RM} ${OBJECTDIR}/_ext/462793587/hwHomeLab.o.d 
	@${RM} ${OBJECTDIR}/_ext/462793587/hwHomeLab.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/462793587/hwHomeLab.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/462793587/hwHomeLab.o.d" -o ${OBJECTDIR}/_ext/462793587/hwHomeLab.o ../../../LibEmu/source/hwHomeLab.c    -G 0
	
${OBJECTDIR}/_ext/462793587/scrHomeLabbw.o: ../../../LibEmu/source/scrHomeLabbw.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/462793587 
	@${RM} ${OBJECTDIR}/_ext/462793587/scrHomeLabbw.o.d 
	@${RM} ${OBJECTDIR}/_ext/462793587/scrHomeLabbw.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/462793587/scrHomeLabbw.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/462793587/scrHomeLabbw.o.d" -o ${OBJECTDIR}/_ext/462793587/scrHomeLabbw.o ../../../LibEmu/source/scrHomeLabbw.c    -G 0
	
${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o: ../../../LibOS/drivers/PIC32/source/drvHighresTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1971247418 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o.d" -o ${OBJECTDIR}/_ext/1971247418/drvHighresTimer.o ../../../LibOS/drivers/PIC32/source/drvHighresTimer.c    -G 0
	
${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o: ../../../LibOS/drivers/PIC32/source/drvSystemTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1971247418 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o.d" -o ${OBJECTDIR}/_ext/1971247418/drvSystemTimer.o ../../../LibOS/drivers/PIC32/source/drvSystemTimer.c    -G 0
	
${OBJECTDIR}/_ext/1971247418/drvBWVideo.o: ../../../LibOS/drivers/PIC32/source/drvBWVideo.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/1971247418 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvBWVideo.o.d 
	@${RM} ${OBJECTDIR}/_ext/1971247418/drvBWVideo.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1971247418/drvBWVideo.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/1971247418/drvBWVideo.o.d" -o ${OBJECTDIR}/_ext/1971247418/drvBWVideo.o ../../../LibOS/drivers/PIC32/source/drvBWVideo.c    -G 0
	
${OBJECTDIR}/_ext/860825648/sysDateTime.o: ../../../LibOS/source/sysDateTime.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysDateTime.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysDateTime.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/sysDateTime.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/sysDateTime.o.d" -o ${OBJECTDIR}/_ext/860825648/sysDateTime.o ../../../LibOS/source/sysDateTime.c    -G 0
	
${OBJECTDIR}/_ext/860825648/sysHighResTimer.o: ../../../LibOS/source/sysHighResTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/sysHighResTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/sysHighResTimer.o.d" -o ${OBJECTDIR}/_ext/860825648/sysHighResTimer.o ../../../LibOS/source/sysHighResTimer.c    -G 0
	
${OBJECTDIR}/_ext/860825648/sysString.o: ../../../LibOS/source/sysString.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysString.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysString.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/sysString.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/sysString.o.d" -o ${OBJECTDIR}/_ext/860825648/sysString.o ../../../LibOS/source/sysString.c    -G 0
	
${OBJECTDIR}/_ext/860825648/sysTimer.o: ../../../LibOS/source/sysTimer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysTimer.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/sysTimer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/sysTimer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/sysTimer.o.d" -o ${OBJECTDIR}/_ext/860825648/sysTimer.o ../../../LibOS/source/sysTimer.c    -G 0
	
${OBJECTDIR}/_ext/563064790/drvBlackAndWhiteSWRenderer.o: ../../../LibOS/drivers/drvBlackAndWhiteSWRenderer.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/563064790 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvBlackAndWhiteSWRenderer.o.d 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvBlackAndWhiteSWRenderer.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/563064790/drvBlackAndWhiteSWRenderer.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/563064790/drvBlackAndWhiteSWRenderer.o.d" -o ${OBJECTDIR}/_ext/563064790/drvBlackAndWhiteSWRenderer.o ../../../LibOS/drivers/drvBlackAndWhiteSWRenderer.c    -G 0
	
${OBJECTDIR}/_ext/563064790/drvResourceArray.o: ../../../LibOS/drivers/drvResourceArray.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/563064790 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvResourceArray.o.d 
	@${RM} ${OBJECTDIR}/_ext/563064790/drvResourceArray.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/563064790/drvResourceArray.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/563064790/drvResourceArray.o.d" -o ${OBJECTDIR}/_ext/563064790/drvResourceArray.o ../../../LibOS/drivers/drvResourceArray.c    -G 0
	
${OBJECTDIR}/_ext/860825648/guiBlackAndWhiteGraphics.o: ../../../LibOS/source/guiBlackAndWhiteGraphics.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/guiBlackAndWhiteGraphics.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/guiBlackAndWhiteGraphics.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/guiBlackAndWhiteGraphics.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/guiBlackAndWhiteGraphics.o.d" -o ${OBJECTDIR}/_ext/860825648/guiBlackAndWhiteGraphics.o ../../../LibOS/source/guiBlackAndWhiteGraphics.c    -G 0
	
${OBJECTDIR}/_ext/860825648/guiCommon.o: ../../../LibOS/source/guiCommon.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/860825648 
	@${RM} ${OBJECTDIR}/_ext/860825648/guiCommon.o.d 
	@${RM} ${OBJECTDIR}/_ext/860825648/guiCommon.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/860825648/guiCommon.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/860825648/guiCommon.o.d" -o ${OBJECTDIR}/_ext/860825648/guiCommon.o ../../../LibOS/source/guiCommon.c    -G 0
	
${OBJECTDIR}/_ext/812168374/appSettings.o: ../source/appSettings.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/812168374 
	@${RM} ${OBJECTDIR}/_ext/812168374/appSettings.o.d 
	@${RM} ${OBJECTDIR}/_ext/812168374/appSettings.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/812168374/appSettings.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/812168374/appSettings.o.d" -o ${OBJECTDIR}/_ext/812168374/appSettings.o ../source/appSettings.c    -G 0
	
${OBJECTDIR}/_ext/812168374/sysInitialization.o: ../source/sysInitialization.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/812168374 
	@${RM} ${OBJECTDIR}/_ext/812168374/sysInitialization.o.d 
	@${RM} ${OBJECTDIR}/_ext/812168374/sysInitialization.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/812168374/sysInitialization.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/812168374/sysInitialization.o.d" -o ${OBJECTDIR}/_ext/812168374/sysInitialization.o ../source/sysInitialization.c    -G 0
	
${OBJECTDIR}/_ext/812168374/main.o: ../source/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/812168374 
	@${RM} ${OBJECTDIR}/_ext/812168374/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/812168374/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/812168374/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/812168374/main.o.d" -o ${OBJECTDIR}/_ext/812168374/main.o ../source/main.c    -G 0
	
${OBJECTDIR}/_ext/812168374/sysResource.o: ../source/sysResource.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} ${OBJECTDIR}/_ext/812168374 
	@${RM} ${OBJECTDIR}/_ext/812168374/sysResource.o.d 
	@${RM} ${OBJECTDIR}/_ext/812168374/sysResource.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/812168374/sysResource.o.d" $(SILENT) -rsi ${MP_CC_DIR}../  -c ${MP_CC}  $(MP_EXTRA_CC_PRE)  -g -x c -c -mprocessor=$(MP_PROCESSOR_OPTION)  -funroll-loops -I"../../../LibEmu/include" -I"../../../LibOS/include" -I"../include" -I"../../../LibOS/drivers/PIC32/include" -MMD -MF "${OBJECTDIR}/_ext/812168374/sysResource.o.d" -o ${OBJECTDIR}/_ext/812168374/sysResource.o ../source/sysResource.c    -G 0
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compileCPP
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Homelab.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mdebugger -D__MPLAB_DEBUGGER_PIC32MXSK=1 -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Homelab.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}              -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),--defsym=__MPLAB_DEBUG=1,--defsym=__DEBUG=1,--defsym=__MPLAB_DEBUGGER_PIC32MXSK=1,-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	
else
dist/${CND_CONF}/${IMAGE_TYPE}/Homelab.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_CC} $(MP_EXTRA_LD_PRE)  -mprocessor=$(MP_PROCESSOR_OPTION)  -o dist/${CND_CONF}/${IMAGE_TYPE}/Homelab.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} ${OBJECTFILES_QUOTED_IF_SPACED}          -Wl,--defsym=__MPLAB_BUILD=1$(MP_EXTRA_LD_POST)$(MP_LINKER_FILE_OPTION),-Map="${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"
	${MP_CC_DIR}\\xc32-bin2hex dist/${CND_CONF}/${IMAGE_TYPE}/Homelab.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX} 
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
