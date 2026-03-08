drop database mycompany;

create database mycompany ;
use mycompany;

drop table department;
-- parent table
create table department(d_id int primary key, d_name varchar(30) );

insert into department values (10,"production");
insert into department values (20,"quality");
insert into department values (30,"admin");
insert into department values (40,"housekeeping");

select* from department;

-- child table
drop table employees;
create table employees(e_id int primary key auto_increment ,e_name varchar(30), email varchar(100),e_department_id int, 
foreign key
(e_department_id)references department (d_id) on delete cascade );
alter table employees auto_increment = 101;

insert into employees (e_name,email,e_department_id) values ("ravi","ravi@123",10);
insert into employees (e_name,email,e_department_id) values ("baby","baby@123",20);
insert into employees (e_name,email,e_department_id) values ("aathi","aathi@123",30);
insert into employees (e_name,email,e_department_id) values ("moni","moni@123",40);
insert into employees (e_name,email,e_department_id) values ("sudalai","sudal@123",10);
insert into employees (e_name,email,e_department_id) values ("diya","diya@123",20);
insert into employees (e_name,email,e_department_id) values ("devi","devi@123",30);
insert into employees (e_name,email,e_department_id) values ("pavi","pavi@123",10);
insert into employees (e_name,email,e_department_id) values ("sathya","sathya@123",40);

select* from employees;

delete from employees where e_department_id = 40;
delete from department where d_id = 40;

-- join two tables like need e_id,e_name,e_d_name

select e.e_id,e.e_name,d.d_name 
from employees e join department d 
on e.e_department_id= d.d_id;

-- count all employees 
select count(*) from employees;
-- count employee per department
select e_department_id, count(*) from employees group by e_department_id;
select * from employees where e_name ="ravi";

-- update employees details 
set sql_safe_updates=0; -- safe updates disable temporarily
update employees set e_department_id = 20 where e_name = "ravi";


