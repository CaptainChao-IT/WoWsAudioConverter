@echo off

setlocal EnableExtensions EnableDelayedExpansion

echo Using default WwiseConsole.exe path (Modify it if you don't have Wwise version 2025.1.5.9095 on your PC)...
set "WWISE=C:\Audiokinetic\Wwise2025.1.5.9095\Authoring\x64\Release\bin\WwiseConsole.exe"
set "PROJECT=%~dp0Converter.wproj"
set "INPUT=%~dp0Input"
set "OUTPUT=%~dp0Output"
set "WSOURCES=%~dp0ExternalSources.wsources"

echo Creating ExternalSources.wsources...

>"%WSOURCES%" (
    echo ^<?xml version="1.0" encoding="UTF-8"?^>
    echo ^<ExternalSourcesList SchemaVersion="1" Root="ExternalSources"^>

    for %%F in ("%INPUT%\*.wav") do (
        echo     ^<Source Path="!%%~fF!" Conversion="Custom Vorbis"/^>
    )

    echo ^</ExternalSourcesList^>
)

echo Converting files in "%INPUT%"...

"%WWISE%" convert-external-source "%PROJECT%" ^
--source-file "%WSOURCES%" ^
--output "%OUTPUT%" ^
--quiet

echo Conversion complete
echo You'll find the .wem files in "%OUTPUT%\Windows"
pause
