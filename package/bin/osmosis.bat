@ECHO OFF

rem ------------------------------------------------------------------------------
rem This was developed from the previous Windows "osmosis.bat" which in turn was 
rem a copy of the Unix version.
rem
rem The main changes are to add comments and remove things that can break, so 
rem no execution of random batch files from unexpected folders such as 
rem "C:\ProgramData"
rem ------------------------------------------------------------------------------

rem ------------------------------------------------------------------------------
rem Use "java" from the path.  This is what almost every other Java application
rem will do; anything else will just confuse users.
rem ------------------------------------------------------------------------------
set JAVACMD=java

rem ------------------------------------------------------------------------------
rem The net result of the jiggerypokery below is so that a command similar to this
rem eventually gets executed:
rem
rem "java" -cp "C:\Temp\osmosis-latest\lib\default\plexus-classworlds-2.5.2.jar" -Dapp.home="C:\Temp\osmosis-latest" -Dclassworlds.conf="C:\Temp\osmosis-latest\config\plexus.conf" org.codehaus.classworlds.Launcher
rem
rem with the full path used for the "classworlds" launcher, "app_home" and the 
rem classworlds.conf file.
rem ------------------------------------------------------------------------------

REM Set "SAVEDIR" to the current directory
set SAVEDIR=%CD%
set MYAPP_HOME=%~dp0..
REM Now make the MYAPP_HOME path absolute
cd /D %MYAPP_HOME%
set MYAPP_HOME=%CD%
REM Change back to the original directory
cd /D %SAVEDIR%

set MAINCLASS=org.codehaus.classworlds.Launcher
set PLEXUS_CP=%MYAPP_HOME%\lib\default\plexus-classworlds-2.5.2.jar
SET EXEC="%JAVACMD%" -cp "%PLEXUS_CP%" -Dapp.home="%MYAPP_HOME%" -Dclassworlds.conf="%MYAPP_HOME%\config\plexus.conf" %MAINCLASS%  %OSMOSIS_OPTIONS% %*

%EXEC%
