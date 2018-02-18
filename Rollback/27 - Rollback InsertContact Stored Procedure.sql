USE AddressBook;

GO


IF EXISTS (SELECT 1 FROM sys.procedures where [name] = 'InsertContact')
BEGIN
   DROP PROCEDURE InsertContact;
END;