-- Stored Procedures - ways to save sql codes which er can call again and again.

SELECT *
FROM employee_salary
WHERE salary >= 50000;


CREATE PROCEDURE large_salary()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CALL large_salary();

-- writing 2 statements within 1 procedure.

DELIMITER $$
CREATE PROCEDURE large_salary3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salary3();

-- PARAMETER - Variables passed aas inputs in the stored procedure , and they allow the stored procedure to accept an input value, and place it into the code.

DELIMITER $$
CREATE PROCEDURE large_salary6(ulu INT)
BEGIN
	SELECT *
	FROM employee_salary
	WHERE employee_id = ulu;
END $$
DELIMITER ;

CALL large_salary6(1);