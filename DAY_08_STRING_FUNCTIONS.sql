-- STRING Functions Are built in functions that will help us to use strings and work with strings differently.

-- LENGTH

SELECT LENGTH('SKYFALL');

SELECT first_name, LENGTH(first_name)
FROM employee_demographics
ORDER BY 2; 

-- UPPER, LOWER
SELECT first_name, UPPER(FIRST_NAME), LOWER(first_name)
FROM employee_demographics;

-- TRIM, LEFT TRIM, RIGHT TRIM (REMOVES WHITE SPACES)
SELECT ('         sky         ');
SELECT TRIM('         sky         ');
SELECT LTRIM('         sky         ');
SELECT RTRIM('         sky         ');

-- SUBSTRING

SELECT first_name, LEFT(first_name, 4),
RIGHT (first_name, 4) #LEFT (..., NUMBER) - This means how many number of charecters from the left we want to fetch in a string. , RIGHT (..., NUMBER) - This means how many number of charecters from the RIGHT we want to fetch in a string.
FROM employee_demographics;

SELECT first_name, LEFT(first_name, 4),
RIGHT (first_name, 4),
SUBSTRING(first_name, 3, 2), #This substring can also be used instead of left and right, 3 represents the position and 2 represents how many charecters to be fetched.
birth_date,
SUBSTRING(birth_date, 6 , 2)
FROM employee_demographics;

-- REPLACE will replace sp. characters with a diff character we want.

SELECT first_name, REPLACE(first_name, 'a', 'z') #(specify what column containing replacement, what to be replaced, with what it should be replaced with)
FROM employee_demographics;

-- LOCATE

SELECT LOCATE('s', 'kaustav'); #(What is to be located, where it is to be located)

SELECT first_name, LOCATE('An', first_name)
FROM employee_demographics;

-- CONCAT

SELECT first_name, last_name,
CONCAT(first_name, ' ', last_name)
FROM employee_demographics;

#THERE R STILL VARIOUS TYPES OF FUNCTIONS IN MYSQL.
