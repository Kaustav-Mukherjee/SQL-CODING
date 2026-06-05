-- CASE Statement - Allows us to add logic in our SELECT Statements

SELECT *
FROM employee_demographics;

SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Old'
    WHEN age >= 50 THEN 'Good night'
END AS Age_bracket
FROM employee_demographics;









#LETS LOOK AT A PROBLEM: PAY INCREASE AND BONUS
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus


SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary > 50000 THEN salary + (salary * 0.07)
END AS NEW_SALARY,
CASE
	WHEN dept_id = 6 THEN salary * .10
END AS Bonus
FROM employee_salary;






