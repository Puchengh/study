create table if not exists shxy_ods_safe.user_shxy(
    id int,
    name string,
    classes string)
partitioned by (ds string)
row format delimited fields terminated by '\t';



create external table `shxy_ods_safe.wyp_bak_2`(
    id    int,                                         
	name  string,                                      
	age      int,                                         
	tel   string 
    )
COMMENT '表描述'
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS textfile;
TBLPROPERTIES('creater'='me') --按键值对的格式为表增加额外的文档说明


create external table `shxy_ods_safe.wyp_bak`(
    id    int,                                         
	name  string,                                      
	age      int,                                         
	tel   string 
    )
COMMENT '表描述'
PARTITIONED BY (
    `event_day` string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS textfile;

