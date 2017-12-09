USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.tables WHERE [Name] = 'ContactNotes')
BEGIN
   DROP TABLE dbo.ContactNotes;
END;

CREATE TABLE dbo.ContactNotes
(
   NoteID INT IDENTITY(1,1) NOT NULL,
   ContactID INT NOT NULL,
   Notes VARCHAR(200) NOT NULL,
   CONSTRAINT PK_ContactNotes PRIMARY KEY CLUSTERED (NoteID)
);

ALTER TABLE [dbo].[ContactNotes]  WITH CHECK ADD  CONSTRAINT [FK_ContactNotes_contacts] FOREIGN KEY([ContactID])
REFERENCES [dbo].[contacts] ([ContactID])

GO