INSERT INTO EmployeeDemographics VALUES
	(1002, 'Pam', 'Beasley', 30, 'Female'),
	(1003, 'Dwight', 'Schrute', 29, 'Male'),
	(1004, 'Angela', 'Martin', 31, 'Female'),
	(1005, 'Toby', 'Flenderson', 32, 'Male'),
	(1006, 'Michael', 'Scott', 35, 'Male'),
	(1007, 'Meredith', 'Palmer', 32, 'Female'),
	(1008, 'Stanley', 'Hudson', 38, 'Male'),
	(1009, 'Kevin', 'Malone', 31, 'Male')

Insert Into EmployeeSalary VALUES
	(1001, 'Salesman', 45000),
	(1002, 'Receptionist', 36000),
	(1003, 'Salesman', 63000),
	(1004, 'Accountant', 47000),
	(1005, 'HR', 50000),
	(1006, 'Regional Manager', 65000),
	(1007, 'Supplier Relations', 41000),
	(1008, 'Salesman', 48000),
	(1009, 'Accountant', 42000)


-- SELECTS EVERYTHING
SELECT *
FROM EmployeeDemographics;

-- SELECTS TOP 5 ROWS
SELECT TOP 5 *
FROM EmployeeDemographics;

-- SELECTS ONLY EmployeedID Column
SELECT DISTINCT(EmployeeID)
FROM EmployeeDemographics;

-- SELECTS ONLY 'Gender' Column with only two rows showing female and male
SELECT DISTINCT(Gender)
FROM EmployeeDemographics;

-- Tells you how many rows there are within the LastName column, does not count NULL values; must add 'AS' to name column
SELECT COUNT(LastName) AS LastNameCount
FROM EmployeeDemographics;

-- shows the maximum salary of in a unnamed column, same can be said with MIN, AVG values.
SELECT MAX(Salary)
FROM EmployeeSalary;

-- Here I changed to a different database and wanted to select information from the sql tutorial database by using '.dbo.table_name'
SELECT *
FROM [SQL Tutorial].dbo.EmployeeSalary;

-- Here we select all the information on 'Jim', spits out only 1 row
SELECT *
FROM EmployeeDemographics
WHERE FirstName = 'Jim';

-- Here we select all the information and excludes 'Jim' row, '<>' is a 'not' operator
SELECT *
FROM EmployeeDemographics
WHERE FirstName <> 'Jim';

-- Here we select everyone's information who is > 30 years old. Works also with >=, <, <=, and =.
SELECT *
FROM EmployeeDemographics
WHERE Age > 30;

--Here we select everyone's information who is <= 32 years old and who is male.
SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 AND Gender = 'Male';

-- You and replace 'AND' with 'OR' as well
SELECT *
FROM EmployeeDemographics
WHERE Age <= 32 OR Gender = 'Male';

-- Selects anyone with a lastname that starts with an 'S'
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%';

-- Selects anyone with a lastname that has an 'S' in it.
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE '%S%';

-- Selects anyone with a lastname that starts with an 'S' and has an 'o' in it. The % follows in order
SELECT *
FROM EmployeeDemographics
WHERE LastName LIKE 'S%o%';

-- Returns all data that does not have a NULL value in the Firstname common. Can be also said for NULL
SELECT *
FROM EmployeeDemographics
WHERE FirstName is NOT NULL;

-- Selects all information from specific individuals
SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Jim', 'Michael');

-- Returns the first unique value of female and male
SELECT DISTINCT(Gender)
FROM EmployeeDemographics;

-- YOU DONT SEE IT, but there's actually 3 females and 6 males within this query;
SELECT Gender
FROM EmployeeDemographics
GROUP BY Gender;
-- So add 'COUNT' to see those numbers; 'COUNT' creates a fictional column
SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender;

-- You can still use 'WHERE' with a 'fictional' column. This query shows that there are only males and 1 female.
SELECT Gender, COUNT(Gender)
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender;

--Here we added 'ORDER BY' which allows us to show the count in descending order with DESC. By default 'ORDER BY' has an ASC attribute. 
-- DESC and ASC work alphabetically and numerically
SELECT Gender, COUNT(Gender) AS CountGender
FROM EmployeeDemographics
WHERE Age > 31
GROUP BY Gender
ORDER BY CountGender DESC;

-- Select everything and orders it from oldest to youngest
SELECT *
FROM EmployeeDemographics
ORDER BY Age;

-- can also select first by age then by gender ASCENDING or DESCENDING
SELECT *
FROM EmployeeDemographics
ORDER BY Age, Gender;

-- you can substitute names of columns with numbers, below returns the exact same as above.
SELECT *
FROM EmployeeDemographics
ORDER BY 4, 5;