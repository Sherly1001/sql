-- 1
select first_name, last_name from employees
where salary > (select salary from employees where last_name = 'Bull');

-- 2
select first_name, last_name from employees
where department_id = (select department_id from departments where department_name = 'IT');

-- 3
select first_name, last_name from employees e
natural join departments d
natural join regions r
where r.region_name = 'Americas';

select first_name, last_name from employees where department_id
in (select department_id from departments where location_id
in (select location_id from locations where country_id = 'US'));

-- 4
select first_name, last_name from employees
where employee_id in (select manager_id from employees);

-- 5
select first_name, last_name from employees
where salary > (select avg(salary) from employees);

-- 6
select first_name, last_name from employees e
where salary = (select min_salary from jobs j
where e.job_id = j.job_id);

-- 7
select first_name, last_name from employees where department_id
in (select department_id from departments where department_name = 'IT')
and salary > (select avg(salary) from employees);

-- 8
select first_name, last_name, salary from employees
where salary > (select salary from employees where last_name = 'Bell');

-- 9
select first_name, last_name, salary from employees
where salary = (select min(salary) from employees);

-- 10
select first_name, last_name, salary from employees
where salary > all(select min(salary) from employees group by department_id);

-- 11
select first_name,last_name, job_id, salary from employees
where salary > all (select salary from employees where job_id = 'SH_CLERK') 
order by salary;

-- 12
select e.first_name, e.last_name from employees e
where not exists (select 'x' from employees m where m.manager_id = e.employee_id);

-- 13
select employee_id, first_name, last_name,
(select department_name from departments d
 where e.department_id = d.department_id) department
from employees e
order by department;

-- 14
select employee_id, first_name, last_name, salary,
(select department_name from departments d
 where e.department_id = d.department_id) department
from employees e
where salary > (select avg(salary) from employees where department_id = e.department_id)
order by department;

-- 15
select * from (select row_number() over(order by employee_id), * from employees) e
where mod(row_number, 2) = 1;

-- 16
select distinct salary from employees
order by salary desc
offset 4 limit 1;

-- 17
select distinct salary from employees
order by salary asc
offset 3 limit 1;

-- 18
select * from (select * from employees order by employee_id desc limit 10) e
order by employee_id asc;

-- 19
select * from departments
where department_id not in (select department_id from employees)

-- 20
select distinct salary from employees
order by salary desc limit 3

-- 21
select distinct salary from employees
order by salary asc limit 3

-- 22
select distinct salary from employees
order by salary desc
offset (n - 1) limit 1
