@echo off
REM Choi Sango II ban dich — double-click file nay tren Windows
setlocal
set "HOST_INSTALL=D:\Game\Sango2\Installed"
set "GAME_DIR=%HOST_INSTALL%\SANGO2"

if not exist "%GAME_DIR%\SAN2-VN.EXE" (
  echo ERROR: Chua co SAN2-VN.EXE
  echo Mo CMD trong repo va chay: scripts\build_vn_release.bat
  pause
  exit /b 1
)

copy /Y "%~dp0san2vn_dos.bat" "%GAME_DIR%\san2vn.bat" >nul

where dosbox-x >nul 2>&1 && set "DOSBOX=dosbox-x" && goto run
where dosbox >nul 2>&1 && set "DOSBOX=dosbox" && goto run
echo ERROR: Cai DOSBox-X hoac DOSBox
pause
exit /b 1

:run
echo Dang mo Sango II VN...
"%DOSBOX%" -c "mount c \"%HOST_INSTALL%\"" -c "c:" -c "cd sango2" -c "san2vn"
endlocal
