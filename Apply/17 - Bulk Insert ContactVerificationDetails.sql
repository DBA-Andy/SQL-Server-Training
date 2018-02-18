USE AddressBook;

BULK INSERT dbo.ContactVerificationDetails FROM 'C:\Users\Administrator\Documents\GitHub\SQL-Server-Training\DataImports\06_ContactVerificationDetails.csv'
WITH
(ROWTERMINATOR = '\n', FIELDTERMINATOR = ',', FIRSTROW = 2, ERRORFILE =	'C:\Users\Administrator\Documents\GitHub\SQL-Server-Training\DataImports\06_ContactVerificationDetails_ERRORS.csv',
CHECK_CONSTRAINTS);

GO