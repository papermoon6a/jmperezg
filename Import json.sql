--------Importar-----------

EXECUTE MASTER.dbo.xp_enum_oledb_providers
GO

sp_configure 'show advanced options', 1;
RECONFIGURE;
GO
sp_configure 'Ad Hoc Distributed Queries', 1;
RECONFIGURE;
GO

--Si da error reiniciar servicio de SQL Server
EXEC sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'AllowInProcess', 1
EXEC sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.12.0', N'DynamicParameters', 1

EXEC sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.16.0', N'AllowInProcess', 1
EXEC sp_MSset_oledb_prop N'Microsoft.ACE.OLEDB.16.0', N'DynamicParameters', 1

use AdventureWorks2019
go


SELECT BulkColumn
 FROM OPENROWSET (BULK 'D:\BD\dataMay-10-2021.json', SINGLE_CLOB) as j;

 SELECT value
 FROM OPENROWSET (BULK 'D:\BD\dataMay-10-2021.json', SINGLE_CLOB) as j
 CROSS APPLY OPENJSON(BulkColumn)

 SELECT Persona.Nombre, Persona.[Teléfono] as Telefono, Persona.Correo, Persona.Ciudad
 FROM OPENROWSET (BULK 'D:\BD\dataMay-10-2021.json', SINGLE_CLOB) as j
 CROSS APPLY OPENJSON(BulkColumn)
 WITH( Nombre nvarchar(100), [Teléfono] nvarchar(100), Correo nvarchar(100), Ciudad nvarchar(100)) AS Persona


 SELECT Persona.Nombre, Persona.[Teléfono] as Telefono, Persona.Correo, Persona.Ciudad INTO Personas
 FROM OPENROWSET (BULK 'D:\BD\dataMay-10-2021.json', SINGLE_CLOB) as j
 CROSS APPLY OPENJSON(BulkColumn)
 WITH( Nombre nvarchar(100), [Teléfono] nvarchar(100), Correo nvarchar(100), Ciudad nvarchar(100)) AS Persona

