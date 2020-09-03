@ECHO OFF
::
::    This batch file will install the following files in the CLICOM
::    directory:
::
::            - MRGTWF.EXE file in \CLICOM\PROG
::            - Help files (*.HLP) in \CLICOM\HELP
::            - PRINTWF.PRM IN \CLICOM\DATA
::            - Message files (Messages.*) in \CLICOM\DATA
::            - Modify USERMENU.DEF file in \CLICOM\FORM
::            - Modify FORTRAN definition form index file in \CLICOM\FORM
::            - Forms (*.FRM) in \CLICOM\FORM
::    
::    Before the installation takes place, you must provide the location of
::    CLICOM program drive and CLIGRAF drive.  
:: 
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
ECHO  This batch file will install MRGTWF.EXE in the \CLICOM\PROG directory.
ECHO  The MRGTWF.EXE program allows the user to merge key-entry files or
ECHO  retrieve a key-entry file information.
ECHO [1B
ECHO  The installation requires the following information:
ECHO [1B
ECHO      1.  CLICOM program drive
ECHO      2.  CLIGRAF program drive
ECHO [1B[36m
%DRVLTR%:\QUERY  Do you want to continue the installation (Y/N)? @YN
IF ERRORLEVEL 2 GOTO QUIT
ECHO [33m
COPY %DRVLTR%:\MRGTWF\MODTWF.BAT C:\ > NUL
COPY %DRVLTR%:\MRGTWF\MRGTWF?.MNU C:\ > NUL
%DRVLTR%:\MRGTWF\TWFSETUP
IF ERRORLEVEL 3 GOTO QUIT
C:\CALLTWF
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
ECHO [14C� [14C [36m %DRVLTR%:\INST-TWF %DRVLTR%[33m[17C�
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
ECHO [12C�  CLICOM.  You must provide the source drive letter   �
ECHO [12C�  (A or B).  For example, if the installation         �
ECHO [12C�  diskette is in drive A, at the DOS prompt type:     �
ECHO [12C�                                                      �  
ECHO [12C�              [36m A:\INST-TWF A [33m[18C       �  
ECHO [12C�                           �                          �
ECHO [12C�                           ���Source drive            �
ECHO [12C�                                                      �
ECHO [12C������������������������������������������������������ͼ[1;40;33m
ECHO [8B
:EXIT 
SET DRVLTR=
IF EXIST C:\MODTWF.BAT DEL C:\MODTWF.BAT
IF EXIST C:\CALLTWF.BAT DEL C:\CALLTWF.BAT
IF EXIST C:\MRGTWF?.MNU DEL C:\MRGTWF?.MNU
C:
CD\
