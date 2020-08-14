-- 1. List the following details of each employee: employee number, last name, first name, sex, and salary.
-- -- use inner join to combine tables and create view to save results
select e.emp_no, e.last_name, e.first_name, e.sex, s.salary  
from employee AS e
	INNER JOIN salaries AS s ON
	e.emp_no = s.emp_no;

CREATE VIEW employee_details AS
	select e.emp_no, e.last_name, e.first_name, e.sex, s.salary  
	from employee AS e
	INNER JOIN salaries AS s ON
	e.emp_no = s.emp_no;
select * from employee_details

-- 2. List first name, last name, and hire date for employees who were hired in 1986.
-- -- use subquery to isolate 1986 hire date from employee table
select * from employee where hire_date >= '1986-01-01'
	and hire_date < '1987-01-01';

select first_name, last_name, hire_date from employee
	where hire_date in (select hire_date from employee where hire_date >= '1986-01-01'
	and hire_date < '1987-01-01'); 

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
-- subquery test:
-- -- -- select emp_no, first_name, last_name from employee where emp_no in(
-- -- -- select emp_no from dept_manager where 'emp_no' = 'emp_no')
-- final solution using parent-child relationship:

select d.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name 
from dept_manager as b, employee as e, departments as d  where b.emp_no = e.emp_no and 
d.dept_no = b.dept_no;

-- 4. List the department of each employee with the following information: 
-- -- employee number, last name, first name, and department name.

select e.emp_no, e.first_name, e.last_name, d.dept_name 
from dept_emp as s, employee as e, departments as d  where s.emp_no = e.emp_no and 
d.dept_no = s.dept_no;

CREATE VIEW department_details AS
select e.emp_no, e.first_name, e.last_name, d.dept_name 
from dept_emp as s, employee as e, departments as d  where s.emp_no = e.emp_no and 
d.dept_no = s.dept_no;
select * from department_details

-- 5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
-- -- query columns from employee table and use combination of wildcard and like operator for last name
select first_name, last_name, sex from employee
where first_name = 'Hercules'
and last_name like 'B%'

-- 6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
-- -- use department_details view to query for Sales department

select emp_no, last_name, first_name, dept_name
from department_details 
where dept_name = 'Sales'

-- 7. List all employees in the Sales and Development departments, including their employee number, last name, first name, 
-- -- and department name.

-- -- use department_details view to query for Sales or Development
select emp_no, last_name, first_name, dept_name
from department_details 
where dept_name = 'Sales'
or dept_name = 'Development'

-- 8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
-- -- query employee table and filter by count function, group by statement, and order by keyword.
select last_name, count(last_name) as "Frequency of Last Names"
from employee
group by last_name
order by count(last_name)DESC;






