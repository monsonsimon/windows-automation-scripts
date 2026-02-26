@echo off
title System Slow Repair Tool

echo ================================
echo   System Cleanup Starting...
echo ================================
echo.

:: Delete Windows Temp
echo Cleaning C:\Windows\Temp ...
del /f /s /q C:\Windows\Temp\*.* >nul 2>&1
for /d %%x in (C:\Windows\Temp\*) do rd /s /q "%%x"

:: Delete User Temp
echo Cleaning %TEMP% ...
del /f /s /q "%TEMP%\*.*" >nul 2>&1
for /d %%x in ("%TEMP%\*") do rd /s /q "%%x"

:: Delete Prefetch
echo Cleaning C:\Windows\Prefetch ...
del /f /s /q C:\Windows\Prefetch\*.*

echo.
echo Cleanup Completed!
echo.

:: Create message file and open Notepad
echo You can use your PC now,> "%temp%\note_to_user.txt"
echo Restart the PC after scan complete.>> "%temp%\note_to_user.txt"
start notepad "%temp%\note_to_user.txt"

echo.
echo Starting System File Checker...
echo Please wait...
echo.

sfc /scannow

echo.
echo SFC Completed.
echo Starting DISM Repair...
echo.

DISM /Online /Cleanup-Image /RestoreHealth

echo.
echo =====================================
echo   All operations completed.
echo   Please Restart your PC.
echo =====================================
pause