@echo off
rem Running this batch file will reset DB 

echo Stopping ArtDBInstance...
SqlLocalDb stop "ArtDBInstance"
echo Deleting ArtDBInstance...
SqlLocalDb delete "ArtDBInstance"

echo Deleting ArtDB...
del %userprofile%\ArtDB.mdf
del %userprofile%\ArtDB_log.ldf

echo Creating ArtDBInstance
SqlLocalDb create "ArtDBInstance"
sqlcmd -S "(localdb)\ArtDBInstance" -Q "CREATE DATABASE ArtDB;"
sqlcmd -S "(localdb)\ArtDBInstance" -i "DB_SCHEMA.sql" -o "DBSetup.log"