Use AddressBook;

select ContactID, FirstName, LastName, DateOfBirth, AllowContactByPhone, CreatedDate
from dbo.contacts
where allowcontactByPhone = 1
  or DateOfBirth between '1980-01-01' and '1989-12-31';

select ContactID, FirstName, LastName, DateOfBirth, AllowContactByPhone, CreatedDate
from dbo.contacts
Where LastName in ('McQuillan','Partridge','Formby');

select ContactID, FirstName, LastName, DateOfBirth, AllowContactByPhone, CreatedDate
from dbo.contacts
where (AllowContactByPhone = 1 and YEAR(DateOfBirth) > 1969)
  or (AllowContactByPhone = 0 and YEAR(DateOfBirth) < 1970)
  or (LastName in ('Fisher','Formby'))
ORDER BY LastName ASC;

Select AllowContactByPhone, count(*) 
from dbo.contacts
group by AllowContactByPhone;

SELECT LastName, Count(*)
FROM dbo.contacts
WHERE YEAR(DateOfBirth) Between 1980 and 2010
GROUP BY LastName
ORDER BY LastName Asc;

SELECT LastName, Count(*) AS Total
FROM dbo.contacts
WHERE YEAR(DateOfBirth) Between 1980 and 2010
GROUP BY LastName
  HAVING COUNT(*) > 1
ORDER BY LastName Asc;

select TOP (5) ContactID, FirstName, LastName, DateOfBirth, AllowContactByPhone, CreatedDate
from dbo.contacts
ORDER BY LastName ASC;

select TOP (5) ContactID, FirstName + ' ' + LastName as ContactName, DateOfBirth, AllowContactByPhone, CreatedDate
from dbo.contacts
ORDER BY FirstName ASC;

