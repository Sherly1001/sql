-- 1
select first_name || ' ' || last_name 'name', salary from employees
where salary not between 10000 and 15000;

-- 2
select first_name || ' ' || last_name 'name', department_id from employees
where department_id in (30, 100)
order by department_id;

-- 3
select first_name || ' ' || last_name 'name', salary from employees
where department_id in (30, 100)
and salary not between 10000 and 15000;
order by department_id;

-- 4
select first_name || ' ' || last_name 'name', hire_date from employees
where to_char(hire_date, 'YYYY') = '1987';

-- 5
select first_name
from employees
where first_name like '%b%'
and first_name like '%c%';

-- 6
select last_name, job_id, salary
from employees
where job_id in ('IT_PROG', 'SH_CLERK')
and salary not in (4500,10000, 15000);

-- 7
select last_name from employees where last_name like '______';

-- 8
select last_name from employees where last_name like '__e%';

-- 9
select distinct job_id  from employees;

-- 10
select first_name, last_name, salary, salary*.15 PF from employees;

-- 11
ELECT * 
from employees 
where last_name in('JONES', 'BLAKE', 'SCOTT', 'KinG', 'FORD');
