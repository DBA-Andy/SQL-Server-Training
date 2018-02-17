USE AddressBook;

IF EXISTS (SELECT 1 from sys.objects where [name] = 'ContactCounts' and [Type] = 'TF')
BEGIN
   DROP FUNCTION dbo.ContactCounts;
END;

GO