USE AddressBook;

IF EXISTS (SELECT 'X' FROM sys.tables WHERE [Name] = 'ContactVerificationDetails')
BEGIN
   DROP TABLE ContactVerificationDetails;
END;
