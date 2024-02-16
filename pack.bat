@echo off
setlocal

rem Prompt the user to enter language
set /p lang="Select the voiceover language. 1 for English, 2 for Polish, 3 for German: "

rem Set the target name
set "EN=English_xml_patch"
set "PL=polish_xml_patch"
set "DE=German_xml_patch"
set "RU=russian_xml_patch"

if %lang%==1 (
    set "target=%EN%"
) else if %lang%==2 (
    set "target=%PL%"
) else if %lang%==3 (
    set "target=%DE%"
) else if %lang%==5 (
    set "target=%RU%"
) else (
    set "target=%EN%"
)

rem Set the folder name
set "folder=src"

rem Set the zip file name
set "zipfile=%target%.zip"

rem Set the pak file name
set "pakfile=%target%.pak"

rem Set the build folder
set "buildfolder=build"

rem Check if build folder exists, if not, create it
if not exist "%buildfolder%" mkdir "%buildfolder%"

rem Clear the build folder if it's not empty
if exist "%buildfolder%\*" (
    del /Q "%buildfolder%\*"
)

rem Zip the files in the folder to test.zip
powershell Compress-Archive -Path "%folder%\*" -DestinationPath "%zipfile%"

rem Rename test.zip to test.pak
ren "%zipfile%" "%pakfile%"

rem Move test.pak to the build folder
move "%pakfile%" "%buildfolder%"

echo Files have been zipped, renamed, and moved to the build folder.
pause
