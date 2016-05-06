
@echo off

COLOR b

goto menu

::main menu 

:menu
cls
echo.
echo            .:: HELPDESK TECHNOLOGY ::.
echo.
echo General Checklist
echo =================
echo.
echo  1 FOR VIRUS / Slow Computer 
echo  2 HDD Problem / Windows Update problem / Software Installation 
echo  3 Windows Updates and other important Updates installation  
echo  4 Install ninite programs /flash/MSE/MBAM/Auslogics/Glary/Super/Spybot...
echo  7 Credential Manager
echo  8 Complete Internet Repair
echo.
echo  0   CMD
echo  5   Exit Program
echo  6   Reboot the computer
echo  10  Open Wiki
echo.

:: choice for the main menu 

:choice
set /P C=[0,1,2,3,4,5,6,7,10]: 
echo.
if "%C%"=="5" goto quit
if "%C%"=="0" goto cmd
if "%C%"=="3" goto soft
if "%C%"=="2" goto repair
if "%C%"=="1" goto virus
if "%C%"=="4" goto install
if "%C%"=="6" goto reboot
if "%C%"=="7" goto cre
if "%C%"=="8" goto network
if "%C%"=="10" goto wiki
echo.
goto choice

:: choice menu for running windows updates 

:soft
echo  [0] Main menu
echo.
echo * Update Windows
echo * Update Antivirus
echo * Update Flash, Flash (IE), Java, Shockwave, Acrobat Reader
echo.
echo You will need to run some of the updates manually, Opening windows updates.....
echo.
pause
cls 
goto win

:: choice menu for HDD issue

:repair
echo.
echo  [0] Main menu
echo.
echo    1 Run chkdsk C: /R
echo.
echo    2 Run Disk Defragment (Auslogics works faster, get it from ninite.com)
echo.
echo    3 Disk cleanup
echo.
echo    4 Run sfc /scannow
echo.
echo ==========================================================
echo.
echo - Memory issue ~~ Memtest / your need to boot the computer
echo   and use the helpedesk disk/flash drive.
echo.
echo - Hard Drive issue ~~ HDD Regen / GW Scan / 
echo   your need to boot the computer and use the helpedesk disk.
echo.

:: this the choice menu for repair 

:orepair
set /P C=[0,1,2,3,4]: 
echo.
if "%C%"=="0"  goto menu
if "%C%"=="1"  goto chk
if "%C%"=="2"  goto diskf
if "%C%"=="3"  goto cleanup
if "%C%"=="4"  goto sfc
echo.
goto orepair

:: code to run check disk 

:chk
chkdsk /r
echo Done....
pause 
cls
goto repair

:: disk cleanup codes 

:cleanup
echo Process Cancel hit Ctl+c
echo.
echo. Please wait...
cd C:\windows\system32
%SystemRoot%\System32\Cmd.exe /c Cleanmgr /sageset:65535 & Cleanmgr /sagerun:65535
echo done...
pause 
goto repair 

:: code to run sfc/scannow

:sfc
sfc/scannow
echo Done....
pause 
goto repair

:: credential manager 

:cre
rundll32.exe keymgr.dll, KRShowKeyMgr
pause
goto menu

:: defragmentation codes 

:diskf
echo.
echo Defragmentation on partion C:
echo.
defrag C: /u /v
echo.
cls
goto repair

:: for virus menu choice

:virus
cls
echo.
echo             [0] Main menu
echo.
echo Step:
echo.
echo       1  Clear cmd screen
echo.
echo       2  Clean Temp folder %temp%
echo.
echo       3  Uncheck MsConfig items [manually]
echo.
echo       4  Reset Internet Explorer
echo.
echo       5  Run RKill / TDSS Killer / Killbox
echo.
echo       6  Run Combofix / Malwarebytes / SpyBot / Super Antispyware
echo.
echo       7  Run CCleaner / Glarys
echo.
echo       8  force Uninstall free trial AntiVirus/Ununnecessary software..
echo.
echo       9  Uninstall multiple AntiVirus/Ununnecessary software..
echo.
echo      10  Install SEP / MSE
echo.
echo.

:: this is the menu  FOR VIRUS / Slow Computer

:ovirus
set /P C=[0,1,2,3,4,5,6,7,8,9,10]: 
echo.
if "%C%"=="0"  goto menu
if "%C%"=="1"  goto virus
if "%C%"=="2"  goto temp
if "%C%"=="3"  goto msconfig
if "%C%"=="4"  goto reset
if "%C%"=="5"  goto rkill
if "%C%"=="6"  goto combo
if "%C%"=="7"  goto cc
if "%C%"=="8"  goto uninstall
if "%C%"=="9"  goto remove
if "%C%"=="10" goto sep
echo.
goto ovirus

cls
goto menu

:: install Sep codes 

:sep
echo.
echo  1: SEP32 , 2: MSE32 , 3: MSE64 , 4: SEP64 , 0: Cancel , 10:System info
echo.
set /P C=[0,1,2,3,4,10]: 
echo.
if "%C%"=="4"  goto sep64
if "%C%"=="1"  goto sep32
if "%C%"=="2"  goto mse32
if "%C%"=="3"  goto mse64
if "%C%"=="0"  goto ovirus
if "%C%"=="10"  goto info
echo.
goto sep

:: run rkill codes 

:rkill
echo.
echo  1: RKill , 2: TDSS Kliler  , 3: kill box , 0: Cancel
echo.
set /P C=[0,1,2,3,7]: 
echo.
if "%C%"=="0"  goto virus
if "%C%"=="1"  goto rkill1
if "%C%"=="2"  goto tdss
if "%C%"=="3"  goto kbox
echo.
goto rkill


:: check if it's 64/32 info

:info
start msinfo32 
pause 
goto rkill

:: run combofix 

:combo
echo.
echo  1: ComboFix , 2: Malwarebytes  , 3: SpyBot , 4:Super Antispyware 0: Cancel
echo.
set /P C=[0,1,2,3,4]: 
echo.
if "%C%"=="0"  goto virus
if "%C%"=="1"  goto combo1
if "%C%"=="2"  goto mbam
if "%C%"=="3"  goto spbot
if "%C%"=="4"  goto sant
echo.
goto combo

::running mbam

:mbam
start /wait Malware" "Programs\MBAM\mbam.exe /sp- /verysilent /norestart
start mbam
echo Done.
pause
goto combo

:: run spybot

:spbot
echo Installing in process ...
start /wait Malware" "Programs\Spybot\spybot.exe /sp- /verysilent /norestart
echo Done..
pause
goto combo

:: installing super 

:sant
echo Installing in process ...
start /wait Malware" "Programs\Super" "Anti\super.exe /q /norestart
echo Done..
pause
goto combo

:: choice menu

:cc 
echo.
echo  1: CCleaner, 2: Glarys , 0: Cancel
echo.
set /P C=[0,1,2]: 
echo.
if "%C%"=="0"  goto ovirus
if "%C%"=="1"  goto cc1
if "%C%"=="2"  goto gla
echo.
goto cc

:: running glary

:gla
echo wait...
start /wait Cleaning" "Tools\gusetup.exe /q
echo Done installing... 
pause
goto cc

:: running ccleaner
:cc1
echo wait...
 start /wait Cleaning" "Tools\ccsetup.exe
pause
goto cc

:: opening ninite.com website

:install
echo.
start "" "http://ninite.com"
echo Please select what program to install...
echo.
pause
goto menu

:: open wiki 

:wiki
echo.
start "" "https://199.17.24.3"
pause
goto menu

:: running combofix

:combo1
echo running combofix...
start /wait Malware" "Programs\ComboFix.exe /S
pause
goto combo

::running rkill 

:rkill1
echo rkill is running wait...
start /wait Malware" "Programs\rkill\rkill.exe /q
echo.
pause
goto rkill

:: running tdss 

:tdss
echo Please click Start scan..
start /wait Malware" "Programs\tdsskiller\TDSSKiller.exe 
echo.
echo  done...
echo.
pause 
goto rkill

::running killbox

:kbox
echo.
start /wait Malware" "Programs\KillBox.exe 
echo.
echo Done
echo.
pause 
goto rkill 

::reset internet explorer 

:reset
echo wait...
echo.
start inetcpl.cpl
echo  Please select Advanced -- Reset -- check [ Delete personal settings ...]
echo.
pause
goto virus

:: delete temp file 

:temp
echo.
rd %temp% /s /q
md %temp%
echo.
echo click to  to continue cleaning C:\windows\temp
echo.
pause

:temp2
rd c:\windows\TEMP /s /q
md C:\windows\TEMP 

echo.
pause
echo. 
goto virus

:: install SEP 

:sep64
echo Installing...
start /wait SEP\SEP11_0_6_6300_x64_setup.exe /S /norestart
echo done
pause
goto virus 


:: install sep32

:sep32
echo Installing...
start /wait SEP\SEP11_0_6_6300_x86_setup.exe /S /norestart
echo Done..
pause
goto virus

::install microsoft security essential 64

:mse64
echo Installing...
start /wait MSE\mseinstall(64).exe /s /runwgacheck /norestart
echo Done..
echo.
pause 
goto virus 

::install microsoft security essential 32 

:mse32
echo Installing...
start /wait MSE\mseinstall(32).exe /s /runwgacheck
echo Done..
echo.
pause 
goto virus


:: open windows updates 

:win
start %windir%\system32\wuapp.exe 
cls
goto menu

:: open msconfig

:msconfig
start msconfig
echo Uncheck Services or Startup Process...
echo.
goto ovirus

::force uninstall 

:uninstall
echo  Type: product get name , shows you a list of All Programs Name.
echo.
echo  Type: product where name="your_program_name" call uninstall  , 
echo.
echo  For example: product where name="Adobe Reader 9" call uninstall
echo.
echo  Ctl+c : Quit ( Close /back to the menu)
echo.
wmic 
echo.
pause 
goto virus

:: open add/remove programs

:remove
echo.
echo Add/Remove Programs 
start control appwiz.cpl
echo.
pause 
echo.
goto ovirus

::open command line

:cmd
start cmd.exe
pause  
goto menu

:: reboot the computer

:reboot
echo Are you sure , Have you check the cd drive ....
echo.
echo !!!! Close this window if NO or YES to continue !!!!!
echo.
pause
shutdown -r -c "Rebooting in process"

:: Complete Internet Repair  code

:network
start /wait Wireless\CIntRep.exe
goto menu

:: quite 

:quit
exit
:end

:: Open source
:: by Janvier Byiringiro Helpdesk Consultant