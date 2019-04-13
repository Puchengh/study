#!/bin/sh
# Author: v_puchen
# description: sqoop the data from rdcn tdsql to hive
# pram1: dataTime
# pram2: tdsql database config propertites
# pram3: tdsql table name
# pram4: hive table name
# pram5: columns
# pram6: conditions
# DATE: 2016/08/12
# REV: 1.0

source /data/bdp/bdp_etl_deploy/hduser06/dm_report/conf/bdp_conf.properties
source $BDP_HOME/common/common_function.sh

if [ $# -lt 6 ]; then 
    logPrint ERROR "parameters is illegal!"
    exit 1
fi

if  [ ! -n "$1" ] ;then
    dataTime=`date +"%Y%m%d"`
else
    dataTime=`date -d $1 +"%Y%m%d"`
fi

exitCodeCheck $?
logPrint INFO "dataTime:$dataTime"

if  [ ! -n "$2" ] ;then
    logPrint ERROR 'the database config propertites counld not be null'
    exit 1
else
	source $BDP_HOME/conf/$2
	database=$dbname
    logPrint INFO "database:$database"
fi

if  [ ! -n "$3" ] ;then
    logPrint ERROR 'the tdsql table name counld not be null'
    exit 1
else
	mtable=$3
    logPrint INFO "mtable:$mtable"
fi

if  [ ! -n "$4" ] ;then
    logPrint ERROR 'the hive table name counld not be null'
    exit 1
else
	htable=$4
    logPrint INFO "htable:$htable"
fi

if  [ ! -n "$5" ] ;then
    logPrint ERROR 'the columns counld not be null'
    exit 1
else
    columns=$5
fi

storageDs=${dataTime}
logPrint INFO "storaged ds=$storageDs"

if  [ ! -n "$6" ] ;then
    logPrint ERROR "the conditions counld not be null!"
    exit 1
else
	conditions=$6
	logPrint INFO "recieve sqoop conditions:$conditions"
	if [ "$conditions"X = "1=1"X ]; then
		date1=`date -d yesterday +"%Y%m%d"`
		date2=`date +"%Y%m%d"`
		
		if [[ $dataTime -eq $date1 ]] || [[ $dataTime -eq $date2 ]];then
			logPrint INFO "the whole sqoop job data time is ok"

			ds_bak=bak_`date +"%Y%m%d%H%M%S"`
			parExist=`hive -e "show partitions $htable" | grep "ds=$storageDs" | tail -1`
			
			if  [ -n "$parExist" ] ;then
				hive -e "alter table $htable partition (ds='$storageDs') rename to partition(ds='$ds_bak')"
				logPrint INFO "the partition ds='$storageDs' count sum:$bakCount,now to backup...."
				
				if [ $? -ne 0 ]; then
		        	logPrint ERROR "alter partition ds='$storageDs' to new partition error"
			        exit $1
			    else
			        logPrint INFO "backup partition ds=$storageDs to new partition success"
			    fi
			    
			    hive -e "alter table $htable add partition(ds='$storageDs') location '/user/hive/warehouse/hduser0601/cfpd_ods_safe.db/$htable/ds=$storageDs'"
				exitCodeCheck $?
				logPrint INFO "location partition to the hdfs success!"
			fi		    
			
			if [ $? -ne 0 ]; then
		        logPrint ERROR "alter partition ds=$storageDs to new partition error"
		        exit $1
		    else
		        logPrint INFO "backup partition ds=$storageDs to new partition success"
		    fi
		else
			logPrint ERROR "the whole sqoop job not permit import history data:$storageDs"
			exit 1
		fi
	fi
fi

logs=$DATA_HOME/logs/$database
if [ ! -d $logs ];then
	logPrint INFO "file not exists , now makes"
	mkdir -p $logs
fi

startTime=`date +"%Y/%m/%d %H:%M:%S"`
logPrint INFO "Execute start time: $startTime"

dcns=$dcns
dbname=$dbname
sum=0

sqoop import -D mapreduce.job.queuename=queue_0601_01 --connect "jdbc:mysql://$ip:$port/$dbname?useUnicode=true&characterEncoding=utf-8" \
		--username $username --password $password --table $mtable --hive-import --columns $columns \
		--hive-table $htable --hive-overwrite --hive-partition-key ds \
        --hive-partition-value $storageDs --hive-delims-replacement "#" --delete-target-dir -m 1 --null-string '\\N' --null-non-string '\\N' \
        --where "$conditions"

exitCodeCheck $?

mcount=`mysql -h$ip -u$username -p$password -P$port $dbname -e "select count(*) from $mtable where $conditions" | tail -1 `
	
if  [ ! -n "$mcount" ] ;then
	mcount=0
fi

hiveCount=`hive -e "select count(*) from $htable where ds='$storageDs'" | tail -1`

if [ $mcount -eq $hiveCount ] ;then
	executeStatus=0
else
	executeStatus=1
fi

endTime=`date +"%Y/%m/%d %H:%M:%S"`
echo $htable \| $storageDs \| $startTime \| $endTime \| $database \|$dcn1\|$dcn2\|$dcn3\|$dcn4\|$dcn5\|$dcn6\|$mcount\|$hiveCount\|$executeStatus > $logs/${htable}.log
hive -e "load data local inpath '$logs/${htable}.log' into table cfpd_ods_safe.bdp_logs partition(ds='$storageDs',db='$database')";

	

