@echo off

call config.bat

REM create current day folder
set folder_name=%YYYY%-%MM%-%DD%
if not exist ".\%folder_name%\" mkdir ".\%folder_name%\"

REM append timestamp in file
set logfile_name="timestamp.txt"
set logfile_path=".\%folder_name%\%logfile_name%"
echo %_STAMP%  >> %logfile_path%