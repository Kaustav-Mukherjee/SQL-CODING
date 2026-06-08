-- CTEs Common Table Expressions , allows us to define a subquery block which we can fetch in a query

SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;


-- WRITING A CTE

WITH CTE_Example AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal)
FROM CTE_Example
;





-- IF IT WAS WRITTEN USING A SUBQUERY :

SELECT AVG(avg_sal)
FROM (
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) example_subquery
;


# NOTE: WE CAN USE CTE, immediately after, we can't reuse it. As, it is not a permanent file.

-- CREATING MULTIPLE CTEs within one:


WITH CTE_Example AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > 1985-01-01
),
CTE_Example_2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example
JOIN CTE_Example_2
	ON CTE_Example.employee_id = CTE_Example_2.employee_id
;  #HERE, WE'RE taking details from demographics and salary tables, assigning a CTE for them individually and joining them on employee_id.


-- -- -- -- -- -- -- 
WITH CTE_Example (Gender, AVG_Sal, MAX_sal, MIN_sal, COUNT_sal) AS #Instead of giving aliases there like avg_sal,...etc. We can give it here.
(
SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example
;