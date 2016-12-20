#!/bin/bash

##--Color
export black='\033[0m'
export boldgreen='\033[1;32m'
export boldred='\033[1;31m'

cecho () {
local default_msg="No message passed."
message=${1:-$default_msg}
color=${2:-black}  
case $color in
        red)
                 printf "$boldred" ;;
        green)
                 printf "$boldgreen" ;;
esac
printf "%s\n"  "$message"
tput sgr0                     
printf "$black"

return
}

MESSAGE() {
if [ $? = 0 ];then
        cecho "$1:lived" green
else
        cecho "$1:dead"  red
fi
}

for i in `cat host.txt` 
do
         ping -c 5 $i -f -w 3 >>/dev/null
         MESSAGE $i
done