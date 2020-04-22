#!/bin/bash

#User Permission

chmod g-wxr,o-wxr /home/ChiefCommander
chmod g+wxr,o-wxr /home/AirForceChief
chmod g+wxr,o-wxr /home/NavyMarshal
chmod g+wxr,o-wxr /home/ArmyGeneral


i=50
while [ $i -gt 0 ]
do
  chmod g+wxr,o-wxr /home/AirForce$i
  chmod g+wxr,o-wxr /home/Navy$i
  chmod g+wxr,o-wxr /home/Army$i
  ((i--)) 
done




