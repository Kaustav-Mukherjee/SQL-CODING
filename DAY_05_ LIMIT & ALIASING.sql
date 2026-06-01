-- LIMIT & ALIASING

-- LIMIT (Specifies how many rows is needed at the output. )
SELECT *
FROM employee_demographics
LIMIT 3; #if there are more than 3 rows in the output, it shows only the top 3

-- Though this is simple it can be used with ORDER BY for quering more complex tasks.

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3; #Shows the top 3 oldest people.

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 2, 1; #This signifies the resultant rows shown will start at position 2 and after that will be showing just 1 row.





-- Aliasing ( A way to change the name of a column in the output.)


SELECT gender, AVG(age) AS avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40; #what this does is, instead of writting the AVG(age again and again, we're simply assigning the function a name and calling it wherever required. I t also shows in the output. )

-- WE can also asign aliases without writting 'AS'

SELECT gender, AVG(age) avg_age
FROM employee_demographics
GROUP BY gender
HAVING avg_age > 40; #SAME OUTPUT AS THE PREVIOUS ONE.










