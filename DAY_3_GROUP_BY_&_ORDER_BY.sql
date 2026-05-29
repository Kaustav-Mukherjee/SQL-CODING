-- GROUP BY & ORDER BY

-- GROUP BY (is going to group together rows having same values on a sp. column or columns that we are grouping on. After grouping we can perform aggregate function on the rows.)

SELECT gender
FROM employee_demographics
GROUP BY gender; #this is actually rolling up all the values into this 2 rows, which is later required when performing aggregate sunctions like avg, min, max based on these rows.

SELECT first_name
FROM employee_demographics
GROUP BY gender; -- We've selected first name and have grouped by the gender. Here result shows an error. This means if we're not selecting an aggrgated func, it has to match the Group By column.

SELECT gender, AVG(age) #we're selecting gender, grouping gender and performing an avg age on those 2 genders
FROM employee_demographics
GROUP BY gender; # It fetches the average age of people in the female category, and then in the male category.



SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary;

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(AGE) #we're selecting gender, grouping gender and performing an avg age on those 2 genders, also finding out the max and min ages of the 2 genders, and no. of values present in each gender.
FROM employee_demographics
GROUP BY gender;












-- ORDER BY (Sorts datasets in asceinding or descending order)
SELECT *
FROM employee_demographics
ORDER BY first_name; #This is gonna fetch values and sort them by the first_name column, from the smallest to the largest values. Now as it is a character column, it'll be from A - Z

SELECT *
FROM employee_demographics
ORDER BY first_name DESC; #orders from largest to smallest, that is Z - A HERE

SELECT *
FROM employee_demographics
ORDER BY gender, age; #it first orders by the gender, then will order by age for each gender

SELECT *
FROM employee_demographics
ORDER BY gender, age DESC; #The descending order condition only gets applied to the age part.

#one thing to note, we can also use column positions, instead of column names, but it is not recommended.
SELECT *
FROM employee_demographics
ORDER BY 5, 4; #it is the same
