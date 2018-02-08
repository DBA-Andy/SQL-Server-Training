use addressbook;

if exists (select 1 from sys.indexes where [name] = 'IX_NC_Contacts_AllowContactByPhone')
BEGIN
   DROP INDEX IX_NC_Contacts_AllowContactByPhone on dbo.contacts;
END;
