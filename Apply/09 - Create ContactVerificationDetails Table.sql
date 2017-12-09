USE AddressBook;

IF EXISTS (SELECT 'X' FROM sys.tables WHERE [Name] = 'ContactVerificationDetails')
BEGIN
   DROP TABLE ContactVerificationDetails;
END;

CREATE TABLE ContactVerificationDetails
(
   ContactID INT  NOT NULL,
   DrivingLicenseNumber VARCHAR(40) NULL,
   PassportNumber VARCHAR(40) NULL,
   ContactVerified BIT NOT NULL CONSTRAINT DF_ContactVerificationDetails_ContactVerified DEFAULT 0,
   CONSTRAINT PK_ContactVerification_Details PRIMARY KEY CLUSTERED (ContactID)
);

ALTER TABLE ContactVerificationDetails
ADD CONSTRAINT FK_ContactVerificationDetails_Contacts
FOREIGN KEY (ContactID)
REFERENCES dbo.Contacts (ContactID)
ON UPDATE NO ACTION
ON DELETE CASCADE;