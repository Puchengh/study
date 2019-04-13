 --降低热块 提高查询效率
create table bucket 
(sid int,name String,age int)
clustered by(name) into 5 buckets;


