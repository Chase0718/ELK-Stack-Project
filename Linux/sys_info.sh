#!/bin/bash
#Create directory for output

file="~/research/sys_info.txt"

if [ -d ~/research ]
then
echo "directory exist"
else
	mkdir ~/research
fi

if [ -f ~/research/sys_info.txt ]
then
echo rm ~/research/sys_info.txt
else
echo "file does not exist" 
fi

echo "A Script"
date
echo -e "Uname info: $(uname -a) \n"
echo -e "IP Info: $(ip addr | head -9 | tail -1) \n"
echo "Hostname: $(hostname) \n"
sudo find /home/ -perm 777 -f >> ~/rearch/sys_info.txt
ps aux --sort -%mem | awk '{print $1, $2, $3, $4, $11}' | head >> ~/research/sys_info.txt
