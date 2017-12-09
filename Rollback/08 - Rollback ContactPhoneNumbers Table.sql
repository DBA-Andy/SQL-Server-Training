USE AddressBook;

IF EXISTS (SELECT 'X' FROM sys.tables where [Name] = 'ContactPhoneNumbers')
BEGIN
   DROP TABLE ContactPhoneNumbers;
END;
