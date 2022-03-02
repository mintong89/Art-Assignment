@echo off
sqlcmd -S (localdb)\ArtDBInstance -i PreventLocalDBAutoshutdown.sql -o PreventLocalDBAutoshutdown.log