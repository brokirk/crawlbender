@echo off
echo Diploy CrawlBender to Flash Drive

set source="*.*"
set shared_path="E:\DC\"

echo.
echo Copying...
echo - files = %source%
echo - path = %shared_path%
echo.

rem   /D:m-d-y     Copies files changed on or after the specified date.
rem                 If no date is given, copies only those files whose
rem                 source time is newer than the destination time.
rem   /S           Copies directories and subdirectories except empty ones.
rem   /V           Verifies each new file.
rem   /L           Displays files that would be copied.
rem   /R           Overwrites read-only files.
rem   /K           Copies attributes. Normal Xcopy will reset read-only attributes.
rem   /Y           Suppresses prompting to confirm you want to overwrite an existing destination file.

xcopy %source% %shared_path% /D /S /V /R /K /Y
echo.
echo Code copied.

:End
pause