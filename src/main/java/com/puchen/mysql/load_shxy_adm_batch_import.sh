#!/bin/sh
# Author: v_puchen
# description: sqoop the data from adm tdsql to hive
# pram1: dataTime
# pram2: tdsql database config propertites
# pram3: tdsql table name
# pram4: hive table name
# pram5: columns
# pram6: conditions
# DATE: 2018/10/22
# REV: 1.0

source /opt/data/bdp_conf.properties 
echo "ip:$ip"
echo "username:$username"
echo "password:$password"
echo "port:$port"
echo "databases:$databases"

mtable=$1
htable="ods_$1"
echo "mtable:$mtable"

#mcount=`mysql -h$ip -u$username -p$password -P$port -D$databases -e "select count(*) from $mtable where $conditions" | tail -1 `
mcount=`mysql -h$ip -u$username -p$password -P$port -D$databases -e "select count(*) from $mtable" | tail -1 `
echo "mcount:$mcount"


#echo "sqoop import   \
#--connect jdbc:mysql://bigdata-senior01.chybinmy.com:3306/$databases   \
#--username $username  \
#--password $password   \
#--table $mtable   \
#--hive-overwrite
#--target-dir /user/hadoop/$htable  \
#--fields-terminated-by '\t'  \
#-m 2"

sqoop import \
--connect jdbc:mysql://192.168.31.205:3306/shxy_big_data \
--username $username \
--password $password \
--table $mtable \
--fields-terminated-by '\t' \
--delete-target-dir \
--num-mappers 1 \
--hive-overwrite 
--hive-import \
--hive-database shxy_ods_safe \
--hive-table $htable

#sqoop参数，在sqoop的同时可以直接创建表        --create-hive-$htable \

#sqoop import   \
#--connect jdbc:mysql://bigdata-senior01.chybinmy.com:3306/shxy_big_data    \
#--username $username  \
#--password $password   \
#--table $mtable    \
#-m 1


echo "Starting load HDFS DATA into hive table..."

#hdfs dfs -cp $mtable/part-m-00000 hdfs://bigdata-senior01.chybinmy.com:8020  /user/hive/warehouse/shxy_ods_safe.db/$htable

hiveCount=`hive -e "select count(id) from shxy_ods_safe.$htable" | tail -1`
echo "hiveCount:$hiveCount"

if [ $mcount -eq $hiveCount ] ;then
	echo "sqoop the data from adm tdsql to hive Successful!!"
else
	echo "sqoop the data from adm tdsql to hive ERROR!!"
fi


