# Mouse Mover

A lightweight native Windows utility that keeps a workstation awake and can perform small random cursor movements while respecting real user activity.

Created by **Tomáš Němec**.

## Features

- Random mouse movement by a configurable number of pixels, followed by return to the original position
- Configurable movement interval with `MM:SS` countdown
- Physical mouse movement detection
- Fast keyboard activity detection
- User activity resets the movement countdown
- Windows sleep prevention via `SetThreadExecutionState`
- Optional keep-display-on mode
- Active time schedule, including ranges across midnight
- Selectable active days Monday–Sunday
- Optional pause while a fullscreen application is active
- Start/Stop without exiting the application
- Minimize to system tray and tray control menu
- Dynamic tray tooltip and state/theme-dependent tray icon
- Windows autostart option
- Persistent settings
- Single-instance protection
- Movement/reset statistics
- Optional diagnostic log with 30-day retention
- Czech and English UI
- Switchable **Classic** and **Matrix** themes
- Animated **Digital Rain** background in Matrix mode
- Settings persist across application restarts

## Requirements

- Windows 10/11
- A C++17-capable MinGW-w64 compiler
- `g++` and `windres` available in `PATH`

The project has been developed with WinLibs/MinGW-w64 and uses the native Win32 API. No third-party runtime libraries are required.

## Build

Open `cmd.exe` in the repository directory and run:

```bat
build.bat
```

The resulting executable is:

```text
MouseMover.exe
```

If the build reports that `MouseMover.exe` cannot be opened or is currently running, exit the existing Mouse Mover instance from the system tray and run the build again.

To remove generated build files:

```bat
clean.bat
```

## Manual build

```bat
mkdir build
windres resources\MouseMover.rc -I resources -O coff -o build\MouseMover_res.o
g++ -std=c++17 -O2 -mwindows src\MouseMover.cpp build\MouseMover_res.o -o MouseMover.exe -lshell32
```

## Settings and diagnostic log

Runtime data is stored under the user's application-data area used by Mouse Mover. The diagnostic log is:

```text
%APPDATA%\MouseMover\MouseMover.log
```

The diagnostic log has a 30-day retention policy.

## Repository layout

```text
MouseMover/
├── .github/
│   └── workflows/
│       └── build.yml
├── resources/
│   ├── MouseMover.ico
│   └── MouseMover.rc
├── screenshots/
│   └── README.md
├── src/
│   └── MouseMover.cpp
├── .gitignore
├── build.bat
├── clean.bat
├── LICENSE
└── README.md
```

## GitHub Actions

The included workflow performs a Windows build using MSYS2/MinGW-w64 and uploads `MouseMover.exe` as a workflow artifact.

## Security / behavior note

Mouse Mover uses Windows input/activity APIs to detect local keyboard and mouse activity. It does not need network access.

## License

MIT License. See `LICENSE`.
