@echo off
title ASSISTANT FUNKIN GIRL (0.1)
setlocal EnableExtensions

set pag=0
set pagmax=4
set cache=""

:menu
cls
color 9e

echo:
echo:                        /ASSISTANT FUNKIN GIRL\
echo:     ____________________________________________________________
echo:



if %pag% == 0 (
echo:       1. Check files
echo:       2. Check storage
echo:       3. Optimize storage
echo:       4. Clear cache
echo:       5. Check ram
echo:       6. Performance settings
echo:       7. Clear dns
) else if %pag% == 1 (
echo:       1. Turn wifi off and on
echo:       2. Solve router problems
echo:       3. Installed applications
echo:       4. Application name/id
echo:       5. Force uninstall application
echo:       6. Update applications
echo:       7. System settings
) else if %pag% == 2 (
echo:       1. Disable hibernation
echo:       2. Disable windows update
echo:       3. Power diagnosis
echo:       4. Enter bios
echo:       5. System information
echo:       6. Anti-virus 
echo:       7. Maintenance
) else (
echo:                             AREA GITHUB
echo:       1. MicroWin
echo:       2. Microsoft Activation Scripts
echo:       3. WinScript
echo:       4. Remove Windows 11 AI
echo:       5. gihub the 
echo:       6. donate
)



echo:
echo:       0. Change Page
echo:     ============================================================
echo:
echo:                               CREDITS
echo:        Creator: Marshverso (YT) \ Beta Tester: FandeFNF (YT)
echo:     ____________________________________________________________

choice /C 12345670 /N
cls

set option=%errorlevel%

if %option%==8 goto changepag

if %option%==1 ( if %pag%==0 ( goto files )        else if %pag%==1 ( goto turnwifi )             else if %pag%==2 ( goto dishibernation )        else ( goto microwin ) )
if %option%==2 ( if %pag%==0 ( goto storage )      else if %pag%==1 ( goto routerproblems )       else if %pag%==2 ( goto diswiupdate )           else ( goto microsoftAcSc ) )
if %option%==3 ( if %pag%==0 ( goto optimize )     else if %pag%==1 ( goto inapplication )        else if %pag%==2 ( goto powerdig )              else ( goto winscript ) )
if %option%==4 ( if %pag%==0 ( goto cache )        else if %pag%==1 ( goto applicationid )        else if %pag%==2 ( goto enterbios )             else ( goto removewiia ) )
if %option%==5 ( if %pag%==0 ( goto ram)           else if %pag%==1 ( goto forceuninstall )       else if %pag%==2 ( goto sysinfo )               else ( goto gitafg ) )
if %option%==6 ( if %pag%==0 ( goto perf)          else if %pag%==1 ( goto upapplication )        else if %pag%==2 ( goto antvirus )              else ( goto donate ) )
if %option%==7 ( if %pag%==0 ( goto dns)           else if %pag%==1 ( goto systemsettings )       else if %pag%==2 ( goto maintenance )           else ( goto None ) )



::
:files
sfc /scannow
dism /online /cleanup-image /scanhealth
dism /online /cleanup-image /restorehealth
pause
goto menu

:storage
set /p cache="UNIT LETTER: "
set cache=%cache::=%
chkdsk %cache%: /f /r /x
pause
goto menu

:optimize
set /p cache="UNIT LETTER: "
set cache=%cache::=%
defrag %cache%: /O
pause
goto menu

:cache
del /q /f /s %temp%\*
del /q /f /s C:\Windows\Temp\*
rmdir /s /q C:\Windows\Prefetch && cleanmgr
pause
goto menu

:ram
mdsched
goto menu

:perf
SystemPropertiesPerformance
goto menu

:dns
ipconfig /flushdns
pause
goto menu

::

:turnwifi
set /p cache="Do you have a wired (Ethernet) connection? Y/N:"
cls
if "%cache%" == "y" (
  netsh interface set interface name="Ethernet" admin=disable
  timeout /t 10
  netsh interface set interface name="Ethernet" admin=enable
) else if "%cache%" == "n" (
  echo: Unfortunately this code cannot be executed.
)
pause
goto menu

:routerproblems
set /p cache="Do you have a wired (Ethernet) connection? Y/N:"
cls
if "%cache%" == "y" (
  netsh winsock reset
  netsh int ip reset
  shutdown /r /t 0
) else (
  echo: Unfortunately this code cannot be executed.
)
pause
goto menu

:inapplication
explorer shell:AppsFolder
pause
goto menu

:applicationid
winget list
pause
goto menu

:forceuninstall
set /p cache="Open the option (Application name/id) and then Write the application: "
winget uninstall %cache%
pause
goto menu

:upapplication
winget upgrade --all
pause
goto menu

:systemsettings
msconfig
pause
goto menu

::

:dishibernation
powercfg -h off
pause
goto menu

:diswiupdate
sc config wuauserv start= disabled
net stop wuauserv
sc config bits start= disabled
net stop bits
pause
goto menu

:powerdig
powercfg -energy
pause
goto menu

:enterbios
shutdown /r /fw /t 0
pause
goto menu

:sysinfo
systeminfo
pause
goto menu

:antvirus
mrt
pause
goto menu

:maintenance
msdt.exe /id MaintenanceDiagnostic
pause
goto menu

::

:microwin
powershell -NoProfile -ExecutionPolicy Bypass -Command "iwr 'https://christitus.com/win' | iex"
goto menu

:microsoftAcSc
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm 'https://get.activated.win' | iex"
goto menu

:winscript
powershell -NoProfile -ExecutionPolicy Bypass -Command "irm 'https://winscript.cc/irm' | iex"
goto menu

:removewiia
powershell -NoProfile -ExecutionPolicy Bypass -Command "& ([scriptblock]::Create((irm 'https://raw.githubusercontent.com/zoicware/RemoveWindowsAI/main/RemoveWindowsAi.ps1')))"
goto menu

:gitafg
start https://github.com/Marshverso2/Assistant-Funkin-Girl
goto menu

:donate
start https://youtu.be/dQw4w9WgXcQ?si=w_goPty3bYh29pW8
goto menu

:: universais
:changepag
set /a pag=%pag%+1
if %pag% GEQ %pagmax% set pag=0
goto menu

:None
goto menu
