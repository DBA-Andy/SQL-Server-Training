USE AddressBook;

IF ((SELECT COUNT(1) FROM dbo.Roles) = 0)
BEGIN
   INSERT INTO dbo.roles (RoleTitle)
   VALUES ('Developer'),('DBA'),('IT Support Specialist'),('Manager'),('Director');
END;

GO