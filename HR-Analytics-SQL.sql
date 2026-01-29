-- 1) DEPARTMENTS TABLE

CREATE TABLE departments (
    dept_id       INT PRIMARY KEY,
    dept_name     VARCHAR(50) UNIQUE NOT NULL,
    location      VARCHAR(50)
);


INSERT INTO departments (dept_id, dept_name, location) VALUES
(10, 'HR', 'Delhi'),
(20, 'Finance', 'Noida'),
(30, 'IT', 'Gurgaon'),
(40, 'Sales', NULL),
(50, 'Operations', 'Delhi');



-- 2) EMPLOYEES TABLE (Messy data + NULLs)

CREATE TABLE employees (
    emp_id        INT PRIMARY KEY,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    email         VARCHAR(100) UNIQUE,
    phone         VARCHAR(20),
    gender        VARCHAR(10),
    dob           DATE,
    hire_date     DATE,
    job_title     VARCHAR(50),
    dept_id       INT,
    salary        NUMERIC(10,2),
    manager_id    INT,
    status        VARCHAR(20),
    CONSTRAINT fk_dept FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);


INSERT INTO employees VALUES
(101, 'Monis', 'Khan', 'monis@gmail.com', '98765 43210', 'Male', '2001-05-10', '2023-01-10', 'HR Analyst', 10, 45000, NULL, 'Active'),
(102, 'Ayesha', 'Ali', 'ayesha@gmail.com', NULL, 'Female', '2000-02-18', '2022-07-15', 'HR Executive', 10, 38000, 101, 'Active'),
(103, 'Rahul', 'Sharma', 'rahul@gmail.com', '9999911111', 'Male', '1999-11-12', '2021-06-01', 'Data Analyst', 20, 52000, 110, 'Active'),
(104, 'Neha', NULL, 'neha@gmail.com', '88888-77777', 'Female', '1998-03-05', '2020-08-10', 'Accountant', 20, NULL, 110, 'Active'),
(105, NULL, 'Singh', NULL, '7777766666', 'Male', NULL, '2021-12-20', 'Developer', 30, 60000, 111, 'Active'),
(106, '   Sana', 'Khan', 'sana@gmail.com', ' 9898989898 ', 'Female', '2001-09-22', NULL, 'Sales Executive', 40, 30000, 112, 'Active'),
(107, 'Vikram', 'Mehta', 'vikram@gmail.com', '99999 00000', 'Male', '1997-06-19', '2019-03-02', 'IT Support', 30, 42000, 111, 'Inactive'),
(108, 'Riya', 'Verma', 'riya@gmail.com', NULL, 'Female', '2002-01-15', '2023-05-20', 'Intern', 10, 15000, 101, 'Active'),
(109, 'Ankit', 'Gupta', 'ankit@gmail.com', '12345', 'Male', '1996-10-10', '2018-02-12', 'Manager', 20, 80000, NULL, 'Active'),
(110, 'Priya', 'Kapoor', 'priya@gmail.com', '99999-88888', 'Female', '1995-04-22', '2017-09-01', 'Finance Manager', 20, 95000, NULL, 'Active'),
(111, 'Karan', 'Jain', 'karan@gmail.com', NULL, 'Male', '1994-07-12', '2016-01-18', 'IT Manager', 30, 98000, NULL, 'Active'),
(112, 'Meena', 'Rao', 'meena@gmail.com', '55555-44444', NULL, '1993-08-03', '2015-11-11', 'Sales Manager', 40, 90000, NULL, 'Active');




-- 3) ATTENDANCE TABLE

CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY,
    emp_id        INT,
    att_date      DATE,
    check_in      VARCHAR(10),
    check_out     VARCHAR(10),
    work_mode     VARCHAR(20),
    CONSTRAINT fk_emp_att FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
);


INSERT INTO attendance VALUES
(1, 101, '2024-01-02', '09:10', '18:05', 'Office'),
(2, 101, '2024-01-03', NULL, '18:00', 'Office'),
(3, 102, '2024-01-02', '09:30', '17:45', 'WFH'),
(4, 103, '2024-01-02', '10:00', NULL, 'Office'),
(5, 104, '2024-01-03', '09:00', '17:00', NULL),
(6, 105, '2024-01-04', NULL, NULL, 'WFH'),
(7, 108, '2024-01-05', '11:00', '16:00', 'Office');


-- 4) PERFORMANCE REVIEWS TABLE

CREATE TABLE performance_reviews (
    review_id     INT PRIMARY KEY,
    emp_id        INT,
    review_date   DATE,
    rating        INT,
    remarks       VARCHAR(200),
    CONSTRAINT fk_emp_review FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
);

INSERT INTO performance_reviews VALUES
(201, 101, '2023-12-31', 4, 'Good performance'),
(202, 102, '2023-12-31', 3, 'Needs improvement'),
(203, 103, '2023-12-31', 5, 'Excellent'),
(204, 104, '2023-12-31', NULL, NULL),
(205, 107, '2023-12-31', 2, 'Low attendance'),
(206, 108, '2023-12-31', 4, 'Quick learner');

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM attendance;
SELECT * FROM performance_reviews;





--✅ A) SELECT + DISTINCT

--Show all employees list.

SELECT * 
FROM employees;

--Show only first_name, job_title, salary.

SELECT 
	first_name, 
	job_title, 
	salary
FROM employees;

--Show distinct job titles.


SELECT 
	DISTINCT job_title
FROM employees;

--Show distinct department ids from employees.

SELECT 
	DISTINCT dept_id
FROM employees;

--Display employees with NULL salary.

SELECT 
	emp_id,
	first_name,
	last_name,
	email,
	salary
FROM employees
WHERE salary IS NULL;


--✅ B) WHERE + AND/OR/NOT

--Employees with salary > 50000.

SELECT 
	emp_id,
	first_name,
	last_name,
	email,
	salary
FROM employees
WHERE 
	salary > 50000;

--Employees in dept_id = 10 AND status = 'Active'.


SELECT 
	emp_id,
	first_name,
	last_name,
	email,
	dept_id,
	status
FROM employees
WHERE 
	dept_id = 10 AND status = 'Active';


--Employees where status is NOT Active.

SELECT 
	emp_id,
	first_name,
	last_name,
	email,
	dept_id,
	status
FROM employees
WHERE 
	status <> 'Active';

--Employees where gender = 'Female' OR salary > 80000.


SELECT 
	emp_id,
	first_name,
	last_name,
	email,
	gender,
	dept_id,
	salary
FROM employees
WHERE gender = 'Female' OR salary > 80000;

--Employees with NULL hire_date OR NULL dob.

SELECT 
	emp_id,
	first_name,
	last_name,
	email,
	dob,
	hire_date,
	dept_id
FROM employees
WHERE 
	hire_date IS NULL OR dob IS NULL;



--✅ C) ORDER BY + LIMIT / OFFSET

--Top 5 highest salary employees.

SELECT 
	emp_id,
	first_name,
	last_name,
	email,
	salary
FROM employees
WHERE salary IS NOT NULL
ORDER BY salary DESC
LIMIT 5;

--Lowest 5 salary employees (exclude NULL salary).

SELECT 
	emp_id,
	first_name,
	last_name,
	email,
	salary
FROM employees
WHERE salary IS NOT NULL
ORDER BY salary ASC
LIMIT 5;

--Employee list sorted by hire_date newest first.

SELECT 
	emp_id,
	first_name,
	last_name,
	email,
	hire_date
FROM employees
WHERE hire_date IS NOT NULL
ORDER BY hire_date DESC;

--Show 3 employees after skipping top 3 highest salaries (LIMIT + OFFSET).

SELECT 
	emp_id,
	first_name,
	last_name,
	email,
	salary
FROM employees
WHERE salary IS NOT NULL
ORDER BY salary DESC
LIMIT 3
OFFSET 3
;

--Sort employees by dept_id then salary desc.

SELECT 
	emp_id,
	first_name,
	last_name,
	email,
	dept_id,
	salary
FROM employees
WHERE salary IS NOT NULL
ORDER BY dept_id ASC, salary DESC;

--✅ D) IN + BETWEEN + LIKE

--Employees in departments 10, 20.

SELECT 
	emp_id,
	first_name,
	last_name,
	email,
	dept_id,
	salary
FROM employees
WHERE dept_id IN (10, 20);

--Employees with salary between 30000 and 60000.

SELECT 
	emp_id,
	first_name,
	last_name,
	email,
	salary
FROM employees
WHERE salary BETWEEN 30000 AND 60000;

--Employees whose first_name starts with 'A'.

SELECT 
	first_name
FROM employees
WHERE first_name LIKE 'A%';

--Employees whose email contains 'gmail'.

SELECT 
	email
FROM employees
WHERE email LIKE '%@gmail.com';


--Employees with job_title like '%Manager%'.

SELECT 
	emp_id,
	first_name,
	job_title,
	salary
FROM employees
WHERE job_title ILIKE '%manager%';


--✅ E) IS NULL / IS NOT NULL

--Find employees whose first_name is NULL.

SELECT *
FROM employees
WHERE first_name IS NULL;

--Find employees whose phone is NULL.
SELECT *
FROM employees
WHERE phone IS NULL;

--Find employees with hire_date IS NULL.

SELECT *
FROM employees
WHERE hire_date IS NULL;

--Attendance where check_out is NULL.

SELECT *
FROM attendance
WHERE check_out IS NULL;

--Reviews where rating is NULL.
SELECT *
FROM performance_reviews
WHERE rating IS NULL;


--✅ F) Aggregate Functions (HR Analytics)

--Count total employees.

SELECT 
	COUNT(*) AS total_employees
FROM employees;

--Count active employees.

SELECT 
	COUNT(*) AS total_employees
FROM employees
WHERE status = 'Active';

--Total salary payout (SUM salary).

SELECT 
	SUM(COALESCE(salary,0)) AS total_salary
FROM employees;

--Average salary.

SELECT 
	ROUND(AVG(salary), 2) AS avg_salary
FROM employees;

--Min and max salary.

SELECT 
	MIN(salary) AS min_salary,
	MAX(salary) AS max_salary
FROM employees;

--Count employees per department (GROUP BY).

SELECT 
	dept_id,
	COUNT(*) AS total_emp_perdept
FROM employees
GROUP BY dept_id;

--Average salary per department.

SELECT 
	dept_id,
	ROUND(AVG(salary), 2) AS avg_salary_perdept
FROM employees
GROUP BY dept_id;

--Departments having more than 2 employees (HAVING).

SELECT 
	dept_id
FROM employees
GROUP BY dept_id
HAVING COUNT(*) > 2;

--Count employees having NULL phone.

SELECT 
	COUNT(*) AS total_emp_null_phone
FROM employees
WHERE phone IS NULL;

--Count employees having NULL salary.

SELECT 
	COUNT(*) AS total_emp_null_salary
FROM employees
WHERE salary IS NULL;

--✅ G) INSERT / UPDATE / DELETE (Interview practical)

--Insert new employee record.

INSERT INTO employees 
(emp_id, first_name, last_name, email, phone, gender, dob, hire_date, job_title, dept_id, salary, manager_id, status)
VALUES
(113,'Ramesh','Kumar','ramesh@yahoo.com','4587654894','Male','2001-10-01',NULL,'HR Analyst', 10, 56400, NULL,'Active');


--Update salary for employee 108 by +5000.

UPDATE employees
SET salary = salary + 5000
WHERE emp_id = 108;

--Change status of employee 107 to Active.

UPDATE employees
SET status = 'Active'
WHERE emp_id = 107;

--Delete attendance record where emp_id=105 and date='2024-01-04'.

DELETE FROM attendance
WHERE emp_id = 105 AND att_date ='2024-01-04';


--Insert new department and assign employees to it.

INSERT INTO departments (dept_id, dept_name, location)VALUES
(55, 'Cloud', 'Mumbai');


--✅ H) CREATE / DROP / ALTER + Constraints (Important for interview)

--Add constraint NOT NULL in employees.job_title.

ALTER TABLE employees
ALTER COLUMN job_title SET NOT NULL;

--Add UNIQUE constraint on phone.

ALTER TABLE employees
ADD CONSTRAINT uq_employees_phone UNIQUE (phone); 

--Add new column exit_date in employees.

ALTER TABLE employees
ADD COLUMN exit_date DATE;

--Drop column gender.

ALTER TABLE employees
DROP COLUMN gender;

--Drop performance_reviews table.

DROP TABLE performance_reviews; 

--Create foreign key manager_id referencing employees(emp_id). (self reference)

ALTER TABLE employees
ADD CONSTRAINT fk_employees_manager
FOREIGN KEY (manager_id)
REFERENCES employees(emp_id);

--✅ BONUS: Cleaning Interview Tasks (Messy Data Fixing)

--Trim spaces from first_name.

SELECT 
	emp_id,
	first_name,
	TRIM (first_name) AS cleaned_first_name
FROM employees;

UPDATE employees
SET first_name = TRIM(first_name)
WHERE first_name IS NOT NULL;

--Replace NULL salary with 0.

SELECT 
	COALESCE (salary, 0) AS salary
FROM employees;

UPDATE employees
SET salary = 0
WHERE salary IS NULL;

--Replace NULL work_mode with 'Office'.

SELECT 
	attendance_id,
	emp_id,
	COALESCE(work_mode, 'office') AS work_mode
FROM attendance;

UPDATE attendance
SET work_mode = 'office'
WHERE work_mode IS NULL;

--Find employees with invalid phone length.

SELECT
	emp_id,
	first_name,
	phone
FROM employees
WHERE phone IS NOT NULL
AND LENGTH(regexp_replace(phone, '\D', '', 'g')) <> 10;

