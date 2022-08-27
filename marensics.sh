#!/bin/bash

l="forensics/results.txt"
u=$(whoami)

mkdir forensics
touch forensics/results.txt
echo "------------------------------------" > $l
echo "Current user is:" >> $l
whoami >> $l
echo "------------------------------------" >> $l
echo "All users are:" >> $l
compgen -u >> $l
echo "------------------------------------" >> $l
echo "OS info:" >> $l
uname -a >> $l
echo "------------------------------------" >> $l
echo "Network interfaces are:" >> $l
ifconfig -a || ip a >> $l
echo "------------------------------------" >> $l
echo "Running processes:" >> $l
ps -ef >> $l
echo "------------------------------------" >> $l
echo "Processes and ports:" >> $l
netstat -anp >> $l
echo "------------------------------------" >> $l
echo "Open files:" >> $l
lsof -V >> $l
echo "------------------------------------" >> $l
echo "Routing table:" >> $l
netstat -rn; route >> $l
echo "------------------------------------" >> $l
echo "Free space and mounted devices:" >> $l
df; mount >> $l
echo "------------------------------------" >> $l
echo "Meam and swap space:" >> $l
free >> $l
echo "------------------------------------" >> $l
echo "Who is connected:" >> $l
w >> $l
echo "------------------------------------" >> $l
echo "Last logins:" >> $l
last -Faiwx >> $l
echo "------------------------------------" >> $l
echo "Loaded processes:" >> $l
lsmod >> $l
echo "------------------------------------" >> $l
echo "Passwd file" >> $l
cat /etc/passwd >> $l
echo "------------------------------------" >> $l
echo "Shadow file:" >> $l
cat /etc/shadow >> $l
echo "------------------------------------" >> $l
echo "Bash history:" >> $l
cat /home/"$u"/.bash_history >> $l
echo "------------------------------------" >> $l
echo "Zipped log files in /forensics/log.zip file"
zip -r /home/"$u"/forensics/log.zip /var/log
