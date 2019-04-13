create table if not exists shxy_ods_safe.ods_vote_record(
    id int,
    user_id string,
    vote_id int,
    group_id int,
    create_time string
    )
COMMENT '分组表'
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS textfile;


create table test(id int) clustered by (id) into 1 buckets stored as orc tblproperties('transactional'='true')
