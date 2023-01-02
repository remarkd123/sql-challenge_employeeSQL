-- Data Analysis
--     List the employee number, last name, first name, sex, and salary of each employee.

SELECT 
	e.emp_no AS "Employee Number",
	last_name AS "Last Name",
    first_name AS "First Name",
	sex AS "Sex",
	salary AS "Salary"
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no
ORDER BY e.emp_no;

--     List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT 
	first_name AS "First Name",
	last_name AS "Last Name",
	hire_date AS "Hire Date"
FROM employees
WHERE hire_date BETWEEN '01/01/1986' AND '12/31/1986'
ORDER BY hire_date;

--     List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT
	dm.dept_no AS "Manager's Department Number",
	dept_name AS "Department Name",
	dm.emp_no AS "Manager's Employee Number",
	last_name AS "Last Name",
    first_name AS "First Name"
FROM dept_manager AS dm
INNER JOIN departments AS d
ON dm.dept_no = d.dept_no
INNER JOIN employees AS e
ON dm.emp_no = e.emp_no;

--     List the department number for each employee along with that employee’s employee number, last name, first name, and department name.

SELECT
	de.dept_no as "Department Number",
	de.emp_no AS "Employee Number",
	last_name AS "Last Name",
	first_name AS "First Name",
	dept_name AS "Department Name"
FROM dept_emp AS de
INNER JOIN departments AS d
ON de.dept_no = d.dept_no
INNER JOIN employees AS e
ON de.emp_no = e.emp_no
ORDER BY de.emp_no;

--     List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT 
	first_name AS "First Name",
	last_name AS "Last Name",
	sex AS "Sex"
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%';

--     List each employee in the Sales department, including their employee number, last name, and first name.

SELECT  
	dept_name AS "Department Name",
    de.emp_no AS "Employee Number",
	last_name AS "Last Name",
	first_name AS "First Name"
FROM dept_emp AS de
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
    INNER JOIN employees AS e
        ON (de.emp_no = e.emp_no)
WHERE d.dept_name = 'Sales'
ORDER BY de.emp_no;

--     List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT  
    de.emp_no AS "Employee Number",
	last_name AS "Last Name",
	first_name AS "First Name",
    dept_name AS "Department Name"
FROM dept_emp AS de
    INNER JOIN departments AS d
        ON (de.dept_no = d.dept_no)
    INNER JOIN employees AS e
        ON (de.emp_no = e.emp_no)
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development'
ORDER BY de.emp_no;

--     List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT 
    last_name AS "Employee Last Name",
	COUNT(last_name) AS "Frequency Count"
FROM employees
GROUP BY last_name
ORDER BY "Frequency Count" DESC; 

