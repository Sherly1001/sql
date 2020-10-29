-- 1
select location_id, street_address, city, state_province, country_name from departments
natural join locations
natural join countries;

-- 2
select first_name, last_name, department_id, department_name from employees
natural join departments;

-- 3
select first_name, last_name, department_id, department_name from employees
natural join departments
natural join locations
where city = 'London';

-- 4
select e.employee_id, e.last_name, m.employee_id, m.last_name
from employees e
left join employees m on m.employee_id = e.manager_id;

-- 5
select e.first_name, e.last_name, e.hire_date
from employees e
join employees davies
on davies.last_name = 'Jones'
where davies.hire_date < e.hire_date;

-- 6
select department_name as "department name",
count(*) as "no of employees"
from departments d
natural join employees
group by d.department_id, department_name
order by department_name;

-- 7
select employee_id, job_title, end_date - start_date days from job_history
natural join jobs
where department_id = 90;

-- 8
select d.department_id, d.department_name, d.manager_id, e.first_name
from departments d
inner join employees e
on (d.manager_id = e.employee_id);

-- 9
select d.department_name, e.first_name, l.city
from departments d
join employees e
on (d.manager_id = e.employee_id)
join locations l using (location_id);

-- 10
select job_title, avg(salary)
from employees
natural join jobs
group by job_title;

-- 11
select job_title, first_name, salary-min_salary 'Salary - Min_Salary'
from employees
natural join jobs;

-- 12
select jh.* from job_history jh
join employees e
on (jh.employee_id = e.employee_id)
where salary > 10000;

-- 13
select first_name, last_name, hire_date, salary,
(datediff(now(), hire_date))/365 experience
from departments d join employees e
on (d.manager_id = e.employee_id)
where (datediff(now(), hire_date))/365>15;
