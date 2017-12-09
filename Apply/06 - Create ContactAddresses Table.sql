USE AddressBook;

IF EXISTS (SELECT 'X' from sys.tables where [NAME] = 'ContactAddresses')
BEGIN
   DROP TABLE ContactAddresses;
END;

CREATE TABLE ContactAddresses
(
   AddressID INT IDENTITY (1,1) NOT NULL,
   ContactID INT NOT NULL,
   HouseNumber VARCHAR(200) NULL,
   Street VARCHAR(200) NULL,
   City VARCHAR(200) NULL,
   POSTCODE VARCHAR(20) NULL,
   CONSTRAINT PK_ContactAddresses PRIMARY KEY NONCLUSTERED (AddressID)
);

ALTER TABLE dbo.ContactAddresses
ADD CONSTRAINT FK_ContactAddresses_Contact 
FOREIGN KEY (ContactID)
REFERENCES dbo.Contacts (ContactID)
ON UPDATE NO ACTION
ON DELETE CASCADE;

GO