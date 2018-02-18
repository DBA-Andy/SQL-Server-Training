USE AddressBook;

DECLARE @ContactIDOut INT;

EXEC dbo.InsertContact   
   @FirstName = 'Andrew',
   @LastName = 'Agnew',
   @DateOfBirth = '1976-09-28',
   @ContactId = @ContactIDOut OUTPUT;

SELECT @ContactIDOut as ContactIDFromOutputVariable;

GO

DECLARE @ContactIDOut INT;

EXEC dbo.InsertContact   
   @FirstName = 'Oscar',
   @LastName = 'Wilde',
   @Note = 'Oscar Wilde is a famous poet and author.',
   @DateOfBirth = '1954-10-18',
   @ContactId = @ContactIDOut OUTPUT;

SELECT @ContactIDOut as ContactIDFromOutputVariable;
