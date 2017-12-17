USE AddressBook;

BULK INSERT dbo.ContactAddresses FROM 'C:\Users\Progr\Documents\GitHub\SQL-Server-Training\DataImports\02_ContactAddresses.csv'
WITH
(ROWTERMINATOR = '\n', FIELDTERMINATOR = ',', FIRSTROW = 2, ERRORFILE =	'C:\Users\Progr\Documents\GitHub\SQL-Server-Training\DataImports\02_ContactAddresses_ERRORS.csv',
CHECK_CONSTRAINTS);

GO