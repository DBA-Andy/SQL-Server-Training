USE AddressBook;

IF EXISTS (select 1 from sys.views where [Name] = 'VerifiedContacts')
BEGIN
   DROP VIEW dbo.VerifiedContacts;
END;

GO
