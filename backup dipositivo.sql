USE master;  
GO
--Crea dispositivo de almacenamiento
EXEC sp_addumpdevice 'disk', 'AWData',   
'D:\BD\AWData.bak';  
GO

--Crear el primer backup
BACKUP DATABASE AdventureWorks2019   
 TO AWData 
   WITH FORMAT, INIT, NAME = N'AW – Full Backup' ;  
GO  

--Crea nuevos backups
DECLARE @BackupName VARCHAR(100)
SET @BackupName = N'AW – Full Backup ' + FORMAT(GETDATE(),'yyyyMMdd_hhmmss');

BACKUP DATABASE AdventureWorks2019
TO AWData
WITH NOFORMAT, NOINIT, NAME = @BackupName,
SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO

RESTORE FILELISTONLY FROM AWData
GO
RESTORE HEADERONLY FROM AWData
GO

SELECT      *
FROM        sys.backup_devices
GO

