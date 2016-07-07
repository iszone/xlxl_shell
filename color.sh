#!/bin/bash
#########################################################################

export black='\033[0m'
export boldblack='\033[1;0m'
export red='\033[31m'
export boldred='\033[1;31m'
export green='\033[32m'
export boldgreen='\033[1;32m'
export yellow='\033[33m'
export boldyellow='\033[1;33m'
export blue='\033[34m'
export boldblue='\033[1;34m'
export magenta='\033[35m'
export boldmagenta='\033[1;35m'
export cyan='\033[36m'
export boldcyan='\033[1;36m'
export white='\033[37m'
export boldwhite='\033[1;37m'


cecho ()

## -- Function to easliy print colored text -- ##

        # Color-echo.
        # Argument $1 = message
        # Argument $2 = color
{
local default_msg="No message passed."

message=${1:-$default_msg}      # Defaults to default message.

#change it for fun
#We use pure names
color=${2:-black}               # Defaults to black, if not specified.

case $color in
        black)
                 printf "$black" ;;
        boldblack)
                 printf "$boldblack" ;;
        red)
                 printf "$red" ;;
        boldred)
                 printf "$boldred" ;;
        green)
                 printf "$green" ;;
        boldgreen)
                 printf "$boldgreen" ;;
        yellow)
                 printf "$yellow" ;;
        boldyellow)
                 printf "$boldyellow" ;;
        blue)
                 printf "$blue" ;;
        boldblue)
                 printf "$boldblue" ;;
        magenta)
                 printf "$magenta" ;;
        boldmagenta)
                 printf "$boldmagenta" ;;
        cyan)
                 printf "$cyan" ;;
        boldcyan)
                 printf "$boldcyan" ;;
        white)
                 printf "$white" ;;
        boldwhite)
                 printf "$boldwhite" ;;
esac
  printf "%s\n"  "$message"
  tput sgr0                     # Reset to normal.
  printf "$black"

return
}

cecho black black
cecho boldblack boldblack
cecho red red
cecho boldred boldred
cecho green green
cecho boldgreen boldgreen
cecho yellow yellow
cecho boldyellow boldyellow
cecho blue blue
cecho boldblue boldblue
cecho magenta magenta
cecho boldmagenta boldmagenta
cecho cyan cyan
cecho boldcyan boldcyan
cecho white white
cecho boldwhite boldwhite

