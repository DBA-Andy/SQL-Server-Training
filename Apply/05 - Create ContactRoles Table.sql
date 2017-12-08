USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.tables WHERE [Name] = 'ContactRoles')
BEGIN
   DROP TABLE ContactRoles;
END;

CREATE TABLE ContactRoles
(
   ContactID INT,
   RoleID INT
   CONSTRAINT PK_ContactRoles PRIMARY KEY CLUSTERED (ContactID, RoleID)
);

ALTER TABLE dbo.ContactRoles
ADD CONSTRAINT FK_ContactRoles_Contacts
FOREIGN KEY (ContactID)
REFERENCES dbo.Contacts (ContactID)
ON UPDATE NO ACTION
ON DELETE CASCADE;

ALTER TABLE dbo.ContactRoles
ADD CONSTRAINT FK_ContactRoles_Roles
FOREIGN KEY (RoleID)
REFERENCES dbo.Roles (RoleID)
ON UPDATE NO ACTION
ON DELETE CASCADE;

GO