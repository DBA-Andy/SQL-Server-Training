USE AddressBook;

IF EXISTS (select 1 from sys.tables where [NAME] = 'Roles')
BEGIN
   DROP TABLE dbo.ROLES;
END;
