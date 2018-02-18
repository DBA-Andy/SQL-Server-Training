USE AddressBook;

BULK INSERT dbo.Contacts FROM 'C:\Users\Administrator\Documents\GitHub\SQL-Server-Training\DataImports\01_Contacts.csv'
WITH (ROWTERMINATOR = '\n', FIELDTERMINATOR = ',', FIRSTROW = 2);
GO
