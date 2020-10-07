-- 1
alter table countries rename to country_new;

-- 2
alter table locations add region_id int unique;

-- 3
alter table locations rename to old_locations;
create table locations (id int unique, old_columns);
insert into locations (old_columns) select old_columns from old_locations;
drop table old_locations;

-- 4
-- locations : c1 state_province c2
alter table locations rename to old_locations;
create table locations (c1 int, state_province int, region_id int, c2 int);
insert into locations (c1, state_province, c2) select * from old_locations;
drop table old_locations;

-- 5
alter table locations
alter country_id type int;

-- 6
alter table locations
drop if exists city;

-- 7
alter table location
rename state_province to state;

-- 8
alter table location
add primary key (location_id);

-- 9
alter table locations
add primary key (location_id, country_id);

-- 10
-- use \d locations to see name of constraint ex: locations_pkey
alter table locations
drop constraint locations_pkey;

-- 11
alter table job_history
add constraint
foreign key (job_id) references jobs (job_id);

-- 12
alter table job_history
add constraint fk_job_id
foreign key (job_id) references jobs (job_id);

-- 13
alter table job_history
drop constraint fk_job_id;

-- 14
create index indx_job_id on job_history(job_id);

-- 15
drop index indx_job_id;
