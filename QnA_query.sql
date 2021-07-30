-- Q1) Merge employee names and label the field as FullName from Employees table. Show all records

SELECT ID, FirstName + ' ' + LastName AS FullName, Age, Gender
FROM Employees

-- Alternatively,

SELECT ID, CONCAT(FirstName, ' ', LastName) AS FullName, Age, Gender
FROM Employees

-- Q2) Show all records of employees with their salaries

SELECT a.ID, FirstName, LastName, Age, Gender, b.JobTitle, b.Salary
FROM Employees a
LEFT JOIN Jobs b
ON a.ID = b.ID
ORDER BY a.ID

-- Q3) Which employee has the second highest salary? Show all records

SELECT a.ID, FirstName, LastName, Age, Gender, b.JobTitle, b.Salary
FROM Employees a
LEFT JOIN Jobs b
ON a.ID = b.ID
WHERE b.Salary NOT IN (SELECT MAX(Salary) FROM Jobs)
ORDER BY b.Salary DESC
OFFSET 0 ROWS
FETCH FIRST 1 ROWS ONLY

-- Q4) Show all records of male employees with row number based on increasing order of salary

SELECT a.ID, FirstName, LastName, Age, Gender,b.JobTitle, b.Salary,
ROW_NUMBER() OVER(ORDER BY b.Salary) AS Ordered_salary
FROM Employees a
LEFT JOIN Jobs b
ON a.ID = b.ID
WHERE Gender = 'Male'

-- Q5) How many male and female employees are present that earn more than $45,000?

SELECT Gender, COUNT(Gender) AS Employee_count
FROM Employees a
LEFT JOIN Jobs b
ON a.ID = b.ID
WHERE Salary > 45000
GROUP BY Gender