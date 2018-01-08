USE AddressBook;

BULK INSERT dbo.ContactRoles FROM 'C:\Users\Progr\Documents\GitHub\SQL-Server-Training\DataImports\05_ContactRoles.csv'
WITH
(ROWTERMINATOR = '\n', FIELDTERMINATOR = ',', FIRSTROW = 2, ERRORFILE =	'C:\Users\Progr\Documents\GitHub\SQL-Server-Training\DataImports\05_ContactRoles_ERRORS.csv',
CHECK_CONSTRAINTS);

GO