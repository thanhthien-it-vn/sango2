@echo off
REM Choi Sango II ban dich — thay Play Sango2.bat (dung SAN2-VN.EXE)
REM Cau truc: D:\Game\Sango2\Installed\SANGO2\ = C:\SANGO2 trong DOS

setlocal
set "HOST_INSTALL=D:\Game\Sango2\Installed"
set "GAME_DIR=%HOST_INSTALL%\SANGO2"

if not exist "%GAME_DIR%\SAN2-VN.EXE" (
  echo ERROR: Chua co SAN2-VN.EXE
  echo Chay truoc: scripts\build_vn_release.bat
  exit /b 1
)

where dosbox >nul 2>&1
if errorlevel 1 (
  where dosbox-x >nul 2>&1
  if errorlevel 1 (
    echo ERROR: Can cai DOSBox hoac DOSBox-X
    exit /b 1
  )
  set "DOSBOX=dosbox-x"
) else (
  set "DOSBOX=dosbox"
)

echo Launch VN: %GAME_DIR%\SAN2-VN.EXE
"%DOSBOX%" -c "mount c \"%HOST_INSTALL%\"" -c "c:" -c "cd sango2" -c "if not exist san2-vn.exe echo Loi: thieu SAN2-VN.EXE & pause" -c "call go8mb.bat" -c "SAN2-VN"
endlocal
