--employee number, first name, last name, gender, salary
SELECT
e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM
employees e
JOIN
salaries s
ON e.emp_no = s.emp_no;

--List first name, last name, and hire date for employees who were hired in 1986.
SELECT
first_name, last_name, hire_date
FROM
employees
WHERE
EXTRACT (YEAR FROM hire_date) = '1986';

--List the manager of each department with the following information: dept number, dept name, 
--the manager's employee number, first name, last name

SELECT
d.dept_no, d.dept_name, dm.emp_no, e.first_name, e.last_name
FROM departments d
JOIN dept_manager dm
ON d.dept_no = dm.dept_no
JOIN employees e
ON dm.emp_no = e.emp_no;

--List the department of each employee with the following information: employee number, last name, 
--first name, and department name.
SELECT 
e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_manager dm
ON e.emp_no = dm.emp_no
JOIN departments d
ON d.dept_no = dm.dept_no;

--List first name, last name, and sex for employees whose first name is "Hercules" 
--and last names begin with "B."
SELECT first_name, last_name
FROM
	employees
WHERE
	first_name = 'Hercules'
AND
last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, 
--first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_manager dm
ON e.emp_no = dm.emp_no
JOIN departments d
ON d.dept_no = dm.dept_no
WHERE dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number, last name, 
--first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees e
JOIN dept_manager dm
ON e.emp_no = dm.emp_no
JOIN departments d
ON d.dept_no = dm.dept_no
WHERE dept_name = 'Sales' 
OR 
dept_name = 'Development'

--In descending order, list the frequency count of employee last names, i.e., 
--how many employees share each last name
SELECT
	last_name, COUNT(last_name) AS "Shared_last_name_count"
FROM 
	employees
GROUP BY last_name 
ORDER BY "Shared_last_name_count" DESC