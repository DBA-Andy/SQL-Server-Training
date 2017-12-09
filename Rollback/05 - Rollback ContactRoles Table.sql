USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.tables WHERE [Name] = 'ContactRoles')
BEGIN
   DROP TABLE ContactRoles;
END;
