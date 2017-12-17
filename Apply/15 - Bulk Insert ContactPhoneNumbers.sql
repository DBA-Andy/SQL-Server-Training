USE AddressBook;

BULK INSERT dbo.ContactPhoneNumbers FROM 'C:\Users\Progr\Documents\GitHub\SQL-Server-Training\DataImports\04_ContactPhoneNumbers.csv'
WITH
(ROWTERMINATOR = '\n', FIELDTERMINATOR = ',', FIRSTROW = 2, ERRORFILE =	'C:\Users\Progr\Documents\GitHub\SQL-Server-Training\DataImports\04_ContactPhoneNumbers_ERRORS.csv',
CHECK_CONSTRAINTS);

GO