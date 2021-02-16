#!/bin/sh

DAY=$(date +%Y-%m-%d)

echo "시스템 주요 정보 수집"
echo "############# Server IP #############" > sys_$DAY.txt
#ifconfig | head -2 | tail -1 |awk -F: '{print $2}' |awk '{print $1}' >> sys_$DAY.txt
IP=`ifconfig | head -2 | tail -1 |awk -F: '{print $2}' |awk '{print $1}'`
echo $IP >> sys_$DAY.txt
echo >> sys_$DAY.txt


echo "############# Date Check #############" >> sys_$DAY.txt
date +%Y%m%d%H%M >> sys_$DAY.txt
echo >> sys_$DAY.txt


echo "############# System Information Check #############" >> sys_$DAY.txt
uname -a >> sys_$DAY.txt
echo >> sys_$DAY.txt


echo "############# UPTIME Check #############" >> sys_$DAY.txt
uptime >> sys_$DAY.txt
echo >> sys_$DAY.txt


echo "############# CONSOLE LOGIN Check #############" >> sys_$DAY.txt
last console >> sys_$DAY.txt
echo >> sys_$DAY.txt


echo "############# ROOT LOGIN Check #############" >> sys_$DAY.txt
last root >> sys_$DAY.txt
echo >> sys_$DAY.txt


echo "############# ADMIN LOGIN RECENT 5 TIMES Check #############" >> sys_$DAY.txt
last admin -5 >> sys_$DAY.txt
echo >> sys_$DAY.txt


echo "############# LAST REBOOT LOG Check #############" >> sys_$DAY.txt
last reboot >> sys_$DAY.txt
echo >> sys_$DAY.txt


echo "############# File System Table Check #############" >> sys_$DAY.txt
cat /etc/fstab >> sys_$DAY.txt
echo >> sys_$DAY.txt


echo "############# monut Check #############" >> sys_$DAY.txt
mount >> sys_$DAY.txt
echo >> sys_$DAY.txt

echo "############# partition Check #############" >> sys_$DAY.txt
df -Th >> sys_$DAY.txt
echo >> sys_$DAY.txt
fdisk -l >> sys_$DAY.txt
echo >> sys_$DAY.txt
blkid >> sys_$DAY.txt
echo >> sys_$DAY.txt


echo "############# passwd line Check #############">> sys_$DAY.txt
wc -l /etc/passwd >> sys_$DAY.txt
echo >> sys_$DAY.txt


echo "############# passwd Check #############" >> sys_$DAY.txt
cat /etc/passwd >> sys_$DAY.txt
echo >> sys_$DAY.txt


echo "############# passwd 0 Check #############" >> sys_$DAY.txt
grep ':0:'  /etc/passwd >> sys_$DAY.txt
echo >> sys_$DAY.txt

echo "############# shadow file Check #############" >> sys_$DAY.txt
cat /etc/shadow >> sys_$DAY.txt
echo >> sys_$DAY.txt

echo "############# crontab Check #############" >> sys_$DAY.txt
cat /etc/crontab >> sys_$DAY.txt
echo >> sys_$DAY.txt
crontab -l >> sys_$DAY.txt
echo >> sys_$DAY.txt


echo "############# cron log Check #############" >> sys_$DAY.txt
tail -n10  /var/log/cron >> sys_$DAY.txt
echo >> sys_$DAY.txt


echo "############# user Check #############" >> sys_$DAY.txt
w >> sys_$DAY.txt
echo >> sys_$DAY.txt
who -a >> sys_$DAY.txt
who -b >> sys_$DAY.txt
echo >> sys_$DAY.txt

echo "############# last Check #############" >> sys_$DAY.txt
last | head -n 20 >> sys_$DAY.txt
echo >> sys_$DAY.txt
lastb >> sys_$DAY.txt
echo >> sys_$DAY.txt
lastlog >> sys_$DAY.txt
echo >> sys_$DAY.txt

echo "############# Open Port Check #############" >> sys_$DAY.txt
netstat -anop | grep LISTEN >> sys_$DAY.txt
echo >> sys_$DAY.txt

echo "############# Network Infomation Check #############" >> sys_$DAY.txt
nic=`ifconfig | head -1 | awk -F: '{print $1}'`
arp -a
echo >> sys_$DAY.txt
tcpdump -i $nic 
echo >> sys_$DAY.txt
cat /etc/hosts
echo >> sys_$DAY.txt
cat /etc/sysconfig/network
echo >> sys_$DAY.txt

echo "############# Server IP Configure Check #############" >> sys_$DAY.txt
ifconfig >> sys_$DAY.txt
echo >> sys_$DAY.txt

echo "############# pstree Check #############" >> sys_$DAY.txt
pstree >> sys_$DAY.txt
echo >> sys_$DAY.txt
ps -ef >> sys_$DAY.txt
echo >> sys_$DAY.txt
vmstat >> sys_$DAY.txt
echo >> sys_$DAY.txt
lsmod >> sys_$DAY.txt
echo >> sys_$DAY.txt
sar -r >> sys_$DAY.txt
echo >> sys_$DAY.txt
top -n1 >> sys_$DAY.txt

echo "############# cpu Check #############">> sys_$DAY.txt
cpu_usage=`top -b -n 1 | grep Cpu | awk '{print $8}' | awk '{print 100-$1" %"}'`
echo "CPU Usage :$cpu_usage"
echo >> sys_$DAY.txt

echo "############# memory Check #############">> sys_$DAY.txt
free -m >> sys_$DAY.txt
echo >> sys_$DAY.txt

echo "############# lsof Check #############" >> sys_$DAY.txt
lsof -i >> sys_$DAY.txt
echo >> sys_$DAY.txt


echo "############# message error Check #############" >> sys_$DAY.txt
grep Error /var/log/messages >> sys_$DAY.txt
echo >> sys_$DAY.txt
echo "############# /tmp Check #############" >> sys_$DAY.txt
ls -la /tmp >> sys_$DAY.txt
echo >> sys_$DAY.txt

echo "############# package infomation Check #############" >> sys_$DAY.txt
confdir="/bin/rpm /usr/bin/rpm /usr/bin/apt-get"
for file in $confdir
do
	if [ -f $file ]; then
		if [ `ls -l $file | grep -o rpm | wc -l` -gt 0 ]; then
			rpm -qa | sort >> sys_$DAY.txt 2>&1
		else
			dpkg -l >> sys_$DAY.txt 2>&1
		fi
	fi
done
echo >> sys_$DAY.txt

#mail -s "$IP  report@ksidc.net < ./sys_$DAY.txt

echo "############# mac time infomation Check #############" >> sys_$DAY.txt
find / -ctime -1 -type f >> sys_$DAY.txt
echo >> sys_$DAY.txt

echo "############# log infomation Check #############" >> sys_$DAY.txt
history >> sys_$DAY.txt
echo >> sys_$DAY.txt
echo "/var/log archive" >> sys_$DAY.txt
tar cvf ./var_log.tar.gz /var/log/
echo >> sys_$DAY.txt

echo "############# .exe file or hide file check #############" >> sys_$DAY.txt
find / -type f -perm +111 -ls >> sys_$DAY.txt
find / -type f -perm +6000 -ls >> sys_$DAY.txt
find /dev -type f >> sys_$DAY.txt
find / -type f \(-perm -4000 -o -perm -2000 \) -exec ls -al {} \; >> sys_$DAY.txt
echo >> sys_$DAY.txt

echo "############# abnormal service check #############" >> sys_$DAY.txt
chkconfig --list
echo >> sys_$DAY.txt

echo "############# archive delete file #############" >> sys_$DAY.txt
echo debugfs
