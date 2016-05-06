
@echo off

mode 100

COLOR b

goto menu

::main menu 

:menu
cls
echo.
echo            .:: TSS TECHNOLOGY ::.
echo.
echo lAPTOP STUFF
echo =================
echo.
echo  1. Change Admin password to : A123456! and login as Admin
echo.
echo  2. Set workgroup to "tempwork" /wait to reboot
echo.
echo  3. Copy Checkout laptops folder"CLF" to Desktop / reboot 
echo.
echo  4. Set maximum length to 0 and disable complexity settings
echo.
echo   * change admin password :leave blank 
echo.
echo   * Open network - Properties  
echo   * Disable remember credentials  
echo   * PEAP -Disable:" Connect to these servers "
echo.
echo  5. Lunch IE and cleate Virtual lab Shortcut 
echo.
echo   * Install roll back - Autorun - no updates - advanced / reboot
echo.
echo   * Cleanup Desktop and power options Disable require on wakeup
echo.
echo   * Disable require password on wakeup
echo.
echo   * Update the baseline
echo.
echo  0. Reboot
echo.

:: choice for the main menu 

:choice
set /P C=[0,1,2,3,4,5]: 
echo.
if "%C%"=="0" goto reboot
if "%C%"=="1" goto pass
if "%C%"=="2" goto work
if "%C%"=="3" goto copy1
if "%C%"=="4" goto change
if "%C%"=="5" goto ie
echo.
goto choice

:: changing Password 
:pass 
net user Administrator A123456!
shutdown /l
goto choice

::set workgroup
:work
start control.exe %windir%\system32\sysdm.cpl
echo.
echo Change - Set workgroup to "tempwork" /wait to reboot
echo.
pause
cls
goto menu

::Copy files from flash drive 
:copy1
echo Copying...
E:
xcopy Checkout" "Laptops C:\Users\Administrator\Desktop\Checkout" "Laptops  /s /e /c /r /h /k /y /I /Q
echo Check On Desktop...
pause
goto menu

::change password and set maximum lenght to 0 
:change
secpol.msc
echo.
echo Account policy - Passwordpolicy - Set maximum Lenght to 0 and disablecomplexity settings
echo.
pause
net user Administrator ""
net user Administrator /passwordchg:no
cls
goto menu

:: Launch IE 
:ie
start "" "http://virtuallab.edu"
pause

:: launch Autorun for rollback
:install 
start C:\Users\Administrator\Desktop\Checkout" "Laptops\Rollbackv91" "(6930)\Autorun.exe
pause
goto menu

:: reboot the computer 
:reboot
echo Are you sure ????????????
echo.
echo !!!! Close this window to Cancel reboot or YES to continue reboot !!!!!
echo.
pause
shutdown -r -c "Rebooting in process"

:quit
exit
:end

:: Open source
:: by Janvier Byiringiro 