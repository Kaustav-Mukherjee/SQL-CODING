-- WHERE CLAUSE helps filter or select actual columns, it only returns rows, fulfilling a certain condition

SELECT *
FROM employee_salary
WHERE first_name = 'Leslie' ;  # '=' is a comparison operator.

-- Other Comparison operators

SELECT *
FROM employee_salary
WHERE salary >50000;

SELECT *
FROM employee_salary
WHERE salary >= 50000;

SELECT *
FROM employee_salary
WHERE salary < 50000;

SELECT *
FROM employee_salary
WHERE salary <= 50000;

SELECT *
FROM employee_demographics
WHERE gender = 'female';

SELECT *
FROM employee_demographics
WHERE gender != 'female';  -- != is called not equal to

SELECT *
FROM employee_demographics
WHERE birth_date >'1985-01-01';

-- LOGICAL OPERATORS, AND, OR, NOT
SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
AND gender = 'male'; #BOTH CONDITION MUST BE TRUE FOR AND STATEMENTS IN ORDER TO RUN

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR gender = 'male'; #ONE OF THE CONDITIONS MUST BE TRUE IN ORDER TO RUN.

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male';

-- PEMDOS AND LOGICAL OPERATORS CAN BE RUN TOGETHER:

SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age >55;  -- At first the condition inside the parenthesis must be met, after that the condition after the parenthesis


-- LIKE Statement (have 2 special charecters, % (means can there is anything after the charecters), _(means specific charecters) )
SELECT *
FROM employee_demographics
WHERE first_name = 'Jerry'; -- ok, so this runs as normal, but if we were to try something like this -
SELECT *
FROM employee_demographics
WHERE first_name = 'Jer'; -- there is nothing popping, so in this cases we require the LIKE statement

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'Jer%'; #means there is anything after Jer, but the word starts with Jer

SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%'; #means there is anything before and after er.

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a__'; #underscore says the sp. no. of charecters after it.

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%'; #underscore says the sp. no. of charecters after it, after that it can have anything.

SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%';
