#!/usr/bin/env bash
#Auther: puchen

for time in morning noon afternoon
    do
        echo "this time is $time"
    done

cd /tmp
ls *.tar.gz > ls.log
for i in $(cat ls.log)
    do
        tar -zxf $i &> /tmp/tmp1/null
    done
rm -rf ls.log


read -p "Please input user name:" -t 30 name
read -p "Please input the number of users:" -t 30 num
read -p "Please input the password of users:" -t 30 pass
if [ -z "$name" -a ! -z "$num" -a ! -z "$pass" ]
    then
    y=$(echo $num|sed 's/[0-9]//g')
        if [ -z "$y" ]
            then
                for(( i=1;i<=$num;i=i+1 ))
                    do
                        /usr/sbin/useradd $name$i &> /dev/null
                            echo $pass|/usr/bin/passwd --stdin $name$i &>/dev/null
                     done
        fi
fi