#!/bin/bash

#Attendance

cDate=$(date +"%Y-%m-%d")

dir=$(pwd)

FILE="/home/AirForceChief/attendance_record.txt"
  if [ ! -f $FILE ]; then
           (crontab -l 2>/dev/null || true; echo "0 6 * * * $dir/attendance.sh") | crontab -
        fi

touch /home/AirForceChief/attendance_record.txt
touch /home/NavyMarshal/attendance_record.txt
touch /home/ArmyGeneral/attendance_record.txt

echo "Present $cDate" > /home/AirForceChief/attendance_record.txt
echo "Present $cDate" > /home/NavyMarshal/attendance_record.txt
echo "Present $cDate" > /home/ArmyGeneral/attendance_record.txt


grep -i 'AirForce' /var/log/attendance.log | grep -w $cDate| grep -w 'YES' | sed -e "s/\-06.00.00//g ; s/YES//g ; s/\+$cDate//g" >> /home/AirForceChief/attendance_record.txt
grep -i 'Navy' $dir/var/log/attendance.log | grep -w $cDate| grep -w 'YES' | sed -e "s/\-06.00.00//g ; s/YES//g ; s/\+$cDate//g" >> /home/NavyMarshal/attendance_record.txt
grep -i 'Army' $dir/var/log/attendance.log | grep -w $cDate| grep -w 'YES' | sed -e "s/\-06.00.00//g ; s/YES//g ; s/\+$cDate//g" >> /home/ArmyGeneral/attendance_record.txt



