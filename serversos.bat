@echo off
set fnm=d:\test1\computers.txt
set lnm=d:\test1\ping.txt

if exist %fnm% goto Try1

echo
echo Can't find %fnm%
echo
Pause
goto :sos

:Try1
echo Test started on %date% > %lnm%
echo
for /f %%i in (%fnm%) do call :backup %%i
echo
echo Test ended on %date% >> %lnm%
echo finishing up
goto :sos

:backup
echo Testing %1
set state=alive
ping -n 1 %1 
if errorlevel 1 set state=dead
echo %1 is %state% >> %lnm%
