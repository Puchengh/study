--创建分区表
create table t1
(sid int,name String)
partitioned by (gender String)
row format delimited fields terminated by ',';

--当数据量特别大的时候，按照一定的条件过滤数据
--插入数据
insert into ti partition (gender='M') select sid,name from emp;
insert into ti partition (gender='F') select sid,name from emp;

