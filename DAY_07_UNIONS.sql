-- UNIONS (Allows us to combine rows together)

SELECT age, gender
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary
; # We can see here that thesalary table is joined with the demographics table. But this ias not a good way to do unions

SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary; # We can see here, that previously there were lots of data, but here it isn't. Actually UNION is also said UNION DISTINCT, it only takes unique values.

#to show all the values, not the unique ones only -
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;





SELECT first_name, last_name, 'Old Man'
FROM employee_demographics
WHERE age > 40 AND gender = 'male'
UNION 
SELECT first_name, last_name, 'Old Lady'
FROM employee_demographics
WHERE age > 40 AND gender = 'female'
UNION 
SELECT first_name, last_name, 'Highly Paid Employee'
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;

