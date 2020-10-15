-- 1
insert into countries (country_id, country_name, region_id)
values ('sh', 'sherly1001', 1001);

-- 2
insert into countries (country_id, country_name)
values ('hs', 'haskell');

-- 3
create table country_new as table countries;

-- 4
insert into contry_new (country_id, country_name, region_id)
values ('md', 'markdown', null);

-- 5
insert into contry_new (country_id, country_name, region_id) values
  ('c1', 'country1', 101),
  ('c2', 'country2', 102),
  ('c3', 'country3', 103);

-- 6
insert into countries select * from country_new;

-- 7
create table countries (
  country_id serial,
  country_name varchar(40),
  region_id decimal(10, 0)
);

-- 8
create table countries (
  country_id char(2) unique,
  country_name varchar(40) default 'N/A',
  region_id decimal(10, 0)
);

-- 9
create table employees (
  ...
  department_id int references departments (department_id),
  manager_id int references departments (manager_id),
);
