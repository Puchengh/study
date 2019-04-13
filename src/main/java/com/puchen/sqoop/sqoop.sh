#使用sqoop导入oracle数据到HDFS中
./sqoop import --connect jdbc:oracle:thin:@192.168.31.203:1521:orcl  
			   --username dev_hr
			   --password Aa123456
			   --table HR_EMP
			   --columns 'id,name,phone,maildept'
			   -m 1 
			   --target-dir /sqoop/hremp
#使用sqoop导入数据到HIVE中
./sqoop import --hive-import 
			   --connect jdbc:oracle:thin:@192.168.31.203:1521:orcl  
			   --username dev_hr
			   --password Aa123456
			   --table hr_emp
			   --columns 'id,name,phone,mail_dept'
			   -m 1 
			   --fields-terminated-by ',' 
			   
sqoop import --hive-import --connect jdbc:oracle:thin:@192.168.31.203:1521:orcl  
				--username dev_hr --password Aa123456 --table HR_EMP  -m 1  
				--columns 'id,name,phone,mail_dept' 
				--hive-database shxy_ods_safe --fields-terminated-by ',' 
				--hive-table ods_hr_emp
				
create table study_create_database.ods_hr_emp
(id int,name string,phone string,mail_dept int)
row format delimited fields terminated by ',';
#使用sqoop导入到hive中使用where条件
./sqoop import --hive-import 
		   --connect jdbc:oracle:thin:@192.168.31.203:1521:orcl  
		   --username dev_hr
		   --password Aa123456
		   --table hr_emp
		   --columns 'id,name,phone,mail_dept'
		   -m 1 
		   --fields-terminated-by ',' 
		   --target-dir '/sqoop/emp'
		   ----hive-table emp
#使用sqoop导出数据到oracle

./sqoop export --hive-import 
		   --connect jdbc:oracle:thin:@192.168.31.203:1521:orcl  
		   --username dev_hr
		   --password Aa123456
		   --table hr_emp
		   --columns 'id,name,phone,mail_dept'
		   -m 1 
		   --export-dir '/ouput/emp'