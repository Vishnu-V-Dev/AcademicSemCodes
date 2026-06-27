@echo off
setlocal

:: ===== SETTINGS =====
set "LOCKFOLDER=SecureData"
set "ALIAS=System.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
set "PASSWORD=8788"
set "MAX_FAILS=3"
:: ====================

:: Check if folder is locked
if exist "%ALIAS%" (
    set "STATE=LOCKED"
) else (
    set "STATE=UNLOCKED"
)

:: Create folder if missing
if "%STATE%"=="UNLOCKED" if not exist "%LOCKFOLDER%" md "%LOCKFOLDER%"

:: Auto-lock if unlocked
if "%STATE%"=="UNLOCKED" goto LOCK

:: Unlock process if locked
goto UNLOCK

:: ========== LOCK ==========
:LOCK
ren "%LOCKFOLDER%" "%ALIAS%"
attrib +h +s "%ALIAS%"
goto END

:: ========== UNLOCK ==========
:UNLOCK
set /a fail=0

:ASKPASS
set /p "pass=>"
if "%pass%"=="%PASSWORD%" goto SUCCESS
set /a fail+=1
if %fail% GEQ %MAX_FAILS% exit
goto ASKPASS

:SUCCESS
attrib -h -s "%ALIAS%"
ren "%ALIAS%" "%LOCKFOLDER%"
goto END

:END
exit
