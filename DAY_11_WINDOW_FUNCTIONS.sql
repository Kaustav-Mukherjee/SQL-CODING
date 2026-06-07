-- WINDOW Functions (somewhat like group by, but they don't group everything up into one row. They allow us to look at a partition/ group where each row keeps their identity at the output.)

#let's look at a GROUP BY first
SELECT gender, AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
;

-- LET'S DO THIS USING WINDOW FUNCTION

SELECT gender, AVG(salary) OVER() #This over means in this case we're looking at the avg. salary overall
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;

SELECT gender, AVG(salary) OVER(PARTITION BY gender) #This partition by will be doing the colculation based upon the gender, but it won't roll everything up like a GROUP BY.
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;





SELECT dem.first_name, 
dem.last_name, 
gender, 
SUM(salary) OVER(PARTITION BY gender) 
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id #HERE IT IS SHOWING THE TOTAL SALARY MADE BY ALL THE FEMALES, AND THE TOTAL SALARY MADE BY ALL THE MALES.
;

-- w're going to be doing a rolling total:

SELECT dem.first_name, 
dem.last_name, 
gender, 
salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) 
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id #HERE IT IS SHOWING THE TOTAL SALARY in a summation order both for females and males.
;

-- SPECIAL THINGS WITH WINDOW FUNCTIONS

-- 1.ROW NUMBER (kinda like an employee_id)
SELECT dem.first_name, 
dem.last_name, 
gender, 
salary,
ROW_NUMBER() OVER() #here the row_number isn't repeating itself
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id #HERE IT IS SHOWING THE TOTAL SALARY in a summation order both for females and males.
    ;
    
SELECT dem.first_name, 
dem.last_name, 
gender, 
salary,
ROW_NUMBER() OVER(PARTITION BY gender) #here the row_number is repeating itself
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id; #This row number is based on the type of data entered here.


-- But what if we want to give the row number based on rankings.
SELECT dem.first_name, 
dem.last_name, 
gender, 
salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) #here the row_number is repeating itself, and getting ranked based on salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;

    
-- RANK (This is going to give a official ranking, but here in this case unlike row_number which gives unique numbers, here if it encounters any duplicate value based in order by, it will assign the same number. But after the same number, the next number assigned, it'll be not the number numerically, but it will be based upon the position.)

SELECT dem.first_name, 
dem.last_name, 
gender, 
salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
-- DENSE RANK (It is similar to rank, but unlike it dense_rank gives the number numerically unlike rank, which gives according to position.)

SELECT dem.first_name, 
dem.last_name, 
gender, 
salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
