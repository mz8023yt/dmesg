@echo off
set pra=dmesg -c
set log=%DATE:~0,4%%DATE:~5,2%%DATE:~8,2%-%TIME:~0,2%%TIME:~3,2%%TIME:~6,2%.txt
if "%~1" neq "" (set pra="dmesg %~1")
if "%~2" neq "" (set log="%~2")
echo %pra% %log%
@echo on

adb wait-for-device
adb root
adb wait-for-device
@rem adb shell %pra:"=% |tee %log%
adb shell %pra:"=% > %log%
