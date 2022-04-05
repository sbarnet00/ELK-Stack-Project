#!/bin/bash

#!/bin/bash

#list of passwd, shadow
files=('/etc/passwd' '/etc/shadow')
for file in ${files[@]}
do
  echo "The permission of $file is $(ls -l $file)"
  echo "Action of $file is done"
done

#mkdir ~/research
#find /home -type f -perm 777 >> ~/research/sys_info.txt
#ps aux -m | awk {'print $1,$2,$3,$4,$11'} | head -10 >> ~/research/sys_info.txt
#echo "system script" >> ~/research/sys_info.txt
#date >> ~/research/sys_info.txt
#echo -e "username information: $(uname -a) \n" >> ~/research/sys_info.txt
#echo -e "IP address: $(ip addr | head -9 | tail -1) \n" >> ~/research/sys_info.txt
#echo -e "Host name: $(hostname) \n" >> ~/research/sys_info.txt
#cat /etc/resolv.conf >> ~/research/sys_info.txt
#free >> ~/research/sys_info.txt
#lscpu | grep CPU >> ~/research/sys_info.txt
#df -H | head -4 >> ~/research/sys_info.txt
#echo -e "Logged on users: $(who -a) \n" >> ~/research/sys_info.txt

mkdir ~/research 2> /dev/null
echo "A Quick System Audit Script" > ~/research/sys_info.txt
date >> ~/research/sys_info.txt
echo "" >> ~/research/sys_info.txt
echo "Machine Type Info:" >> ~/research/sys_info.txt
echo $MACHTYPE >> ~/research/sys_info.txt
echo -e "Uname info: $(uname -a) \n" >> ~/research/sys_info.txt
echo -e "IP Info: $(ip addr | grep inet | tail -2 | head -1) \n" >> ~/research/sys_info.txt
echo -e "Hostname: $(hostname -s) \n" >> ~/research/sys_info.txt
echo "DNS Servers: " >> ~/research/sys_info.txt
cat /etc/resolv.conf >> ~/research/sys_info.txt
echo -e "\nMemory Info:" >> ~/research/sys_info.txt
free >> ~/research/sys_info.txt
echo -e "\nCPU Info:" >> ~/research/sys_info.txt
lscpu | grep CPU >> ~/research/sys_info.txt
echo -e "\nDisk Usage:" >> ~/research/sys_info.txt
df -H | head -2 >> ~/research/sys_info.txt
echo -e "\nWho is logged in: \n $(who -a) \n" >> ~/research/sys_info.txt
echo -e "\nSUID Files:" >> ~/research/sys_info.txt
find / -type f -perm /4000 >> ~/research/sys_info.txt
echo -e "\nTop 10 Processes" >> ~/research/sys_info.txt
ps aux -m | awk {'print $1, $2, $3, $4, $11'} | head >> ~/research/sys_info.txt
