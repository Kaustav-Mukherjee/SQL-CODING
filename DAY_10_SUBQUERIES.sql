-- SUBQUERIES (A query within a query)

SELECT * FROM employee_demographics;
SELECT * FROM employee_salary;

SELECT * 
FROM employee_demographics
WHERE employee_id IN 
	(SELECT employee_id #NOTE, HERE WE CAN ONLY USE ONE COLUMN TO RETURN.
		FROM employee_salary
        WHERE dept_id = 1) #This subquery will give the employee_id , whose dept_id = 1 

; #This will give the details of the employees whose dept_id = 1

-- SUBQUERY IN A SELECT STATEMENT

SELECT first_name, salary, 
(SELECT AVG(salary)
FROM employee_salary) #We are using this subquery, since previously in just using the avg function it was only giving the avg of each row, which is the same, but here, it is giving the average salary of the entire column .
FROM employee_salary
GROUP BY first_name, salary ;

-- SUBQUERY IN A FROM STATEMENT
SELECT AVG(`MAX(age)`)
FROM
(SELECT gender, 
AVG(age) , 
MIN(age), 
MAX(age), 
COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_table
;