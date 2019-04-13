create table if not exists study_create_database.employees(
	name 		   String 			COMMENT		'employee name',
	salary 		   float 			COMMENT 	'employee salary',
	subordinates   ARRAY<String> 	COMMENT 	'employee names of subordinates',
	decucations    MAP<String,float> COMMENT 	'keys are deducations names ,values are percentages',
	address  	   STRUCT<street:String,city:String,state:String,zip:INT> COMMENT 'Home address')
COMMENT 'Descrirtion of the table'
TBLPROPERTIES('creator'='puchen','created_at'='20181116')
LOCATION	'hdfs://bigdata-senior01.chybinmy.com:8020/user/hive/warehouse/study_create_database.db/employees';


create table if not exists study_create_database.employees(
	name 		   String 			COMMENT		'employee name',
	salary 		   float 			COMMENT 	'employee salary',
	subordinates   ARRAY<String> 	COMMENT 	'employee names of subordinates',
	decucations    MAP<String,float> COMMENT 	'keys are deducations names ,values are percentages',
	address  	   STRUCT<street:String,city:String,state:String,zip:INT> COMMENT 'Home address')
COMMENT 'Descrirtion of the table'
LOCATION
  'hdfs://bigdata-senior01.chybinmy.com:8020/user/hive/warehouse/shxy_ods_safe.db/employees'
TBLPROPERTIES (
  'transient_lastDdlTime'='1542340248');