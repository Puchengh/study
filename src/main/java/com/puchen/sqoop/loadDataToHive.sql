load data local inpath '/opt/data/data/student02.txt' into table t2;


load data local inpath '/opt/data/data/' into table t2;


./sqoop import --hive-import \
		   --connect jdbc:oracle:thin:@192.168.31.203:1521:orcl  \
		   --username temp_prod \
		   --password Aa123456 \
		   --table sys_ext_area \
		   -m 1  \
		   --fields-terminated-by ','  \
		   --target-dir '/sqoop/emp' \
		   ----hive-table ods_sys_ext_area