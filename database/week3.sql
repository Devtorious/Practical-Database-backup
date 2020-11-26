create table employees(
    Employee_ID int(4) unique not null,
    Last_name varchar(30),
    First_name varchar(30),
    Salary int,
    Dept_ID int
);

#snappy snappy
drop table employees;


#data submit
insert into employees values(1001, 'Smith', 'John', 62000, 500),
                            (1002, 'Nguyen', 'Jane', 57600, 500),
                            (1003, 'Tran', 'Hang', 71000, 501),
                            (1004, 'Le', 'Nguyen', 42000, 502);

select *
from employees
where #to select all

select Employee_ID, Last_name, First_name, Salary, Dept_ID
from employees
where Salary <= 52500;

update employees
set Salary = 62500
where Employee_ID = 1001;

update employees
set Dept_ID = 5001
where Dept_ID = 501;

delete from employees
where Employee_ID = 1001;

delete from employees
where Dept_ID = 500;

delete from employees
where Salary < 50000 and Dept_ID = 5001;

drop table employees;