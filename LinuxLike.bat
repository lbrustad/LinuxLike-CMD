:: LinuxLike CMD by Lasse Brustad

:: This project was developed to make
:: CMD look like the Linux Terminal

:: Settings:
set back=0
set front=7
set linux=c
set type=$

:: Some pre-run lines
title Linux Terminal - v1.0.0
set cmd=echo.
color %back%%front%
@echo off
cls

:: LinuxLike CMD - info
echo.
echo LinuxLike CMD by Lasse Brustad
echo Please report problems at GitHub

:: The loop where everything happens
:loop
echo.
call :ColorText %back%%linux% %username%
call :ColorText %back%%front% "@"
call :ColorText %back%%linux% %computername%
set cd=%~dp1
set cd=%cd:\=/%
set /p "cmd=: %cd:~2% %type% "
%cmd%
set cmd=echo.
goto :loop

:: DO NOT change anything here!
:: Or the script will stop working!
:ColorText [%1 = Color] [%2 = Text]
set /p "_=_" > "%~2" <nul 
findstr /v /a:%1 /R "^$" "%~2" nul 2>nul
set /p "_=" <nul
if "%3" == "end" set /p "_=  " <nul
del "%~2" >nul 2>nul
exit /b
