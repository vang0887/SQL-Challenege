--List the following details of each employee: employee number, last name, first name, gender, and salary.

SELECT  Emp.emp_no,
        Emp.last_name,
        Emp.first_name,
        Emp.gender,
        Sal.salary
FROM "Employees" as Emp
    LEFT JOIN "Salaries" as Sal
    ON (Emp.emp_no = Sal.emp_no)
ORDER BY Emp.emp_no;

--List employees who were hired in 1986

SELECT first_name, last_name
FROM "Employees"
WHERE hire_date BETWEEN '01-01-1986' AND '12-31-1986';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
SELECT dept_mgr.dept_no,
	   dept.dept_name,
	   dept_mgr.emp_no,
	   ep.last_name,
	   ep.first_name,
	   dept_mgr.from_date,
	   dept_mgr.to_date
FROM "Dept_Manager" as dept_mgr
	INNER JOIN "Departments" AS dept
		ON (dept_mgr.dept_no = dept.dept_no)
	INNER JOIN "Employees" AS ep
		ON (dept_mgr.emp_no = ep.emp_no);

--List the department of each employee with the following information: employee number, last name, first name, and department name.		
SELECT emp.emp_no,
	   emp.last_name,
	   emp.first_name,
	   d.dept_name
FROM "Employees" AS emp
	INNER JOIN "Dept_Emp" AS de
		ON (emp.emp_no = de.emp_no)
	INNER JOIN "Departments" AS d
		ON (de.dept_no = d.dept_no)
ORDER BY emp.emp_no;

--List all employees whose first name is "Hercules" and last names begin with "B."

SELECT *
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--List all employees in the Sales department, including their employee number, last name, first name, and department name.

SELECT emp.emp_no,
	   emp.last_name,
	   emp.first_name,
	   d.dept_name
FROM "Employees" AS emp
	INNER JOIN "Dept_Emp" AS de
		ON (emp.emp_no = de.emp_no)
	INNER JOIN "Departments" AS d
		ON (d.dept_no = de.dept_no)
WHERE d.dept_name IN ('Sales', 'Department')
ORDER BY emp.emp_no;

--List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT last_name, COUNT(last_name)
FROM "Employees"
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;