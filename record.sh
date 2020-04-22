#!/bin/bash

#Attendance

tDate=$(date +"%u")
fDate=$(( $tDate - $1 + 7 ))
Line="$fDate days ago"
Date=$(date --date "$Line" +"%Y-%m-%d")
#sed -e "s/\-/\\\-/g" $Date
echo "$Date"

dir=$(pwd)
usr=$(whoami)
usr=${usr:0:3}

grep -i $usr /var/log/attendance.log | grep -w $Date | sed -e "s/\-06.00.00//g ; s/\+$Date//g"

