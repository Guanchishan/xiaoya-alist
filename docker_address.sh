#!/bin/bash

Green="\033[32m"
Red="\033[31m"
Yellow='\033[33m'
Font="\033[0m"
INFO="[${Green}INFO${Font}]"
ERROR="[${Red}ERROR${Font}]"
WARN="[${Yellow}WARN${Font}]"
function INFO() {
echo -e "${INFO} ${1}"
}
function ERROR() {
echo -e "${ERROR} ${1}"
}
function WARN() {
echo -e "${WARN} ${1}"
}

cd /meida/xiaoya

INFO "执行替换DOCKER_ADDRESS............"
start_time2=`date +%s`
find ./ -name "*.strm" -exec sed \-i "s#DOCKER_ADDRESS#$docker_addr#g; s# #%20#g; s#|#%7C#g" {} \;
fdfind --extension strm --exec sed \-i "s#DOCKER_ADDRESS#$docker_addr#g; s# #%20#g; s#|#%7C#g" {} \;
chmod -R 777 *	
end_time2=`date +%s`
total_time2=$((end_time2 - start_time2))
total_time2=$((total_time2 / 60))
INFO "替换执行时间：$total_time2 分钟"