create table t1
(tid int,name String,age int)
location '/mytable/hive/t2';

create table t2
(tid int,name String,age int)
row format delimited fields terminated by ',';

create table t3
row format delimited fields terminated by ','
as select * from t2;


alter table t1 add columns (eliglish int);


--视图
create view emp_info 
as 
select name,salay,deptname
from emp e,dept d
where e.deptno = d.deptno;

create table t2
(tid int,name String,age int);

create table t3
(tid int,name String,age int)
row format delimited fields terminated by ',';
