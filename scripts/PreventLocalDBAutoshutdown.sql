sp_configure 'show advanced options', 1;
RECONFIGURE;
GO
sp_configure 'user instance timeout', 65535;
GO