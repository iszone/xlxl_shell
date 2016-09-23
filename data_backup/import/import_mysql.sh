#!/bin/bash
#
#update online mysql-data.
stty erase ^H

backup_ip=10.0.0.1
backup_path=`ssh root@$backup_ip 'sh /home/zone/latest_mysqldata.sh'`

scp $backup_ip:$backup_path /tmp/

if [ $? = 0 ];then
        echo "Scp mysql_data_file:$backup_path success!"
else
        echo "error,exit."
        exit 1
fi


clear
echo
echo -e "\033[32mNow,we will start source data.Please wait a moment...\033[0m"
echo

for i in `seq 3 -1 1`
        do
        echo -n -e  "\b\b$i"
        sleep 1 
done

data_name=`ssh root@$backup_ip 'sh /home/zone/latest_mysqldata.sh'|awk -F"/" '{print $NF}'`
local_data=/tmp/$data_name
#/usr/local/app/mysql/bin/mysql -hlocal_ip    -P9001 -uroot -ppwd -e "source $local_data"
/usr/local/app/mysql/bin/mysql --login-path=zone -e "source $local_data"

if [ $? = 0 ];then
        echo -e "\033[32mSource sql success!\033[0m"
        echo "rm $local_data success!"
        rm -fr $local_data
else
        clear
        echo
        echo -e "\033[32mSource sql error,exit.\033[0m"
        echo -e "\033[32mThe latest data backup in the directory:$local_data. Please source it by youself.\033[0m"
        exit 1
fi