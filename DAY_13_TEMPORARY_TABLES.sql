-- TEMPORARY Tables Tables which are only visible at the session they are created in

-- ways of creating temp. table:

-- 1.

CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

SELECT *
FROM temp_table;

INSERT INTO temp_table
VALUES ('Alex', 'Freeberg', 'GOT');


-- 2.

CREATE TEMPORARY TABLE salary_over_50kI
SELECT *
FROM employee_salary
WHERE salary >= 500000;

SELECT *
FROM salary_over_50kI;