USE AddressBook;

GO

IF EXISTS (SELECT 1 FROM sys.objects where [name] = 'ContactName' and [type] = 'FN')
BEGIN
   drop function dbo.contactName;
END;

GO