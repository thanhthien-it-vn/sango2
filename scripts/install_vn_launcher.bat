@echo off
setlocal
set "REPO=%~dp0.."
set "HOST_INSTALL=D:\Game\Sango2\Installed"
set "GAME_DIR=%HOST_INSTALL%\SANGO2"

echo === Cai launcher SANGO2-VN ===

if not exist "%GAME_DIR%\SAN2-VN.EXE" (
  echo ERROR: Chua build — chay scripts\build_vn_release.bat truoc
  exit /b 1
)

copy /Y "%REPO%\scripts\Play_Sango2_VN.bat" "D:\Game\Sango2\Play Sango2 VN.bat"
copy /Y "%REPO%\scripts\san2vn_dos.bat" "%GAME_DIR%\san2vn.bat"
echo OK: D:\Game\Sango2\Play Sango2 VN.bat

if exist "%GAME_DIR%\go8mb.bat" (
  findstr /i /r "^SAN2$" "%GAME_DIR%\go8mb.bat" >nul 2>&1
  if not errorlevel 1 (
    copy /Y "%GAME_DIR%\go8mb.bat" "%GAME_DIR%\go8mb.bat.bak"
    powershell -NoProfile -Command "$p='%GAME_DIR%\go8mb.bat'; (Get-Content $p) -replace '^SAN2$','SAN2-VN' | Set-Content $p"
    echo OK: go8mb.bat SAN2 -^> SAN2-VN ^(backup .bak^)
  )
)

if exist "D:\Game\Sango2\Play Sango2.bat" (
  copy /Y "D:\Game\Sango2\Play Sango2.bat" "D:\Game\Sango2\Play Sango2.bat.bak"
  powershell -NoProfile -Command "$p='D:\Game\Sango2\Play Sango2.bat'; if(Test-Path $p){(Get-Content $p -Raw) -replace '(?m)^SAN2\s*$','SAN2-VN' -replace 'SAN2\.EXE','SAN2-VN.EXE' | Set-Content $p -NoNewline}"
  echo OK: Play Sango2.bat da sua ^(backup .bak^)
)

echo.
echo Choi bang: D:\Game\Sango2\Play Sango2 VN.bat
endlocal
