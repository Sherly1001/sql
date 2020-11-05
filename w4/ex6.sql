-- 1
select count(job_id) from employees;

-- 2
select sum(salary) from employees;

-- 3
select min(salary) from employees;

-- 4
select max(salary) from employees;

-- 5
select avg(salary), count(*) from employees
  where department_id = 90;

-- 6
select max(salary), min(salary), sum(salary), avg(salary) from employees;

-- 7
select job_id, count(*) from employees
  group by job_id;

-- 8
select max(salary) - min(salary) from employees;

-- 9
select manager_id, min(salary)
  from employees
  where manager_id is not null
  group by manager_id
  order by min(salary) desc;

-- 10
select department_id, sum(salary) sums from employees
  group by department_id;

-- 11
select job_id, job_title, avg(salary) from employees
  natural join jobs
  where job_title != 'Programmer'
  group by job_id, job_title
  order by job_id;

-- 12
select job_id, sum(salary), max(salary), min(salary), avg(salary) fr
  om employees
  where department_id = 90
  group by job_id;

-- 13
select job_id, max(salary) from employees
  group by job_id
  having max(salary) >= 4000;

-- 14
select department_id, avg(salary), count(*) from employees
  group by department_id
  having count(*) > 10;
