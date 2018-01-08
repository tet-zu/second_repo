@echo off
:: ============================================================================
:: Grants full permissions to a given user on a given path
::
:: Usage: grant-permissions.bar <Folder Path> username
::
:: ============================================================================
if "%~1" == "" goto:target_empty
if "%~2" == "" goto:username_empty
:main
SET TARGET=%~1
SET USERNAME=%~2
icacls "%TARGET%" /grant:r "%USERNAME%":(OI)(CI)(F)
goto:end
:target_empty
echo Folder path is not defined
goto:usage
:username_empty
echo Username is not defined. Must be either SID or DOMAIN\USERNAME
goto:usage
:usage
echo Script usage: grant-permissions.bat path username
echo path - path to folder to grant permissions on
echo username - either SID or DOMAIN\USERNAME of user that will be granted permissions
goto:end
:end
