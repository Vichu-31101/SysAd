#!/bin/bash

#AutoSchedule

cDate=$(date +"%Y-%m-%d")

dir=$(pwd)

FILE="/home/AirForce1/post_allotted.txt"
if [ ! -f $FILE ]; then
         (crontab -l 2>/dev/null || true; echo "0 0 * * * $dir/autoSchedule.sh") | crontab -
      fi

i=50
while [ $i -gt 0 ]
do
  touch /home/AirForce$i/post_allotted.txt
  touch /home/Navy$i/post_allotted.txt
  touch /home/Army$i/post_allotted.txt

  echo "Date  Post" > /home/AirForce$i/post_allotted.txt
  echo "Date  Post" > /home/Navy$i/post_allotted.txt
  echo "Date  Post" > /home/Army$i/post_allotted.txt

  User_Air="AirForce$i"
  User_Navy="Navy$i"
  User_Army="Army$i"

  grep -w $User_Air /var/log/position.log | grep -w $cDate | sed -e 's/\-00.00.00//g ; s/$User_Air//g ' >> /home/AirForce$i/post_allotted.txt
  grep -w $User_Navy /var/log/position.log | grep -w $cDate | sed -e 's/\-00.00.00//g ; s/$User_Navy//g ' >> /home/Navy$i/post_allotted.txt
  grep -w $User_Army /var/log/position.log | grep -w $cDate | sed -e 's/\-00.00.00//g ; s/$User_Army//g ' >> /home/Army$i/post_allotted.txt
 
 ((i--))
done


