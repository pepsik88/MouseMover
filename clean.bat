@echo off
cd /d "%~dp0"
if exist build rmdir /s /q build
if exist MouseMover.exe del /q MouseMover.exe
echo Build files removed.
