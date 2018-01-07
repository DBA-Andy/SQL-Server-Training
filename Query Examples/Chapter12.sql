--The Long Way
SELECT *
FROM dbo.Contacts 
   INNER JOIN dbo.contactPhoneNumbers on dbo.Contacts.ContactId = dbo.ContactPhoneNumbers.ContactID;

--Shorter Way
SELECT *
FROM dbo.Contacts AS Con
   INNER JOIN dbo.contactPhoneNumbers AS ConPhone on Con.ContactId = ConPhone.ContactID;

--Start listing Columns
SELECT Con.ContactID, Con.FirstName + ' ' + Con.LastName as ContactName, Con.DateOfBirth, Con.AllowContactByPhone, PhoneType.PhoneNumberType, ConPhone.PhoneNumber
FROM dbo.Contacts AS Con
   INNER JOIN dbo.contactPhoneNumbers AS ConPhone on Con.ContactId = ConPhone.ContactID
   INNER JOIN dbo.PhoneNumberTypes AS PhoneType on PhoneType.PhoneNumberTypeID = ConPhone.PhoneNumberTypeID;

--Change Display of Allow Contact
SELECT Con.ContactID, Con.FirstName + ' ' + Con.LastName as ContactName, Con.DateOfBirth, 
CASE Con.AllowContactByPhone
WHEN 1 Then 'Yes'
ELSE 'No'end AS AllowContactByPhone, PhoneType.PhoneNumberType, ConPhone.PhoneNumber
FROM dbo.Contacts AS Con
   LEFT OUTER JOIN dbo.contactPhoneNumbers AS ConPhone on Con.ContactId = ConPhone.ContactID
   LEFT OUTER JOIN dbo.PhoneNumberTypes AS PhoneType on PhoneType.PhoneNumberTypeID = ConPhone.PhoneNumberTypeID
Where Con.AllowContactByPhone = 1;

--Remove second Left outer join - It's not adding any value. Is there a Home Number?  
SELECT Con.ContactID, Con.FirstName + ' ' + Con.LastName as ContactName, Con.DateOfBirth, 
CASE Con.AllowContactByPhone
WHEN 1 Then 'Yes'
ELSE 'No'end AS AllowContactByPhone, PhoneType.PhoneNumberType, ConPhone.PhoneNumber
FROM dbo.Contacts AS Con
   LEFT OUTER JOIN dbo.contactPhoneNumbers AS ConPhone on Con.ContactId = ConPhone.ContactID
   LEFT OUTER JOIN dbo.PhoneNumberTypes AS PhoneType on PhoneType.PhoneNumberTypeID = ConPhone.PhoneNumberTypeID
Where PhoneType.PhoneNumberType = 'Home';

--That was good...but we wanna see ALL Contacts, and only their Home Number if they have one...
SELECT Con.ContactID, Con.FirstName + ' ' + Con.LastName as ContactName, Con.DateOfBirth, 
CASE Con.AllowContactByPhone
WHEN 1 Then 'Yes'
ELSE 'No'end AS AllowContactByPhone, PhoneType.PhoneNumberType, ConPhone.PhoneNumber
FROM dbo.Contacts AS Con
   LEFT OUTER JOIN dbo.contactPhoneNumbers AS ConPhone on Con.ContactId = ConPhone.ContactID AND ConPhone.PhoneNumberTypeid = 1
   LEFT OUTER JOIN dbo.PhoneNumberTypes AS PhoneType on PhoneType.PhoneNumberTypeID = ConPhone.PhoneNumberTypeID;

--How Many Phone Numbers do we have per contact?
SELECT Con.ContactID, Con.FirstName + ' ' + Con.LastName as ContactName, Con.DateOfBirth, Count(ConPhone.PhoneNumberTypeID) as PhoneNumberTotal
FROM dbo.Contacts AS Con
   LEFT OUTER JOIN dbo.contactPhoneNumbers AS ConPhone on Con.ContactId = ConPhone.ContactID
GROUP BY Con.ContactID, Con.FirstName + ' ' + Con.LastName,Con.DateOfBirth
ORDER BY Con.ContactID;

--Insert New Role
Insert into dbo.Roles (RoleTitle) VALUES ('Sales');
SELECT * FROM dbo.Roles;

--Illustrate Right Outer Join:
SELECT Role.RoleTitle, Count (ConRole.RoleID) AS Total
FROM dbo.ContactRoles AS ConRole 
   INNER JOIN dbo.Roles AS Role on Role.RoleID = ConRole.RoleID
GROUP BY Role.RoleTitle
ORDER BY Role.RoleTitle;

SELECT Role.RoleTitle, Count (ConRole.RoleID) AS Total
FROM dbo.ContactRoles AS ConRole 
   RIGHT OUTER JOIN dbo.Roles AS Role on Role.RoleID = ConRole.RoleID
GROUP BY Role.RoleTitle
ORDER BY Role.RoleTitle;

--Playing with Full Outer Join
INSERT INTO dbo.Contacts (FirstName, LastName, DateOfBirth, AllowContactByPhone)
VALUES ('Keith','Chegwin','1957-01-17',1);

SELECT ConRole.RoleID, Roles.RoleTitle FROM dbo.ContactRoles ConRole FULL OUTER JOIN dbo.Roles Roles on conRole.RoleID = Roles.RoleID;

--Cross Join
Select *
FROM dbo.Contacts as Con
   CROSS JOIN dbo.ContactPhoneNumbers as ConPhone;
FROM dbo.ContactRoles ConRole 
   FULL OUTER JOIN dbo.Roles Roles on conRole.RoleID = Roles.RoleID
   FULL OUTER JOIN dbo.Contacts Con on Con.ContactId = conRole.ContactID;

INSERT into dbo.Roles (RoleTitle) values ('Senior Developer');

INSERT INTO dbo.ContactRoles (ContactID, RoleID)
SELECT ConRole.ContactID, (SELECT roles.RoleID from dbo.roles roles where roles.roleTitle = 'Senior Developer') as RoleID
from ContactRoles ConRole
where RoleID = (Select RoleID from dbo.roles where RoleTitle = 'Developer');

delete from conRole From Dbo.contactRoles conRole
where conRole.ContactID = (select contactid from dbo.roles where roletitle = 'Developer')
  AND conRole.RoleID = (Select roleid from dbo.roles where roleTitle = 'Developer');

select *
From Dbo.contactRoles conRole
where conRole.ContactID = (select contactid from dbo.roles where roletitle = 'Developer')
  AND conRole.RoleID = (Select roleid from dbo.roles where roleTitle = 'Developer');

UPDATE conRole set conRole.RoleID = (select roleid from dbo.roles where roleTitle = 'Developer')
from dbo.ContactRoles AS conRole
  INNER JOIN dbo.roles as roles on roles.roleid = conrole.roleid
where roles.roleTitle = 'IT Support Specialist';

