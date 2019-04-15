#!/bin/bash
# Author:puchen
#if语句


rate=$(df -h | grep "/dev/sda3" | awk -F " " '{print $5}' | cut -d "%"  -f1)
if [ $rate -lt 80 ];then
    echo "ture"
fi

if [ $rate -lt 80 ]
    then
        echo "ture"
    else
        echo "false"
fi


if [ $rate -lt 80 ]
    then
        echo "ture"
    elif [ $rate -lt 80 ]
        then
            echo "false"
else
    echo "ture"
fi

ntpdate asia.pool.ntp.org &>/dev/nulldate

#远程扫描命令
port=$(nmap -sT 192.168.31.83 | grep tcp | grep http | awk '{print $2}')
if [ "$port" == "open" ]
    then
        echo "$(date) http is ok!" >> /tmp/httpd.acc.log
    else
        /etc/rc.d/init/httpd start &> /dev/null
        echo "$(date) restart httpd !!!" >> /tmp/httpd.error.log
fi



