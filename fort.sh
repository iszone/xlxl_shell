#!/bin/bash
#
# Fort machine script
# Author:  zhangzone
# one@iszone.cn
#



#定义Backspace删除
stty erase ^H


#定义help参数
if [ "$1" == "--help" ] || [ "$1" == "help" ];then
        echo 
        echo -e "\033[32mWarning:The user must login to \"WWW\".\033[0m\n"
        echo -e "ls or ll      Make a list of all.\nc or clear    Clear screen\nq or exit     Exit the program\nh or help     Help options"
        exit 0
elif [ "$1" == "" ];then
        :
else 
        echo "Please use --help."
        exit
fi

#定义运行用户
WHO=`whoami`

if [ "$WHO" != 'www' ]; then
    	echo -e " Must be logged on as \"\033[32mwww\033[0m\" to run this script.!"
        echo "Exit"
        exit 1
fi

#列出servers清单
list=$(echo -e "\033[32m1  ha-01 \n2  ha-02\n3  fe-01\n4  fe-02\n5  third-01\n6  third-02\n7  xmj-01\n8  xmj-02\n9  xmp-01\n10 xmp-02\n11 webapi-01\n12 webapi-02\n13 mysql-master\n14 mysql-slave\n15 mongodb\n16 mongodb-slave\n17 redis\n18 redis-slave\n19 ta-01\n20 ta-02\n21 前端后台任务\n22 日志查询\n23 alpha\n24 beta \033[0m")

#while循环定义错误次数5，超出退出程序，内嵌循环定义错误输入与换行
count=1

while (( $count<6 ))
	do

    type=true    

    while $type
        do
		read -p "fort>" number

	if [ "$number" == 1 ];then
            /home/fort/ha-01
	   elif [ "$number" == 2 ];then
 	           /home/fort/ha-02
	   elif [ "$number" == 3 ];then
	     	   /home/fort/fe-01
	   elif [ "$number" == 4 ];then
        	   /home/fort/fe-02
	   elif [ "$number" == 5 ];then
	            /home/fort/third-01
	   elif [ "$number" == 6 ];then
	            /home/fort/third-02
	   elif [ "$number" == 7 ];then
	            /home/fort/xmj-01
	   elif [ "$number" == 8 ];then
	            /home/fort/xmj-02
	   elif [ "$number" == 9 ];then
	            /home/fort/xmp-01
	   elif [ "$number" == 10 ];then
	            /home/fort/xmp-02
	   elif [ "$number" == 11 ];then
	            /home/fort/webapi-01
	   elif [ "$number" == 12 ];then
	            /home/fort/webapi-02
       elif [ "$number" == 13 ];then
                /home/fort/mysql
       elif [ "$number" == 14 ];then
                /home/fort/mysql-slave
       elif [ "$number" == 15 ];then
                /home/fort/mongodb-slave
       elif [ "$number" == 16 ];then
                /home/fort/mongodb
       elif [ "$number" == 17 ];then
                /home/fort/redis
       elif [ "$number" == 18 ];then
                /home/fort/redis-slave
       elif [ "$number" == 19 ];then
                /home/fort/ta-01
       elif [ "$number" == 20 ];then
                /home/fort/ta-02
       elif [ "$number" == 21 ];then
                /home/fort/fe-crond
       elif [ "$number" == 22 ];then
                /home/fort/data-infobright
       elif [ "$number" == 23 ];then
                /home/fort/alpha
       elif [ "$number" == 24 ];then
                /home/fort/beta
	   elif [ "$number" == c ] || [ "$number" == clear ] ;then
	            clear
	   elif [ "$number" == h ] || [ "$number" == help ] ;then
	           echo
		       echo -e "ls or ll      Make a list of all.\nc or clear    Clear screen\nq or exit     Exit the program\nh or help     Help options"
	           echo
	   elif [ "$number" == ls ] || [ "$number" == ll ];then
	           echo
	           echo  "$list" 
	           echo 
	   elif [ "$number" == "exit" ] || [ "$number" == "q" ];then
	           exit
       elif [ "$number" == "" ];then
                :
	   else 
	           echo " Input error:To learn more, please use \"help\""
               type=false
	fi
        done
count="$(($count+1))"
done
echo
echo "Input error more than 5 times,exit!!"
echo

