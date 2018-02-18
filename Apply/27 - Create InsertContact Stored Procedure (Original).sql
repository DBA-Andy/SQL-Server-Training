USE AddressBook;

GO


IF EXISTS (SELECT 1 FROM sys.procedures where [name] = 'InsertContact')
BEGIN
   DROP PROCEDURE InsertContact;
END;

GO

CREATE PROCEDURE dbo.insertContact
(
@FirstName VARCHAR(40),
@LastName VARCHAR(40),
@DateOfBirth DATE,
@AllowContactByphone Bit = 0,
@Notes CONTACTNOTE READONLY,
@ContactID INT = 0 OUTPUT
)
AS
BEGIN

   SET NOCOUNT ON;

   --Add Variables to support Note processing
   DECLARE @TempNotes TABLE (NoteID INT IDENTITY(1,1), NOTE VARCHAR(200));
   DECLARE @RecordCount INT, @LoopCounter INT, @NoteID INT;

   --Copy the @Notes table, which is read only, to a table variable so we can modify the data
   INSERT into @TempNotes (NOTE) SELECT Note from @Notes;

   --Set defaults for the loop around the notes.
   SELECT @RecordCount = Count(1), @LoopCounter = 0 FROM @TempNotes;

   --Delete empty notes
   DELETE from @TempNotes WHERE LTRIM(RTRIM(COALESCE(Note,''))) = '';

   BEGIN TRANSACTION;
     INSERT INTO dbo.Contacts(FirstName, LastName, DateOfBirth, AllowContactByPhone)
	 VALUES (@FirstName, @LastName, @DateofBirth, @AllowContactByPhone);

	 SELECT @ContactID = SCOPE_IDENTITY();

	 PRINT 'Contact ID Inserted: ' + CONVERT(VARCHAR(20), @ContactID);

	 --Insert notes using WHILE loop.
	 WHILE (@LoopCounter < @RecordCount)
	 BEGIN
	    SELECT TOP(1) @NoteID = NoteID from @TempNotes;

		INSERT INTO dbo.contactNotes (ContactID, Notes)
		SELECT @ContactID, Note from @TempNotes where NoteID = @NoteID;

		DELETE @TempNotes where NoteID = @NoteID;

		SELECT @LoopCounter = @LoopCounter + 1
 	 END;
   COMMIT TRANSACTION;

   SELECT @ContactID as ContactID;

   SET NOCOUNT OFF;
END;

go