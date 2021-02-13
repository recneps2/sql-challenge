-- #1) List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT emp.emp_no, last_name, first_name, sex, salary FROM emp_detail AS emp
JOIN salaries AS sal ON sal.emp_no = emp.emp_no

-- #2) List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date FROM emp_detail
WHERE EXTRACT(YEAR FROM CAST (hire_date AS TIMESTAMP)) = '1986';

-- #3) List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

SELECT emp.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM emp_detail AS e
INNER JOIN employees as emp
	ON e.emp_no = emp.emp_no
INNER JOIN managers as man
	ON e.emp_no = man.emp_no
INNER JOIN departments as d
	ON emp.dept_no = d.dept_no;

-- #4) List the department of each employee with the following information: employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM emp_detail AS e
INNER JOIN employees as emp
	ON e.emp_no = emp.emp_no
INNER JOIN departments as d
	ON emp.dept_no = d.dept_no;


-- #5) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

SELECT first_name, last_name, sex
FROM emp_detail
WHERE first_name = 'Hercules' AND last_name like 'B%';

-- #6) List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM emp_detail as e
JOIN employees as emp
	ON e.emp_no = emp.emp_no
INNER JOIN departments as d
	ON emp.dept_no = d.dept_no
WHERE dept_name = 'Sales';

-- #7) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM emp_detail as e
INNER JOIN employees as emp
	ON e.emp_no = emp.emp_no
INNER JOIN departments as d
	ON emp.dept_no = d.dept_no
WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- #8) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.

SELECT last_name, COUNT(last_name)
FROM emp_detail
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;