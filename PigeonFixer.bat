@echo off
setlocal enabledelayedexpansion
color 0f
chcp 65001 >nul 2>&1

net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting administrator privileges...
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

:MENU
cls
echo(
echo   ██████╗ ██╗ ██████╗ ███████╗ ██████╗ ███╗   ██╗
echo   ██╔══██╗██║██╔════╝ ██╔════╝██╔═══██╗████╗  ██║
echo   ██████╔╝██║██║  ███╗█████╗  ██║   ██║██╔██╗ ██║
echo   ██╔═══╝ ██║██║   ██║██╔══╝  ██║   ██║██║╚██╗██║
echo   ██║     ██║╚██████╔╝███████╗╚██████╔╝██║ ╚████║
echo   ╚═╝     ╚═╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═══╝
echo(
echo   NEW SERVER - https://discord.gg/QcRfmnug
echo(
echo ------------------------------------------------------------------------
echo 1) - INSTALL REQUIRED FILES
echo 2) - FORCE ROBLOX VERSION (INSTALL LATEST)
echo 3) - REPAIR REDISTRUTABLES
echo 4) - FIX BLUE SCREENS
echo 5) - FIX BLACK SCREENS
echo 6) - CLEAR TEMP
echo 7) - EXIT
echo ------------------------------------------------------------------------
echo(

set /p choice="Select an option (1-7): "

if "%choice%"=="1" goto FIX1
if "%choice%"=="2" goto FIX2
if "%choice%"=="3" goto FIX3
if "%choice%"=="4" goto FIX4
if "%choice%"=="5" goto FIX5
if "%choice%"=="6" goto FIX6
if "%choice%"=="7" exit
goto MENU

:FIX1
echo INSTALLING REQUIRED SOFTWARES...
echo DOWNLOADING VC REDIST X64...
powershell -Command "Start-Process 'https://aka.ms/vs/17/release/vc_redist.x64.exe' -Wait"
echo DOWNLOADING VC REDIST X86...
powershell -Command "Start-Process 'https://aka.ms/vs/17/release/vc_redist.x86.exe' -Wait"
echo DOWNLOADING DIRECT X...
powershell -Command "Start-Process 'https://download.microsoft.com/download/1/7/1/1718CCC4-6315-4D8E-9543-8E28A4E18C4C/dxwebsetup.exe' -Wait"
pause
goto MENU

:FIX2
echo FORCING LATEST ROBLOX VERSION...
powershell -Command "Start-Process 'https://rdd.weao.gg/'"
pause
goto MENU

:FIX3
echo REPAIRING...
set x64_url=https://aka.ms/vs/17/release/vc_redist.x64.exe
set x86_url=https://aka.ms/vs/17/release/vc_redist.x86.exe
set x64_file=%temp%\vc_redist.x64.exe
set x86_file=%temp%\vc_redist.x86.exe
echo DOWNLOAD VC REDIST X64...
bitsadmin /transfer "DownloadX64" %x64_url% %x64_file%
echo DOWNLOAD VC REDIST X86...
bitsadmin /transfer "DownloadX86" %x86_url% %x86_file%
echo RUNNING VC REDIST X64 IN REPAIR MODE...
%x64_file% /repair /quiet /norestart
echo RUNNING VC REDIST X86 IN REPAIR MODE...
%x86_file% /repair /quiet /norestart
echo CLEANING UP...
del %x64_file%
del %x86_file%
echo REPAIR FINISHED! RESTART COMPUTER!
pause
goto MENU

:FIX4
echo FIXING BLUE SCREENS...
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v EnableVirtualizationBasedSecurity /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v EnableUefiNetworkStack /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v EnableDriverSecurity /t REG_DWORD /d 0 /f
pause
goto MENU

:FIX5
echo FIX FOR BLACK SCREENS ON ROBLOX...
echo 1 - CLICK ON YOUR WINDOWS KEY
echo 2 - SEARCH FOR DISPLAY SETTINGS AND OPEN IT
echo 3 - FIND RESOLUTION
echo 4 - KEEP SETTING IT HIGHER UNTIL IT IS FIXED!
pause
goto MENU

:FIX6
echo CLEARING UP TEMP FILES...
del /s /q "%temp%\*.*"
for /d %%p in ("%temp%\*.*") do rmdir "%%p" /s /q
echo TEMPORARY FILES HAVE BEEN DELETED
pause
goto MENU