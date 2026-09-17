@echo off
setlocal
cd /d "%~dp0"

echo.
echo ========================================
echo   Mouse Mover - Windows build
echo ========================================
echo.

where g++ >nul 2>nul || (
  echo ERROR: g++ was not found in PATH.
  echo Install MinGW-w64 / WinLibs and add its bin directory to PATH.
  exit /b 1
)

where windres >nul 2>nul || (
  echo ERROR: windres was not found in PATH.
  exit /b 1
)

tasklist /FI "IMAGENAME eq MouseMover.exe" 2>NUL | find /I "MouseMover.exe" >NUL
if not errorlevel 1 (
  echo ERROR: MouseMover.exe is currently running.
  echo Exit Mouse Mover from the system tray and build again.
  exit /b 1
)

if not exist build mkdir build

echo [1/2] Compiling resources...
windres resources\MouseMover.rc -I resources -O coff -o build\MouseMover_res.o || exit /b 1

echo [2/2] Compiling application...
g++ -std=c++17 -O2 -mwindows ^
  src\MouseMover.cpp ^
  build\MouseMover_res.o ^
  -o MouseMover.exe ^
  -lshell32 -lwtsapi32 || exit /b 1

echo.
echo BUILD SUCCESSFUL: MouseMover.exe
echo.
