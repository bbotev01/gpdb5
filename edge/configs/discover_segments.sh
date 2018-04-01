#!/bin/bash

export NAME=segment

echo $(hostname) > /tmp/gpdb-hosts

for S in `seq 1 9`
do
 echo ${NAME}_${S}
 ping -c 1 ${NAME}_${S}
 if [[ $? == 0 ]]; then
  echo "Adding ${NAME}_${S}"
  echo ${NAME}_${S} >> /tmp/gpdb-hosts
 else
  echo "."
 fi
done

exit 0
#
# Not needed any longer with --scale option in compose 1.13
#
for SS in `seq 1 4`
do
 for S in `seq 1 4`
 do 
  ping -c 1 ${NAME}${SS}_${S}
  if [[ $? == 0 ]]; then
   echo "Adding ${NAME}${SS}_${S}"
   echo ${NAME}${SS}_${S} >> /tmp/gpdb-hosts
  else
   echo "."
  fi
 done
done
