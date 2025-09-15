@echo off
REM Bahoot CMD wrapper for Windows
REM This script allows you to run Bahoot from CMD, auto-detecting PowerShell and launching the CLI

setlocal
set "BAHOOT_DIR=%USERPROFILE%\.bahoot\bin"

REM Ensure PowerShell is available
where powershell >nul 2>nul
if errorlevel 1 (
    echo PowerShell is required to run Bahoot CLI on Windows.
    echo Please install PowerShell: https://aka.ms/powershell
    exit /b 1
)

REM Run Bahoot PowerShell CLI
powershell -ExecutionPolicy Bypass -File "%BAHOOT_DIR%\bahoot.ps1" %*
endlocal
