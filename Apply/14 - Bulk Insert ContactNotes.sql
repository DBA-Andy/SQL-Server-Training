USE AddressBook;

BULK INSERT dbo.ContactNotes FROM 'C:\Users\Administrator\Documents\GitHub\SQL-Server-Training\DataImports\03_ContactNotes.csv'
WITH
(ROWTERMINATOR = '\n', FIELDTERMINATOR = ',', FIRSTROW = 2, ERRORFILE =	'C:\Users\Administrator\Documents\GitHub\SQL-Server-Training\DataImports\03_ContactNotes_ERRORS.csv',
CHECK_CONSTRAINTS);

GO