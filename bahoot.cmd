@echo off
REM Bahoot CMD wrapper for Windows
REM This script allows you to run Bahoot from CMD, auto-detecting PowerShell and launching the CLI

@echo off
REM Bahoot CMD wrapper for Windows
REM This script allows you to run Bahoot from CMD, auto-detecting PowerShell and launching the CLI

set "BAHOOT_PS1=%USERPROFILE%\.bahoot\bin\bahoot.ps1"

REM Ensure PowerShell is available
where powershell >nul 2>nul
if errorlevel 1 (
    echo PowerShell is required to run Bahoot CLI on Windows.
    echo Please install PowerShell: https://aka.ms/powershell
    exit /b 1
)

REM Run Bahoot PowerShell CLI with correct quoting
powershell -ExecutionPolicy Bypass -File "%BAHOOT_PS1%" %*
