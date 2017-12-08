USE AddressBook;

IF EXISTS (select 1 from sys.tables where [NAME] = 'Roles')
BEGIN
   DROP TABLE dbo.ROLES;
END;

CREATE TABLE dbo.Roles
(
   RoleID INT IDENTITY(1,1),
   RoleTitle VARCHAR(200),
   CONSTRAINT PK_Roles PRIMARY KEY CLUSTERED (RoleID)
);