@echo off
title SYSTEM SECURITY LOCKDOWN
color 0C
setlocal enabledelayedexpansion

:: ===== SETTINGS =====
set "LOCKFOLDER=Access"
set "ALIAS=Access.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
set "PASSWORD=8722"
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
echo ============================================
echo           SYSTEM LOCKED
echo ============================================
set /p "pass=ENTER PASSWORD TO UNLOCK: "

if "%pass%"=="%PASSWORD%" goto SUCCESS

set /a fail+=1
set /a chances=%MAX_FAILS% - %fail%
echo.
echo !!! WARNING: INVALID PASSWORD ENTERED !!!
echo You have !chances! attempt(s) remaining before SYSTEM ACTION
echo Initiating simulated system lockdown...
for /l %%i in (5,-1,1) do (
    <nul set /p="%%i... "
    ping -n 2 127.0.0.1 >nul
)
echo.
if !fail! GEQ %MAX_FAILS% (
    echo MAX ATTEMPTS REACHED. TERMINAL WILL CLOSE.
    timeout 3 >nul
    exit
)
goto ASKPASS

:SUCCESS
attrib -h -s "%ALIAS%"
ren "%ALIAS%" "%LOCKFOLDER%"
echo.
echo ACCESS GRANTED. FOLDER UNLOCKED.
timeout 2 >nul
goto END

:END
exit
