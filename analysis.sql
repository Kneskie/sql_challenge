-- 1.List the following details of each employee: employee number, last name, 
--first name, sex, and salary.

SELECT
		e.emp_no
		,e.last_name
		,e.first_name
		,e.gender
		,(SELECT s.salary FROM salaries AS s 
		  WHERE e.emp_no = s.emp_no) AS salary
					
FROM employees AS e
;

-- 2. List employees who were hired in 1986
select emp_no, last_name, first_name, hire_date 
from employees 
where extract(year from hire_date) = 1986;


-- 3. List the manager of each department with the following information:
-- department number, department name, the manager's employee number, 
-- last name, first name
select distinct on (dept_manager.dept_no) dept_manager.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from dept_manager 
inner join departments 
on dept_manager.dept_no= departments.dept_no
inner join employees 
on dept_manager.emp_no = employees.emp_no
order by dept_manager.dept_no DESC;

-- 4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.
select distinct on (e.emp_no) e.emp_no, e.last_name, e.first_name,d.dept_name
from employees as e
left join dept_emp as de
on e.emp_no = de.emp_no
inner join departments as d
on de.dept_no = d.dept_no
order by e.emp_no DESC;


-- 5. List all employees whose first name is "Hercules" 
--and last names begin with "B".
select e.last_name, e.first_name
from employees as e
where (e.first_name = 'Hercules') and (lower(e.last_name) like 'b%')
order by e.last_name;


-- Create table with most current departments for each employee to use for #6 and #7 below:
select distinct on (emp_no) *
into current_dept_emp
from dept_emp
order by emp_no DESC;


--6.List each employee in the Sales department, including their employee number, last name, and first name
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join current_dept_emp as cde
on e.emp_no = cde.emp_no
inner join departments as d
on cde.dept_no = d.dept_no
where lower(d.dept_name) = 'sales';

-- 7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
select e.emp_no, e.last_name, e.first_name, d.dept_name
from employees as e
inner join current_dept_emp as cde
on e.emp_no = cde.emp_no
inner join departments as d
on cde.dept_no = d.dept_no
where (lower(d.dept_name) = 'sales') or (lower(d.dept_name) = 'development');


-- 8. In descending order, list the frequency count of employee last names, 
-- i.e., how many employees share each last name.
select last_name,count(last_name) as Frequency 
from employees 
group by last_name
order by frequency desc;