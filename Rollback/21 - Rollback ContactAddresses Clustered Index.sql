USE AddressBook;

IF EXISTS (select 1 from sys.indexes where [Name] = 'IX_C_ContactAddresses_ContactIDPostCode')
BEGIN
   DROP INDEX IX_C_ContactAddresses_ContactIDPostCode ON dbo.ContactAddresses;
END;
