@echo off
:: ============================================================================
:: TeamCity permissions fix script
::
:: Restricts access users other than Administrators and System
:: to the given directory
::
:: Usage: fix-permissions.bar <Folder Path>
::
:: ============================================================================
if "%~1" == "" goto:usage
cd /d %~dp0
:main
SET TARGET=%~1
:: disable permissions inheritance for current folder and allow Administrators full access
icacls "%TARGET%" /inheritance:r /grant:r *S-1-5-32-544:(OI)(CI)(F)
:: grant system full access
call grant-permissions.bat "%TARGET%" "*S-1-5-18"
goto:end
:usage
echo Script usage: fix-permissions.bat TeamCityInstallDir
goto:end
:end
