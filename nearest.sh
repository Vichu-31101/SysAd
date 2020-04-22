#!/bin/bash

#Nearest

#Function
MinDist () {
  line=$1
  N=${line:0:7}
  E=${line:7:14}
  N=$(echo "scale=5; $N / 100000" | bc)
  E=$(echo "scale=5; $E / 100000" | bc)
  sum1=$(echo "scale=5; 28.7041 - $N" | bc)
  if [ $(echo "$sum1 < 0"|bc) -gt 0 ] ; then
   sum1=$(echo "scale=5; $sum1 * -1" | bc)
  fi
  sum2=$(echo "scale=5; 77.1025 - $E" | bc)
  if [ $(echo "$sum2 < 0"|bc) -gt 0 ] ; then
   sum2=$(echo "scale=5; $sum2 * -1" | bc)
  fi
  sum=$(echo "scale=5; $sum2 + $sum1" | bc)
  #echo "$N $E $sum1 $sum2"
  #echo "$sum"
}



Date=$(date +"%Y-%m-%d")
dir=$(pwd)
arr=()
parr=()

FILE="/home/ChiefCommander/nearest10"
  if [ ! -f $FILE ]; then
           mkdir /home/ChiefCommander/nearest10
           (crontab -l 2>/dev/null || true; echo "0 0 * * * $dir/nearest.sh") | crontab -
        fi

iter=1
while read -r line
do
  arr+=($line)
  parr+=($iter)
  ((iter++))
done < <(grep -i 'Army' /var/log/position.log | grep -w $Date | sed -e "s/\-00.00.00//g ; s/\+$Date//g ; s/.*N// ; s/[^0-9]*//g") 

#Sort
for (( i = 0; i < 50 ; i++ ))
do
 for (( j = $i; j < 50-i; j++ ))
 do
  MinDist "${arr[$i]}"
  t1=$sum
  MinDist "${arr[$j]}"
  t2=$sum
  if [ $(echo "$t1 > $t2"|bc) -gt 0 ] ; then
   t=${parr[$i]}
   parr[$i]=${parr[$j]}
   parr[$j]=$t
  fi
 done
done

touch /home/ChiefCommander/nearest10/$Date.txt 
p=10
k=0
while [ $p -gt 0 ]
do
  num=${parr[$k]}
  name="Army$num"
  if ! grep -q -w $name /var/log/attendance.log | grep -w $Date| grep -w 'YES'; then
   grep -w $name /var/log/position.log | grep -w $Date | sed -e "s/\-00.00.00//g ; s/\+$Date//g" >> /home/ChiefCommander/nearest10/$Date.txt 
   ((--p))
  fi
  ((++k))
done

