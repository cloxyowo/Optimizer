@echo off
title Cloxy PC Optimizer - Made by the GOAT himself
color 0A

echo [*] Starting PC optimization...
timeout /t 1 >nul

:: Clean temp files
echo [+] Cleaning temporary files...
del /s /q "%TEMP%\*.*" >nul 2>&1
del /s /q "C:\Windows\Temp\*.*" >nul 2>&1
timeout /t 1 >nul

:: Flush DNS
echo [+] Flushing DNS cache...
ipconfig /flushdns
timeout /t 1 >nul

:: Clear prefetch data
echo [+] Cleaning prefetch cache...
del /s /q "C:\Windows\Prefetch\*.*" >nul 2>&1
timeout /t 1 >nul

:: Clear Windows Update cache
echo [+] Cleaning Windows Update cache...
net stop wuauserv >nul 2>&1
net stop bits >nul 2>&1
del /s /q "C:\Windows\SoftwareDistribution\Download\*.*" >nul 2>&1
net start wuauserv >nul 2>&1
net start bits >nul 2>&1
timeout /t 1 >nul

:: Clear event logs
echo [+] Clearing system logs...
for /F "tokens=*" %%1 in ('wevtutil.exe el') DO wevtutil.exe cl "%%1"
timeout /t 1 >nul

:: Optional: Kill resource-hungry background processes
echo [+] Killing unnecessary tasks...
taskkill /f /im OneDrive.exe >nul 2>&1
taskkill /f /im YourPhone.exe >nul 2>&1
taskkill /f /im SearchApp.exe >nul 2>&1

:: Done
echo [✓] Optimization complete! Your PC is now faster than your enemies' reactions.
pause
exit
