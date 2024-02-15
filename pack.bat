@echo off
setlocal

rem Set the folder name
set "folder=English_xml_patch"

rem Set the zip file name
set "zipfile=%folder%.zip"

rem Set the pak file name
set "pakfile=%folder%.pak"

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
