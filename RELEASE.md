# Release checklist

1. Build locally with `build.bat`.
2. Test Classic and Matrix themes.
3. Test START/STOP and both tray icon states.
4. Test minimize/restore and tray menu.
5. Test keyboard/mouse activity detection.
6. Test sleep/display options.
7. Test saved settings after restart.
8. Test Czech/English switching.
9. Confirm diagnostic log and 30-day cleanup.
10. Tag the release, for example:
   `git tag v2.0.0`
11. Push the tag:
   `git push origin v2.0.0`
12. Create a GitHub Release and attach `MouseMover.exe`.
