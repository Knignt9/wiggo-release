@echo off
setlocal
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0Wiggo-Setup.ps1"
if errorlevel 1 pause
endlocal
