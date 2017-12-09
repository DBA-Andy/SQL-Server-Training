use AddressBook;

IF EXISTS (SELECT 1 from sys.tables where [Name] = 'Contacts')
BEGIN
   DROP TABLE dbo.Contacts;
END;
