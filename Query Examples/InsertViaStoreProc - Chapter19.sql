USE AddressBook;

DECLARE @ContactIDOut INT, @ContactNotes CONTACTNOTE;

INSERT INTO @ContactNotes (ContactID, NOTE)
VALUES
(null,'Mark Kermode contributes to the BBC Radio 5 film Program'),
(null,'Mark thinks the Exorcist is the best film ever made');

EXEC dbo.InsertContact  
   @FirstName = 'Mark',
   @LastName = 'Kermode',
   @DateOfBirth = '1963-07-02',
   @Notes = @ContactNotes,
   @ContactID = @ContactIdOut OUTPUT;

   SELECT @ContactIDOUT as CONTACTIDFROMOUTPUTVARIABLE;

   Select * from dbo.contacts where contactid = @contactidout;
   select * from dbo.contactNotes where contactid = @contactidout;
