@echo off
title System Information Report

echo ==========================================
echo         SYSTEM INFORMATION REPORT
echo ==========================================
echo.

:: Windows Version
echo ---------------
echo Windows Version
echo ---------------
:: Get OS Name cleanly
for /f "tokens=2,*" %%a in ('systeminfo ^| find "OS Name"') do set OSNAME=%%b
:: Get OS Version cleanly
for /f "tokens=*" %%v in ('ver') do set OSVER=%%v
:: Print aligned output
echo OS Name:       %OSNAME%
echo OS Version:    %OSVER%
echo.

:: IP Details
echo ----------
echo IP Details
echo ----------
ipconfig | find "IPv4"
echo.

:: DNS Details
echo -----------
echo DNS Details
echo -----------
ipconfig -all | find "DNS Servers"
echo.

:: MAC Details
echo -----------
echo MAC Details
echo -----------
getmac -v | find "Device\"
getmac -v | find "Wi-Fi"
echo.

:: Hostname
echo --------
echo Hostname
echo --------
hostname
echo.

:: DNS Ping Test
echo ----------------------------------
echo DNS Ping Test (Google DNS 8.8.8.8)
echo ----------------------------------
ping 8.8.8.8
echo.

:: System Serial Number
echo --------------------
echo System Serial Number
echo --------------------
wmic bios get serialnumber
echo.

pause