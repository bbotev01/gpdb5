# What is it? 
  
Traditionally setting up a Greenplum cluster requires provisioning physical or virtual servers, setting kernel parameters, exchanging SSH keys, installing and configuring the software. All that assuming we have successfully compiled the source code. This project gets your Greenplum cluster up and running in a single command using Docker containers. All examples of Greenplum in a Docker container I have seen use the same container for the master and segments. This project implements a full fledged cluster using separate self-discovering Docker containers. The segments can be scaled at cluster creation to produce the desired size cluster. This allows deployment of the cluster not only on a single machine but possibly on Docker Swarm as well.  

## How to build
```sh
cd gpdb5/stable
docker build -t gpdb5_centos7 .
```
or if you prefer to build from the latest and greatest sources:
```sh
cd gpdb5/edge
docker build -t gpdb5_centos7 .
```
## How to run
```sh
cd gpdb5
docker-compose up
```
By default the above command will start one master and one segment. If you would like to start more than one segment nodes (let's say 4 for example) use the scale command for the number of segments:
```sh
docker-compose up --scale segment=4
```


#### Example:
```
[root@c3cudocker99 gpdb5]# docker-compose up
Creating network "gpdb5_default" with the default driver
Creating volume "gpdb5_pgdata" with default driver
Creating gpdb5_segment_1 ...
Creating gpdb5_segment_1 ... done
Creating gpdb5_master_1 ...
Creating gpdb5_master_1 ... done
Attaching to gpdb5_segment_1, gpdb5_master_1
segment_1  | ssh-keygen: generating new host keys: RSA1 RSA DSA ECDSA ED25519
master_1   | ssh-keygen: generating new host keys: RSA1 RSA DSA ECDSA ED25519
master_1   | segment_1
master_1   | PING segment_1 (172.21.0.2) 56(84) bytes of data.
master_1   | 64 bytes from gpdb5_segment_1.gpdb5_default (172.21.0.2): icmp_seq=1 ttl=64 time=0.099 ms
master_1   |
master_1   | --- segment_1 ping statistics ---
master_1   | 1 packets transmitted, 1 received, 0% packet loss, time 0ms
master_1   | rtt min/avg/max/mdev = 0.099/0.099/0.099/0.000 ms
master_1   | Adding segment_1
master_1   | segment_2
master_1   | ping: segment_2: Name or service not known
master_1   | .
master_1   | segment_3
master_1   | ping: segment_3: Name or service not known
master_1   | .
master_1   | segment_4
master_1   | ping: segment_4: Name or service not known
master_1   | .
master_1   | [STEP 1 of 5] create local ID and authorize on local host
master_1   |   ... /home/gpadmin/.ssh/id_rsa file exists ... key generation skipped
master_1   |
master_1   | [STEP 2 of 5] keyscan all hosts and update known_hosts file
master_1   |
master_1   | [STEP 3 of 5] authorize current user on remote hosts
master_1   |   ... send to segment_1
master_1   |
master_1   | [STEP 4 of 5] determine common authentication file content
master_1   |
master_1   | [STEP 5 of 5] copy authentication files to all remote hosts
master_1   |   ... finished key exchange with segment_1
master_1   |
master_1   | [INFO] completed successfully
master_1   | 20180308:18:46:18:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Environment variable $USER unset, will set to gpadmin
master_1   | 20180308:18:46:18:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Checking configuration parameters, please wait...
master_1   | 20180308:18:46:18:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Reading Greenplum configuration file /tmp/gpinitsystem_singlenode
master_1   | 20180308:18:46:18:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Locale has not been set in /tmp/gpinitsystem_singlenode, will set to default value
master_1   | 20180308:18:46:18:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Locale set to en_US.utf8
master_1   | 20180308:18:46:18:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-No DATABASE_NAME set, will exit following template1 updates
master_1   | 20180308:18:46:18:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-MASTER_MAX_CONNECT not set, will set to default value 250
master_1   | 20180308:18:46:18:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Checking configuration parameters, Completed
master_1   | 20180308:18:46:18:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Commencing multi-home checks, please wait...
master_1   | ..
master_1   | 20180308:18:46:19:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Configuring build for standard array
master_1   | 20180308:18:46:19:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Commencing multi-home checks, Completed
master_1   | 20180308:18:46:19:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Building primary segment instance array, please wait...
master_1   | ....
master_1   | 20180308:18:46:20:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Checking Master host
master_1   | 20180308:18:46:20:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Checking new segment hosts, please wait...
master_1   | ....
master_1   | 20180308:18:46:24:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Checking new segment hosts, Completed
master_1   | 20180308:18:46:24:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Building the Master instance database, please wait...
master_1   | 20180308:18:46:30:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Starting the Master in admin mode
master_1   | 20180308:18:46:36:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Commencing parallel build of primary segment instances
master_1   | 20180308:18:46:36:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Spawning parallel processes    batch [1], please wait...
master_1   | ....
master_1   | 20180308:18:46:36:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Waiting for parallel processes batch [1], please wait...
master_1   | ......................
master_1   | 20180308:18:46:59:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:------------------------------------------------
master_1   | 20180308:18:46:59:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Parallel process exit status
master_1   | 20180308:18:46:59:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:------------------------------------------------
master_1   | 20180308:18:46:59:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Total processes marked as completed           = 4
master_1   | 20180308:18:46:59:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Total processes marked as killed              = 0
master_1   | 20180308:18:46:59:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Total processes marked as failed              = 0
master_1   | 20180308:18:46:59:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:------------------------------------------------
master_1   | 20180308:18:46:59:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Deleting distributed backout files
master_1   | 20180308:18:46:59:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Removing back out file
master_1   | 20180308:18:46:59:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-No errors generated from parallel processes
master_1   | 20180308:18:46:59:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Restarting the Greenplum instance in production mode
master_1   | 20180308:18:46:59:003827 gpstop:25d170bf2d85:gpadmin-[INFO]:-Starting gpstop with args: -a -l /home/gpadmin/gpAdminLogs -i -m -d /gpdata/master/gpseg-1
master_1   | 20180308:18:46:59:003827 gpstop:25d170bf2d85:gpadmin-[INFO]:-Gathering information and validating the environment...
master_1   | 20180308:18:46:59:003827 gpstop:25d170bf2d85:gpadmin-[INFO]:-Obtaining Greenplum Master catalog information
master_1   | 20180308:18:46:59:003827 gpstop:25d170bf2d85:gpadmin-[INFO]:-Obtaining Segment details from master...
master_1   | 20180308:18:47:00:003827 gpstop:25d170bf2d85:gpadmin-[INFO]:-Greenplum Version: 'postgres (Greenplum Database) 5.5.0 build dev'
master_1   | 20180308:18:47:00:003827 gpstop:25d170bf2d85:gpadmin-[INFO]:-There are 0 connections to the database
master_1   | 20180308:18:47:00:003827 gpstop:25d170bf2d85:gpadmin-[INFO]:-Commencing Master instance shutdown with mode='immediate'
master_1   | 20180308:18:47:00:003827 gpstop:25d170bf2d85:gpadmin-[INFO]:-Master host=25d170bf2d85
master_1   | 20180308:18:47:00:003827 gpstop:25d170bf2d85:gpadmin-[INFO]:-Commencing Master instance shutdown with mode=immediate
master_1   | 20180308:18:47:00:003827 gpstop:25d170bf2d85:gpadmin-[INFO]:-Master segment instance directory=/gpdata/master/gpseg-1
master_1   | 20180308:18:47:01:003827 gpstop:25d170bf2d85:gpadmin-[INFO]:-Attempting forceful termination of any leftover master process
master_1   | 20180308:18:47:01:003827 gpstop:25d170bf2d85:gpadmin-[INFO]:-Terminating processes for segment /gpdata/master/gpseg-1
master_1   | 20180308:18:47:02:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Starting gpstart with args: -a -l /home/gpadmin/gpAdminLogs -d /gpdata/master/gpseg-1
master_1   | 20180308:18:47:02:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Gathering information and validating the environment...
master_1   | 20180308:18:47:02:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Greenplum Binary Version: 'postgres (Greenplum Database) 5.5.0 build dev'
master_1   | 20180308:18:47:02:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Greenplum Catalog Version: '301705051'
master_1   | 20180308:18:47:03:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Starting Master instance in admin mode
master_1   | 20180308:18:47:04:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Obtaining Greenplum Master catalog information
master_1   | 20180308:18:47:04:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Obtaining Segment details from master...
master_1   | 20180308:18:47:04:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Setting new master era
master_1   | 20180308:18:47:04:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Master Started...
master_1   | 20180308:18:47:05:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Heap checksum setting is consistent across the cluster
master_1   | 20180308:18:47:05:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Shutting down master
master_1   | 20180308:18:47:09:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Commencing parallel segment instance startup, please wait...
master_1   | ...
master_1   | 20180308:18:47:12:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Process results...
master_1   | 20180308:18:47:12:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-----------------------------------------------------
master_1   | 20180308:18:47:12:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-   Successful segment starts                                            = 4
master_1   | 20180308:18:47:12:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-   Failed segment starts                                                = 0
master_1   | 20180308:18:47:12:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-   Skipped segment starts (segments are marked down in configuration)   = 0
master_1   | 20180308:18:47:12:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-----------------------------------------------------
master_1   | 20180308:18:47:12:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Successfully started 4 of 4 segment instances
master_1   | 20180308:18:47:12:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-----------------------------------------------------
master_1   | 20180308:18:47:12:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Starting Master instance 25d170bf2d85 directory /gpdata/master/gpseg-1
master_1   | 20180308:18:47:13:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Command pg_ctl reports Master 25d170bf2d85 instance active
master_1   | 20180308:18:47:13:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-No standby master configured.  skipping...
master_1   | 20180308:18:47:13:003855 gpstart:25d170bf2d85:gpadmin-[INFO]:-Database successfully started
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Completed restart of Greenplum instance in production mode
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Scanning utility log file for any warning messages
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Log file scan check passed
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Greenplum Database instance successfully created
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-------------------------------------------------------
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-To complete the environment configuration, please
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-update gpadmin .bashrc file with the following
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-1. Ensure that the greenplum_path.sh file is sourced
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-2. Add "export MASTER_DATA_DIRECTORY=/gpdata/master/gpseg-1"
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-   to access the Greenplum scripts for this instance:
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-   or, use -d /gpdata/master/gpseg-1 option for the Greenplum scripts
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-   Example gpstate -d /gpdata/master/gpseg-1
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Script log file = /home/gpadmin/gpAdminLogs/gpinitsystem_20180308.log
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-To remove instance, run gpdeletesystem utility
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-To initialize a Standby Master Segment for this Greenplum instance
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Review options for gpinitstandby
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-------------------------------------------------------
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-The Master /gpdata/master/gpseg-1/pg_hba.conf post gpinitsystem
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-has been configured to allow all hosts within this new
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-array to intercommunicate. Any hosts external to this
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-new array must be explicitly added to this file
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-Refer to the Greenplum Admin support guide which is
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-located in the /usr/local/gpdb/docs directory
master_1   | 20180308:18:47:13:000057 gpinitsystem:25d170bf2d85:gpadmin-[INFO]:-------------------------------------------------------
master_1   | ALTER ROLE
master_1   | 20180308:18:47:16:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Starting gpstop with args: -a
master_1   | 20180308:18:47:16:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Gathering information and validating the environment...
master_1   | 20180308:18:47:16:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Obtaining Greenplum Master catalog information
master_1   | 20180308:18:47:16:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Obtaining Segment details from master...
master_1   | 20180308:18:47:17:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Greenplum Version: 'postgres (Greenplum Database) 5.5.0 build dev'
master_1   | 20180308:18:47:17:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-There are 0 connections to the database
master_1   | 20180308:18:47:17:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Commencing Master instance shutdown with mode='smart'
master_1   | 20180308:18:47:17:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Master host=25d170bf2d85
master_1   | 20180308:18:47:17:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Commencing Master instance shutdown with mode=smart
master_1   | 20180308:18:47:17:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Master segment instance directory=/gpdata/master/gpseg-1
master_1   | 20180308:18:47:18:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Attempting forceful termination of any leftover master process
master_1   | 20180308:18:47:18:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Terminating processes for segment /gpdata/master/gpseg-1
master_1   | 20180308:18:47:19:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-No standby master host configured
master_1   | 20180308:18:47:19:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Targeting dbid [2, 3, 4, 5] for shutdown
master_1   | 20180308:18:47:19:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Commencing parallel segment instance shutdown, please wait...
master_1   | 20180308:18:47:19:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-0.00% of jobs completed
master_1   | 20180308:18:47:21:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-100.00% of jobs completed
master_1   | 20180308:18:47:21:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-----------------------------------------------------
master_1   | 20180308:18:47:21:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-   Segments stopped successfully      = 4
master_1   | 20180308:18:47:21:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-   Segments with errors during stop   = 0
master_1   | 20180308:18:47:21:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-----------------------------------------------------
master_1   | 20180308:18:47:21:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Successfully shutdown 4 of 4 segment instances
master_1   | 20180308:18:47:21:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Database successfully shutdown with no errors reported
master_1   | 20180308:18:47:21:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Cleaning up leftover gpmmon process
master_1   | 20180308:18:47:21:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-No leftover gpmmon process found
master_1   | 20180308:18:47:21:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Cleaning up leftover gpsmon processes
master_1   | 20180308:18:47:22:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-No leftover gpsmon processes on some hosts. not attempting forceful termination on these hosts
master_1   | 20180308:18:47:22:004147 gpstop:25d170bf2d85:gpadmin-[INFO]:-Cleaning up leftover shared memory
master_1   | 20180308:18:47:23:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Starting gpstart with args: -a
master_1   | 20180308:18:47:23:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Gathering information and validating the environment...
master_1   | 20180308:18:47:23:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Greenplum Binary Version: 'postgres (Greenplum Database) 5.5.0 build dev'
master_1   | 20180308:18:47:23:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Greenplum Catalog Version: '301705051'
master_1   | 20180308:18:47:24:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Starting Master instance in admin mode
master_1   | 20180308:18:47:25:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Obtaining Greenplum Master catalog information
master_1   | 20180308:18:47:25:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Obtaining Segment details from master...
master_1   | 20180308:18:47:25:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Setting new master era
master_1   | 20180308:18:47:25:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Master Started...
master_1   | 20180308:18:47:26:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Heap checksum setting is consistent across the cluster
master_1   | 20180308:18:47:26:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Shutting down master
master_1   | 20180308:18:47:30:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Commencing parallel segment instance startup, please wait...
master_1   | ..
master_1   | 20180308:18:47:32:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Process results...
master_1   | 20180308:18:47:32:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-----------------------------------------------------
master_1   | 20180308:18:47:32:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-   Successful segment starts                                            = 4
master_1   | 20180308:18:47:32:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-   Failed segment starts                                                = 0
master_1   | 20180308:18:47:32:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-   Skipped segment starts (segments are marked down in configuration)   = 0
master_1   | 20180308:18:47:32:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-----------------------------------------------------
master_1   | 20180308:18:47:32:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Successfully started 4 of 4 segment instances
master_1   | 20180308:18:47:32:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-----------------------------------------------------
master_1   | 20180308:18:47:32:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Starting Master instance 25d170bf2d85 directory /gpdata/master/gpseg-1
master_1   | 20180308:18:47:33:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Command pg_ctl reports Master 25d170bf2d85 instance active
master_1   | 20180308:18:47:33:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-No standby master configured.  skipping...
master_1   | 20180308:18:47:33:004316 gpstart:25d170bf2d85:gpadmin-[INFO]:-Database successfully started
```
Now we can connect to the cluster. The default username is __gpadmin__ and the password is __greenplum__.
