USE AddressBook;

IF EXISTS (SELECT 'X' FROM sys.tables where [NAME] = 'PhoneNumberTypes')
BEGIN
   DROP TABLE PhoneNumberTypes;
END;
