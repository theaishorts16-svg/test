@echo off
chcp 65001 >nul
title Ofuscador VM (Prometheus) para GMod

rem ---------------------------------------------------------------------------
rem  Arrastra uno o varios archivos .lua sobre este .bat.
rem  Deja al lado de cada uno un  archivo_obf.lua  ofuscado con VM.
rem
rem  No necesita instalar nada: el interprete Lua viene incluido en bin\.
rem ---------------------------------------------------------------------------

cd /d "%~dp0"

if "%~1"=="" (
    echo.
    echo   Arrastra un archivo .lua sobre este .bat para ofuscarlo.
    echo.
    pause
    exit /b
)

:loop
if "%~1"=="" goto fin

set "IN=%~1"
set "OUT=%~dpn1_obf.lua"

echo.
echo   Ofuscando: %~nx1
bin\lua5.1.exe cli.lua --preset Vmify --Lua51 --nocolors --out "%OUT%" "%IN%"
echo   Listo: %~dpn1_obf.lua

shift
goto loop

:fin
echo.
echo   Terminado. Los archivos ofuscados terminan en _obf.lua
echo.
pause
