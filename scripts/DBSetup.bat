@echo off
rem Running this batch file will reset DB 
echo.
echo [31mStopping ArtDBInstance...[0m
echo.
SqlLocalDb stop "ArtDBInstance"

echo.
echo [31mDeleting ArtDBInstance...[0m
echo.
SqlLocalDb delete "ArtDBInstance"

echo.
echo [31mDeleting ArtDB...[0m
echo.
del %userprofile%\ArtDB.mdf
del %userprofile%\ArtDB_log.ldf

echo.
echo [32mCreating ArtDBInstance...[0m
echo.
SqlLocalDb create "ArtDBInstance"
sqlcmd -S "(localdb)\ArtDBInstance" -Q "CREATE DATABASE ArtDB;"
sqlcmd -S "(localdb)\ArtDBInstance" -i "DB_SCHEMA.sql" -o "DBSetup.log"
type DBSetup.log

echo.
echo [33mRunning additional script for development purpose...[0m
echo [33mRunning PreventLocalDBAutoshutdown.bat...[0m
echo.
call PreventLocalDBAutoshutdown.bat
type PreventLocalDBAutoshutdown.log

echo.
echo [33mRestarting DB...[0m
echo.
call StopDB.bat
call StartDB.bat
pause