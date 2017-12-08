USE AddressBook;

IF EXISTS (SELECT 1 FROM sys.tables WHERE [Name] = 'ContactNotes')
BEGIN
   DROP TABLE dbo.ContactNotes;
END;

CREATE TABLE dbo.ContactNotes
(
   NoteID INT IDENTITY(1,1),
   ContactID INT,
   Notes VARCHAR(200),
   CONSTRAINT PK_ContactNotes PRIMARY KEY CLUSTERED (NoteID)
);

ALTER TABLE [dbo].[ContactNotes]  WITH CHECK ADD  CONSTRAINT [FK_ContactNotes_contacts] FOREIGN KEY([ContactID])
REFERENCES [dbo].[contacts] ([ContactID])

GO