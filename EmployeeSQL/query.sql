--====== View the tables =========================================
--== 1. List employee number, last name, first name, sex, and salary.
--================================================================
SELECT	e.no AS "Employee No.",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		e.sex AS "Sex",
		s.salary AS "Salary"
FROM "Employees" e
LEFT JOIN "Salaries" s
ON e.no = s.employee_no;

-- ## Alternate way: using subquery
SELECT	e.no AS "Employee No.",
		e.last_name AS "Last Name",
		e.first_name AS "First Name",
		e.sex AS "Sex",
		s.salary AS "Salary"
FROM "Employees" e,
(
	SELECT employee_no, salary
	FROM "Salaries"
) s
WHERE e.no = s.employee_no;

--================================================================
--== 2. List first name, last name, and hire date for employees
--==   who were hired in 1986.
--================================================================
SELECT first_name, last_name, hire_date
FROM "Employees"
WHERE "hire_date" LIKE '%1986';

--================================================================
--== 3. List the manager of each department: department number, department name, 
--== the manager's employee number, last name, first name.
--================================================================
SELECT d.no AS "Department No.", 
		d.name AS "Department",
		e.no AS "Employee No.", 
		e.last_name AS "Last Name", 
		e.first_name AS "First Name"
FROM "Employees" e
INNER JOIN "Dept_Managers" dm
	ON dm.manager_no = e.no
	INNER JOIN "Departments" d
		ON dm.dept_no = d.no

--================================================================
--== 4. List the department of each employee with the following information:
--== employee number, last name, first name, and department name.
--================================================================
CREATE VIEW Employees_with_Dept AS
SELECT 	e.no AS "Employee No.",
		e.last_name AS "Last Name", 
		e.first_name AS "First Name",
		d.name AS "Department"
FROM "Employees" e
INNER JOIN "Employees_Dept" ed
	ON ed.employee_no = e.no
	INNER JOIN "Departments" d
		ON ed.dept_no = d.no;

SELECT *
FROM Employees_with_Dept;

--================================================================
--== 5. List first name, last name, 
--== and sex for employees whose first name is "Hercules" 
--== and last names begin with "B."
--================================================================
SELECT first_name, last_name, sex
FROM "Employees"
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--================================================================
--== 6. List all employees in the Sales department, 
--== including their employee number, last name, first name, and department name.
--================================================================
SELECT 	*
FROM Employees_with_Dept
WHERE "Department" = 'Sales';

--================================================================
--== 7. List all employees in the Sales and Development departments, including 
--== their employee number, last name, first name, and department name.
--================================================================
SELECT 	*
FROM Employees_with_Dept
WHERE "Department" = 'Sales' OR "Department" = 'Development';

--================================================================
--== 8. In descending order, list the frequency count of employee last names, 
--== i.e., how many employees share each last name.
--================================================================
SELECT last_name, COUNT("last_name") AS "Frequency count"
FROM "Employees"
GROUP BY "last_name"
ORDER BY "Frequency count" DESC;