USE AddressBook;

IF EXISTS (Select 1 from sys.types where [name] = 'ContactNote')
BEGIN
   DROP TYPE dbo.ContactNote;
END;

CREATE TYPE dbo.ContactNote
AS TABLE
(ContactID INT, NOTE VARCHAR(200));

GO