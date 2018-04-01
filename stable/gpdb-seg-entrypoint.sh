#!/bin/bash 

#
# Trap signals here for graceful shutdown
#
function cleanup {
#sudo service sshd stop
exit
}

trap cleanup SIGTERM SIGINT SIGHUP


#
# Start SSH irst
#
#sudo service sshd start
sudo /usr/bin/ssh-keygen -A
sudo /usr/sbin/sshd &

while true; do
  sleep 3600 
done


