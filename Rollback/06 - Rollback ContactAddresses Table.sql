USE AddressBook;

IF EXISTS (SELECT 'X' from sys.tables where [NAME] = 'ContactAddresses')
BEGIN
   DROP TABLE ContactAddresses;
END;
