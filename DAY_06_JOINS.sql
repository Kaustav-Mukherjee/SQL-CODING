-- JOINS (Joins allow us to combine 2 or more tables together if they have a common column. The names of the 2 tables may or may not be the same, but the contents inside it have to be the same) -joins re INNER JOINS, LEFT JOINS, RIGHT JOINS, OUTER JOINS, SELF JOINS.

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- Here in these 2 tables, we can see that the employee_id table is common for both the tables.

-- 1. INNER JOIN (Returns rows which are the same in both column from both tables), here we'll be joining the demographics table with the salary table.

SELECT *
FROM employee_demographics
JOIN employee_salary #INNER JOINS CAN ALSO BE WRITTEN AS JOIN
	ON employee_id = employee_id #If we write just this, it'll show an error, becuase the employee_id column name is same for both tables and we have not mentioned from which table we're taking which employee_id.
;
#THEREFORE -

SELECT *
FROM employee_demographics
JOIN employee_salary #INNER JOINS CAN ALSO BE WRITTEN AS JOIN
	ON employee_demographics.employee_id = employee_salary.employee_id
;
-- Now, if we look at this result, we can see that all the columns from both the tables have been joined and fetched. But there was a condition that it'll only fetch the matching rows in both the tables. Therefore if we see the table, we can see that the employee_id = 2 is missing, which was present in the employee_salary table but not the demographics table.

-- NOW here the usage of Aliasing takes place- 

SELECT *
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id #The code looks so much cleaner now.
;

-- We can also select individual column here

SELECT dem.employee_id, age, occupation #Here also to avoid facing the same error, we've to mention where this employee_id column is fetched from.
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id 
;

-- Outer Joins (Left and Right join)

-- LEFT JOIN / LEFT OUTER JOIN - It is going to take everything from the left table, even if there is no match , and only return the matches from the right table.
-- RIGHT JOIN / RIGHT OUTER JOIN - It is going to take everything from the right table, even if there is no match , and only return the matches from the left table, and also nulls.
SELECT * 
FROM employee_demographics dem
LEFT JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id 
; #Now, this looks the same, because there was no employee_id = 2 in the demographics table.


SELECT * 
FROM employee_demographics dem
RIGHT JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id 
; # Here we can see that the employee salary table has id = 2 and it is fetched. but since the left demographics table don't have that same id, it has returned null.

-- SELF JOIN - Used when we're joining the same table to itself.

SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id;

-- JOINING MULTIPLE TABLES TOGETHER:
SELECT *
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id 
JOIN parks_departments pd
	ON sal.dept_id = pd.department_id
;

SELECT * 
FROM parks_departments;