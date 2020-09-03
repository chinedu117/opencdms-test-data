@ECHO OFF
:*
:*    This batch file will install the following files in the CLICOM and
:*    CLIGRAF directories:
:*
:*            - REPLMAP.EXE file in \CLICOM\PROG
:*            - Help files (*.HLP) in \CLICOM\HELP
:*            - Message files (Messages.*) in \CLICOM\DATA
:*            - Modify USERMENU.DEF file in \CLICOM\FORM
:*            - Modify GRAFMENU.DEF file in \CLICOM\FORM
:*            - Make a subdirectory CLICMAP under \CLIGRAF\MAP
:*            - LINESEG.DAT file in \CLIGRAF\MAP\CLICMAP
:*            - COAST.JMA file in \CLIGRAF\MAP\CLICMAP
:*            - DETAILMP.RMP file in \CLIGRAF\MAP\CLICMAP
:*    
:*    Before the installation takes place, you must provide the location of
:*    CLICOM program drive and CLIGRAF drive.  
:* 
:BEGIN
CLS
IF "%1"==""   GOTO MESSAGE
IF "%1"=="c"  GOTO MESSAGE
IF "%1"=="C"  GOTO MESSAGE
IF "%1"=="c:" GOTO MESSAGE
IF "%1"=="C:" GOTO MESSAGE
IF "%1"=="a:" GOTO NEXTA
IF "%1"=="A:" GOTO NEXTA
IF "%1"=="a"  GOTO NEXTA
IF "%1"=="A"  GOTO NEXTA
IF "%1"=="b:" GOTO NEXTB
IF "%1"=="B:" GOTO NEXTB
IF "%1"=="b"  GOTO NEXTB
IF "%1"=="B"  GOTO NEXTB
GOTO MESSAGE
:NEXTA
SET DRVLTR=A
GOTO CONTINUE
:NEXTB
SET DRVLTR=B
:CONTINUE
%DRVLTR%:
CD\
ECHO [2;44;37m
ECHO [14C����������������������������������������������ͻ
ECHO [14C�                                              �
ECHO [14C�             C L I C O M     3.0              �
ECHO [14C�                                              �
ECHO [14C����������������������������������������������ͼ[1;40;33m
ECHO [1B
ECHO  This batch file will install REPLMAP.EXE in the \CLICOM\PROG directory.
ECHO  This program allows the user to define a replacement map with specific
ECHO  area and level of detail.
ECHO [1B
ECHO  The installation requires the following information:
ECHO [1B
ECHO      1.  CLICOM program drive
ECHO      2.  CLIGRAF program drive
ECHO [1B[36m
%DRVLTR%:\QUERY  Do you want to continue the installation (Y/N)? @YN
IF ERRORLEVEL 2 GOTO QUIT
ECHO [33m
COPY %DRVLTR%:\MODMAP.BAT C:\ > NUL
COPY %DRVLTR%:\RMCLICM?.MNU C:\ > NUL
%DRVLTR%:\MAPSETUP
IF ERRORLEVEL 3 GOTO QUIT
C:\CALLMAP
GOTO EXIT
:QUIT
CLS
ECHO [6B[1;40;33m
ECHO [14C�����������������������������������������������ͻ
ECHO [14C�                                               �
ECHO [14C�  You are now at the DOS command prompt line.  �
ECHO [14C�                                               �
ECHO [14C�         To continue the procedure type:       �
ECHO [14C�                                               �
ECHO [14C� [14C [36m %DRVLTR%:\INST-MAP %DRVLTR%[33m[17C�
ECHO [14C�                                               �
ECHO [14C�����������������������������������������������ͼ[1;40;33m
ECHO [8B
GOTO EXIT
:MESSAGE
CLS
ECHO 
ECHO [6B[1;40;33m
ECHO [12C������������������������������������������������������ͻ
ECHO [12C�                                                      �
ECHO [12C�  To install files from the installation disk in the  �
ECHO [12C�  CLICOM and CLIGRAF directories.  You must provide   �
ECHO [12C�  the source drive letter (A or B).  For example, if  �
ECHO [12C�  the installation diskette is in drive A, at the     �
ECHO [12C�  DOS prompt type:                                    �
ECHO [12C�                                                      �  
ECHO [12C�              [36m A:\INST-MAP A [33m[18C       �  
ECHO [12C�                           �                          �
ECHO [12C�                           ���Source drive            �
ECHO [12C�                                                      �
ECHO [12C������������������������������������������������������ͼ[1;40;33m
ECHO [8B
:EXIT 
SET DRVLTR=
IF EXIST C:\MODMAP.BAT DEL C:\MODMAP.BAT
IF EXIST C:\CALLMAP.BAT DEL C:\CALLMAP.BAT
IF EXIST C:\RMCLICM?.MNU DEL C:\RMCLICM?.MNU
C:
CD\
