@echo off
rem Running this batch file will reset DB 
SqlLocalDb stop "ArtDBInstance"
SqlLocalDb delete "ArtDBInstance"
del %userprofile%\ArtDB.mdf
del %userprofile%\ArtDB_log.ldf
SqlLocalDb create "ArtDBInstance"
sqlcmd -S "(localdb)\ArtDBInstance" -Q "CREATE DATABASE ArtDB;"
sqlcmd -S "(localdb)\ArtDBInstance" -i "DB_SCHEMA.sql" -o "DBSetup.log"