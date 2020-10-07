-- 1
create table countries (country_id int, country_name varchar(30), region_id int);

-- 2
create table if not exists countries (country_id int, country_name varchar(30), region_id int);

-- 3
create table dup_countries (like countries);

-- 4
create table dup_countries as table countries;

-- 5
create table countries (country_id int not null, country_name varchar(30) not null, region_id int not null);

-- 6
create table jobs (
 job_id int not null,
 job_title varchar(30),
 min_salary int check(min_salary >= 0),
 max_salary int check(max_salary >= 0 and max_salary <= 25000)
);

-- 7
create table countries (
 country_id int not null,
 country_name varchar(30) not null
   check (country_name in ('Italy', 'India', 'China')),
 region_id int not null
);

-- 8

-- 9
create table countries (
 country_id int not null unique,
 country_name varchar(30),
 region_id int not null
);

-- 10
create table jobs (
 job_id int,
 job_title varchar(30) default '',
 min_salary int default 8000,
 max_salary int default null
);

-- 11
create table countries (
 country_id int not null primary key,
 country_name varchar(30),
 region_id int not null
);

-- 12
create table countries (
 country_id serial,
 country_name varchar(30),
 region_id int not null
);

-- 13
create table countries (
 country_id int not null,
 country_name varchar(30),
 region_id int not null,
 primary key (country_id, region_id)
);

-- 14
create table job_history (
 employee_id int not null primary key,
 start_date date,
 end_date date,
 job_id int references jobs (job_id), -- job_id must be primary key in jobs
 department_id int
);

-- 15
create table employees (
 employee_id int not null primary key,
 first_name varchar(30),
 last_name varchar(30),
 email varchar(60),
 phone_number varchar(15),
 hire_date date,
 job_id int not null,
 salary int,
 commission varchar(30),
 manager_id int,
 department_id int,
 foreign key (department_id, manager_id) references departments (department_id, manager_id)
);

-- 16
create table employees (
 employee_id int not null primary key,
 first_name varchar(30),
 last_name varchar(30),
 email varchar(60),
 phone_number varchar(15),
 hire_date date,
 job_id int,
 salary int,
 commission varchar(30),
 manager_id int,
 department_id int,
 foreign key (job_id) references jobs (job_id), -- job_id must be primary key in jobs
 foreign key (department_id) references departments (department_id) -- department_id must be primary key in departments
);

-- 17
create table employees (
 employee_id int not null primary key,
 first_name varchar(30),
 last_name varchar(30),
 email varchar(60),
 phone_number varchar(15),
 hire_date date,
 job_id int,
 salary int,
 commission varchar(30),
 manager_id int,
 department_id int,
 foreign key (job_id) references jobs (job_id) on update restrict on delete restrict, -- job_id must be primary key in jobs
 foreign key (department_id) references departments (department_id) -- department_id must be primary key in departments
);

-- 18
create table employees (
 employee_id int not null primary key,
 first_name varchar(30),
 last_name varchar(30),
 email varchar(60),
 phone_number varchar(15),
 hire_date date,
 job_id int,
 salary int,
 commission varchar(30),
 manager_id int,
 department_id int,
 foreign key (job_id) references jobs (job_id) on delete cascade, on update restrict, -- job_id must be primary key in jobs
 foreign key (department_id) references departments (department_id) -- department_id must be primary key in departments
);

-- 19
create table employees (
 employee_id int not null primary key,
 first_name varchar(30),
 last_name varchar(30),
 email varchar(60),
 phone_number varchar(15),
 hire_date date,
 job_id int,
 salary int,
 commission varchar(30),
 manager_id int,
 department_id int,
 foreign key (job_id) references jobs (job_id) on delete set null on update set null, -- job_id must be primary key in jobs
 foreign key (department_id) references departments (department_id) -- department_id must be primary key in departments
);

-- 20
create table employees (
 employee_id int not null primary key,
 first_name varchar(30),
 last_name varchar(30),
 email varchar(60),
 phone_number varchar(15),
 hire_date date,
 job_id int,
 salary int,
 commission varchar(30),
 manager_id int,
 department_id int,
 foreign key (job_id) references jobs (job_id) on delete no action on update no action, -- job_id must be primary key in jobs
 foreign key (department_id) references departments (department_id) -- department_id must be primary key in departments
);
