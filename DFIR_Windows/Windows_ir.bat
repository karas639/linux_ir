@echo off
REM This is a Live Response Script for DU.Kim
REM You must input your name and Date and Time.
REM Syntax for Date is yy/mm/dd
REM Syntax for Time is hh:mm:ss

echo *********** Start Live Response ***********
echo Live Responder is %1
echo Current Date and Time are %2 %3

echo ********************************************************************
echo [System information Collect]
date /t & time /t
wmic os get installdate,serialnumber,currenttimezone,localdatetime
wmic useraccount
./psinfo64.exe -d -s -h

./pslist64.exe
./pslist64.exe -t
./pslist64.exe -x

./listdll.exe

./handle.exe

./psservice.exe /accepteula

./logonsessions.exe -p

tasklist /v
tasklist /svc

echo ---- schdule -----
schtasks.exe

echo ********************************************************************
echo [Network Infomation Collect]
echo ---- Netstat -----
data /t & time /t
netstat -anob

echo ---- Network Port -----
./tcpvcon.exe -a

echo ---- Network Interface -----
ipconfig /all
getmac

echo ---- Routing table -----
netstat -nr

echo ---- Arp Cache -----
arp -a

echo ---- Dns Cache -----
ipconfig /displaydns

echo ---- Network Drive -----
net use

echo ---- Netbios name and cache -----
nbtstat -c



echo [Memory dump]
