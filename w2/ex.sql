-- 1.1
alter table employees
  add salary int;

-- 1.2
update employees set salary = 10000000;

-- 1
select first_name "first name", last_name "last name" from employees;

-- 2
select distinct city from employees;

-- 3
select * from employees order by first_name desc;

-- 4
select first_name, last_name, salary, salary * 0.15 "PF" from employees;

-- 5
select employee_id, first_name || ' ' || last_name "name", salary from employees
order by salary;

-- 6
select sum(salary) from employees;

-- 7
select max(salary), min(salary) from employees;

-- 8
select avg(salary) from employees;

-- 9
select country, count(*) "number of employees" from employees
  group by country;

-- 10
select count(*) "number of employees" from employees;

-- 11
select upper(first_name) from employees;

-- 12
select left(first_name, 3) from employees;

-- 13
select 171 * 214 + 625 "result";

-- 14
select first_name || ' ' || last_name "name" from employees;

-- 15
select first_name || ' ' || last_name "name", length(first_name || ' ' || last_name) from employees;

-- 16
select first_name, first_name ~ '\d' "have digit in first name" from employees;

-- 17
select * from employees limit 10;

-- 18
select first_name || ' ' || last_name "employee", round((salary / 12) :: numeric, 2) "salary" from employees;
