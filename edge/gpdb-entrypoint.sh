#!/bin/bash 

source /usr/local/gpdb/greenplum_path.sh

#
# Trap signals here for graceful shutdown
#
function cleanup {
gpstop -a
#sudo service sshd stop
exit
}

trap cleanup SIGTERM SIGINT SIGHUP


#
# Start SSH first
#
#sudo service sshd start
sudo /usr/bin/ssh-keygen -A
sudo /usr/sbin/sshd &

#
# Initialize instance the first time we start
#
if [ ! -s "$MASTER_DATA_DIRECTORY" ]; then

export MASTER_HOSTNAME=$(hostname)

/usr/local/bin/discover_segments.sh
gpssh-exkeys -f /tmp/gpdb-hosts
gpinitsystem -a -c  /tmp/gpinitsystem.conf -h /tmp/gpdb-hosts
psql -d template1 -c "alter user gpadmin password 'greenplum'"
createdb gpadmin
gpstop -a
echo "host all all 0.0.0.0/0 md5" >> $MASTER_DATA_DIRECTORY/pg_hba.conf
fi


#
# Start instance
#
gpstart -a
while true; do
  sleep 3600 
done


