USE AddressBook;

IF EXISTS (Select 1 from sys.types where [name] = 'ContactNote')
BEGIN
   DROP TYPE dbo.ContactNote;
END;
