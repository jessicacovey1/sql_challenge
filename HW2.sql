DROP TABLE departments CASCADE

CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    "dept_name" VARCHAR   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

SELECT * FROM departments
-------------------------------
DROP TABLE dept_emp CASCADE

CREATE TABLE "dept_emp" (
    "emp_no" VARCHAR   NOT NULL,
    "dept_no" VARCHAR   NOT NULL
);
ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

SELECT * FROM dept_emp
--------------------------------
DROP TABLE dept_manager CASCADE

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" VARCHAR   NOT NULL,
    CONSTRAINT "pk_dept_manager" PRIMARY KEY (
        "emp_no"
     )
);
ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

SELECT * FROM dept_manager
-----------------------------------
DROP TABLE employees CASCADE

CREATE TABLE "employees" (
    "emp_no" VARCHAR   NOT NULL,
    "emp_title_id" VARCHAR   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "sex" VARCHAR   NOT NULL,
    "hire_date" DATE   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);
ALTER TABLE "employees" ADD CONSTRAINT "fk_employees_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

SELECT * FROM employees
---------------------------------------
DROP TABLE salaries CASCADE

CREATE TABLE "salaries" (
    "emp_no" VARCHAR   NOT NULL,
    "salary" DEC   NOT NULL
);
ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

SELECT * FROM salaries
----------------------------------------
DROP TABLE titles CASCADE

CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);
SELECT * FROM titles
-----------------------------------------
-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary 
	FROM employees 
	JOIN salaries 
	ON (employees.emp_no = salaries.emp_no);

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT * 
FROM employees
WHERE 
	hire_date >= '1986-01-01' 
	AND hire_date <= '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
--dept_manager >> dept_no
--dept_manager >> emp_no
--departments >> dept_name
--departments >> dept_no
--employees >> last_name
--employees >> first_name
--employees >> emp_no

--3,4,6,7 will have joins  joining three tables  do you need junction table?
-- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
---where clause last name is b%
-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
--group by
-- ## Bonus (Optional)

