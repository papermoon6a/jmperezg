BACKUP DATABASE [AdventureWorks2019] 
TO  DISK = N'D:\BD\AdventureWorks20201209.bak' 
WITH NOFORMAT, NOINIT,  NAME = N'AdventureWorks2019-Full Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10;


BACKUP DATABASE [AdventureWorks2019] 
TO  DISK = N'D:\BD\AdventureWorks20201209DIF.bak' 
WITH  DIFFERENTIAL , NOFORMAT, NOINIT,  NAME = N'AdventureWorks2019-Differential Database Backup', SKIP, NOREWIND, NOUNLOAD,  STATS = 10


RESTORE DATABASE [AW2020] 
FROM  DISK = N'D:\BD\AdventureWorks20201209.bak' 
WITH  FILE = 1,  
MOVE N'AdventureWorks2016_Data' TO N'D:\BD\AW2020_Data.mdf', 
MOVE N'AdventureWorks2016_Log' TO N'D:\BD\AW2020_Log.ldf',  
NORECOVERY,  NOUNLOAD,  STATS = 5

