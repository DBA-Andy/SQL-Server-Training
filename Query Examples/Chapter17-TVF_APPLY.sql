USE AddressBook;

--Example of joining to a table value function (I'm guessing via something like Nested Loops) using CROSS APPLY
SELECT dbo.ContactName(C.FirstName, C.LastName) as ContactName, c.DateOfBirth, cc.AddressCount, cc.noteCount, cc.PhoneNumberCount, cc.RoleCount
from dbo.Contacts C
   CROSS APPLY dbo.ContactCounts(c.contactID, 'All') CC;

--Cross apply uses the equivalent of an inner join...what if there are no records? We want to see names and DOB anyway, so we change to an OUTER apply.
SELECT dbo.ContactName(C.FirstName, C.LastName) as ContactName, c.DateOfBirth, cc.AddressCount, cc.noteCount, cc.PhoneNumberCount, cc.RoleCount
from dbo.Contacts C
   OUTER APPLY dbo.ContactCounts(c.contactID, 'All') CC;