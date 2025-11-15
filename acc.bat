@ECHO OFF
if EXIST "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" goto UNLOCK
if NOT EXIST Access goto MDACCESS

:CONFIRM
echo Are you sure you want to lock this folder? (Y/N)
set /p "cho=>"
if /I "%cho%"=="Y" goto LOCK
if /I "%cho%"=="N" goto END
echo Invalid choice.
goto CONFIRM

:LOCK
ren Access "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
attrib +h +s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
echo Folder locked.
goto End

:UNLOCK
echo Enter password to unlock your secure folder
set /p "pass=>"
if NOT "%pass%"=="YOUR-PASSWORD" goto FAIL
attrib -h -s "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}"
ren "Control Panel.{21EC2020-3AEA-1069-A2DD-08002B30309D}" Access
echo Folder unlocked successfully.
goto End

:FAIL
echo Invalid password.
goto End

:MDACCESS
md Access
echo Access folder created successfully.
goto End

:End




pass:

8722
8788
