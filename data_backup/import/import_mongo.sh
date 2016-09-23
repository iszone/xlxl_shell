#!/bin/bash
#
#update online mysql-data.
stty erase ^H

backup_ip=10.0.0.1
backup_path=`ssh root@$backup_ip 'sh /home/zone/latest_mongodb.sh'`

echo
echo -e "\033[32mNow,we will start source data.Please wait a moment...\033[0m"
echo

for i in `seq 3 -1 1`
        do
        echo -n -e  "\b\b$i"
        sleep 1 
done

#data_name=`ssh root@$backup_ip 'sh /home/zone/latest_mongodb.sh'|awk -F"/" '{print $NF}'`
#local_data=/tmp/$data_name
#/usr/local/app/mysql/bin/mysql -h127.0.0.1 -P9001 -uroot -ppwd -e "source $local_data"

ssh -l root $backup_ip "/usr/local/app/mongodb/bin/mongorestore -h loc_ip --port 9011 -u dba -p pwd -d dbname --directoryperdb $backup_path/yimei"
if [ $? = 0 ];then
        echo -e "\033[32mSource mongodb success!\033[0m"
else
        clear
        echo
        echo -e "\033[32mSource mongodb error,exit.\033[0m"
        echo -e "\033[32mThe latest data backup in the directory Êý¾ÝÀä±¸:$backup_path. Please source it by youself.\033[0m"
        exit 1
fi
