create database task8;
use task8;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

INSERT INTO employees (name, department, salary) VALUES
('John', 'HR', 35000),
('Aisha', 'IT', 55000),
('Nisha', 'Finance', 60000),
('Rahul', 'IT', 45000);
-- increase emp sal by dept
DELIMITER $$

CREATE PROCEDURE UpdateSalaryByDept(
    IN deptName VARCHAR(50),
    IN incrementAmount DECIMAL(10,2)
)
BEGIN
    UPDATE employees
    SET salary = salary + incrementAmount
    WHERE department = deptName;
END $$

DELIMITER ;
-- call procedure
CALL UpdateSalaryByDept('IT', 5000);
-- get annual sal
DELIMITER $$

CREATE FUNCTION GetAnnualSalary(empId INT)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    DECLARE annual DECIMAL(12,2);
    SELECT salary * 12 INTO annual FROM employees WHERE emp_id = empId;
    RETURN annual;
END $$

DELIMITER ;
-- use function
SELECT name, GetAnnualSalary(emp_id) AS annual_salary FROM employees;


