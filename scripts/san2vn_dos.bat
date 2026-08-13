@echo off
REM Chay trong DOS (C:\SANGO2) — goi tu Play_Sango2_VN.bat tren Windows
if not exist SAN2-VN.EXE (
  echo Loi: thieu SAN2-VN.EXE — build tren Windows truoc
  pause
  exit /b 1
)
if exist go8mb.bat call go8mb.bat
if exist C:\UNIVBE C:\UNIVBE
SAN2-VN
