#!/bin/bash

#Attendance

Date=$(date +"%Y-%m-%d")
dir=$(pwd)

FILE="/home/ChiefCommander/attendance_report"
  if [ ! -f $FILE ]; then
           mkdir /home/ChiefCommander/attendance_report
           (crontab -l 2>/dev/null || true; echo "0 0 * * * $dir/finalAttendance.sh") | crontab -
        fi
touch /home/ChiefCommander/attendance_report/$Date.txt

echo "$Date" >> /home/ChiefCommander/attendance_report/$Date.txt
echo " " >> /home/ChiefCommander/attendance_report/$Date.txt

echo "AirForce" >> /home/ChiefCommander/attendance_report/$Date.txt
echo "Present" >> /home/ChiefCommander/attendance_report/$Date.txt
grep -i 'AirForce' /var/log/attendance.log | grep -w $Date| grep -w 'YES' | sed -e "s/\-06.00.00//g ; s/YES//g ; s/\+$Date//g" >> /home/ChiefCommander/attendance_report/$Date.txt
echo "Absent" >> /home/ChiefCommander/attendance_report/$Date.txt
grep  -i 'AirForce' /var/log/attendance.log | grep -w $Date| grep -w 'NO' | sed -e "s/\-06.00.00//g ; s/NO//g ; s/\+$Date//g" >> /home/ChiefCommander/attendance_report/$Date.txt
echo " " >> /home/ChiefCommander/attendance_report/$Date.txt

echo "Army"  >> /home/ChiefCommander/attendance_report/$Date.txt
echo "Present" >> /home/ChiefCommander/attendance_report/$Date.txt
grep -i 'Army' /var/log/attendance.log | grep -w $Date| grep -w 'YES' | sed -e "s/\-06.00.00//g ; s/YES//g ; s/\+$Date//g" >> /home/ChiefCommander/attendance_report/$Date.txt
echo "Absent" >> /home/ChiefCommander/attendance_report/$Date.txt
grep  -i 'Army' /var/log/attendance.log | grep -w $Date| grep -w 'NO' | sed -e "s/\-06.00.00//g ; s/NO//g ; s/\+$Date//g" >> /home/ChiefCommander/attendance_report/$Date.txt
echo " " >> /home/ChiefCommander/attendance_report/$Date.txt

echo "Navy" >> /home/ChiefCommander/attendance_report/$Date.txt
echo "Present" >> /home/ChiefCommander/attendance_report/$Date.txt
grep -i 'Navy' /var/log/attendance.log | grep -w $Date| grep -w 'YES' | sed -e "s/\-06.00.00//g ; s/YES//g ; s/\+$Date//g" >> /home/ChiefCommander/attendance_report/$Date.txt
echo "Absent" >> /home/ChiefCommander/attendance_report/$Date.txt
grep  -i 'Navy' /var/log/attendance.log | grep -w $Date| grep -w 'NO' | sed -e "s/\-06.00.00//g ; s/NO//g ; s/\+$Date//g" >> /home/ChiefCommander/attendance_report/$Date.txt 
