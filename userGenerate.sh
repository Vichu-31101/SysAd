#!/bin/bash

#User Generation

useradd -s /bin/bash -m AirForceChief
useradd -s /bin/bash -m NavyMarshal
useradd -s /bin/bash -m ArmyGeneral
useradd -s /bin/bash -G AirForceChief,NavyMarshal,ArmyGeneral -m ChiefCommander

groupadd Troops

i=50
while [ $i -gt 0 ]
do
  sudo useradd -s /bin/bash -m AirForce$i
  sudo useradd -s /bin/bash -m Navy$i
  sudo useradd -s /bin/bash -m Army$i
  usermod -a -G AirForce$i,Navy$i,Army$i ChiefCommander
  usermod -a -G AirForce$i AirForceChief
  usermod -a -G Navy$i NavyMarshal
  usermod -a -G Army$i ArmyGeneral
  ((i--)) 
done

