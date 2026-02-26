@echo off

setlocal enabledelayedexpansion

set WWISE="C:\Audiokinetic\Wwise2025.1.5.9095\Authoring\x64\Release\bin\WwiseConsole.exe"
set PROJECT="C:\Users\m17be\Documents\WwiseProjects\Converter\Converter.wproj"
set SOUNDBANK="C:\Users\m17be\Documents\WwiseProjects\Converter\GeneratedSoundBanks\Windows"
set INPUT=%~dp0Input
set OUTPUT=%~dp0Output
set WSOURCES=%~dp0ExternalSources.wsources

echo Creating ExternalSources.wsources...

echo ^<?xml version="1.0" encoding="UTF-8"?^> > ExternalSources.wsources
echo ^<ExternalSourcesList SchemaVersion="1" Root="ExternalSources"^> >> ExternalSources.wsources

for %%F in ("%INPUT%\*.wav") do (
    set NAME=%%~nF
    set FULLPATH=%%~fF

    echo     ^<ExternalSource Name=!NAME! Source=!FULLPATH! Conversion="Vorbis Voice" /^> >> ExternalSources.wsources
)

echo ^</ExternalSourcesList^> >> ExternalSources.wsources

echo Converting...

%WWISE% convert-external-source %PROJECT% ^
--source-file %WSOURCES% ^
--output %OUTPUT% ^
--verbose

echo Done.
pause