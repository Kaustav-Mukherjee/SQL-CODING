-- HAVING vs WHERE

-- HAVING
# In the previous lesson we've learned the usage of GROUP BY, therefore we can write:

SELECT gender, AVG(age)
FROM employee_demographics
WHERE AVG(age) > 40
GROUP BY gender;  #This says invalid use of GROUP BY function, meaning, the aggregate function, AVG(age) is performed, only after we've grouped by gender rows together. Therefore if we're trying to filter the AVG(age) >40, it has not been created yet, because the group by hasn't happened. Therefore-


SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40; #This fetches the result where it shows the group having the avg age grater than 40.alter

-- NOW, we can also use WHERE and HAVING together as well:

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%manager%' #row level filtering occurs here
GROUP BY occupation
HAVING AVG(salary) > 75000; #filtering occurs in the agg. function. This having function will only work for the agg. function, after the completing of the group by function runs.
