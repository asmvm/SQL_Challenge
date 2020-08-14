drop table employees
CREATE TABLE employee(
	emp_no int,
	emp_title_id varchar(10) NOT NULL,
	birth_date date NOT NULL,
	first_name varchar(30) NOT NULL,
	last_name varchar(30) NOT NULL,
	sex varchar(5) NOT NULL,
	hire_date date NOT NULL,
	PRIMARY KEY(emp_no));

ALTER TABLE employee
ADD FOREIGN KEY (emp_title_id) REFERENCES titles(title_id);
select * from employee

DROP TABLE departments
CREATE TABLE departments(
	dept_no varchar(5),
	dept_name varchar(25),
	PRIMARY KEY (dept_no));
select * from departments	

drop table dept_emp
CREATE TABLE dept_emp(
	emp_no int,
	dept_no varchar(5),
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no));
select *  from dept_emp

drop table dept_manager
CREATE TABLE dept_manager(
	dept_no varchar(5),
	emp_no int,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no));
select *  from dept_manager

drop table salaries
CREATE TABLE salaries(
	emp_no int,
	salary int,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no));
select *  from salaries

CREATE TABLE titles(
	title_id varchar(5),
	title varchar(30),
	PRIMARY KEY (title_id));
select *  from titles
	