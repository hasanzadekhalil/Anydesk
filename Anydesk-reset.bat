@echo off
REM Stop Anydesk application
taskkill /f /im AnyDesk.exe

REM Delete all files in C:\ProgramData\AnyDesk
del "C:\ProgramData\AnyDesk\*.*" /q /f

REM Remove all files except user.conf and thumbnails in %userprofile%\AppData\Roaming\AnyDesk
for %%F in ("%userprofile%\AppData\Roaming\AnyDesk\*.*") do (
    if "%%~nxF" neq "user.conf" (
        if "%%~nxF" neq "thumbnails" (
            del "%%F"
        )
    )
)

REM Start AnyDesk application again
start "" "C:\Program Files (x86)\AnyDesk\AnyDesk.exe"

exit
