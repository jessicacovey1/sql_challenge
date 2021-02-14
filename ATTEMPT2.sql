DROP TABLE departments CASCADE;

-- Create a new table
CREATE TABLE departments (
  dept_no VARCHAR NOT NULL,
  dept_name VARCHAR NOT NULL,
  PRIMARY KEY (dept_no)
);

-- Query all fields from the table
SELECT * FROM departments;

----------------------------------------
DROP TABLE dept_emp CASCADE;

-- Create a new table
CREATE TABLE dept_emp (
  --PRIMARY KEY (emp_no),
  emp_no VARCHAR NOT NULL,
  dept_no VARCHAR NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);

-- Query all fields from the table
SELECT * FROM dept_emp;
-- ------------------------------------------
DROP TABLE dept_manager;

-- Create a new table
CREATE TABLE dept_manager (
  PRIMARY KEY (emp_no),
  dept_no VARCHAR NOT NULL,
  emp_no VARCHAR NOT NULL,
  FOREIGN KEY (dept_no) REFERENCES departments(dept_no)
);
 
-- Query all fields from the table
SELECT * FROM dept_manager;
-- ------------------------------------------
DROP TABLE employees;

-- Create a new table
CREATE TABLE employees (
	PRIMARY KEY (emp_title_id),
	emp_no VARCHAR NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR NOT NULL,
	last_name VARCHAR NOT NULL,
	sex VARCHAR NOT NULL,
	hire_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES dept_manager(emp_no)
);

-- Query all fields from the table
SELECT * FROM employees;
------------------------------------------
DROP TABLE salary;

-- Create a new table
CREATE TABLE salary (
  PRIMARY KEY (salary),
  emp_num VARCHAR NOT NULL,
  salary INT NOT NULL,
  FOREIGN KEY (emp_num) REFERENCES dept_manager(emp_no)
);

-- Query all fields from the table
SELECT * FROM salary;
------------------------------------------
DROP TABLE titles;

-- Create a new table 
CREATE TABLE titles(
  PRIMARY KEY (title),
  title_id VARCHAR NOT NULL,
  title VARCHAR NOT NULL,
  FOREIGN KEY (title_id) REFERENCES employees(emp_title_id)
);

-- Query all fields from the table
SELECT * FROM titles;
-- -----------------------------------------
-- -- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
-- -- Perform an INNER JOIN on the two tables
-- --SELECT players.first_name, players.last_name, players.hand, matches.loser_rank
-- --show these columns from each table
-- --FROM matches INNER JOIN players ON
-- -- from the first table matches -- join with the second table players
-- --players.player_id=matches.loser_id;
-- -- only include the players in the player table that match with a loser id in the match table
-- -- inner join has to be in both
-- -- 2. List first name, last name, and hire date for employees who were hired in 1986.

-- -- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

-- -- 4. List the department of each employee with the following information: employee number, last name, first name, and department name.

-- -- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

-- -- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.

-- -- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

-- -- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

-- -- Perform an INNER JOIN on the two tables
-- SELECT players.first_name, players.last_name, players.hand, matches.loser_rank
-- FROM matches
-- INNER JOIN players ON
-- players.player_id=matches.loser_id;
