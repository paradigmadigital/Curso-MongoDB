#bin/bash
#Create path for Replica Set
mkdir -p /data/RS1_1
mkdir -p /data/RS1_2
mkdir -p /data/RS1_3

#Start shard servers
mongod --replSet RS1 --dbpath /data/RS1_1 --port 27017 --noprealloc --nojournal &
mongod --replSet RS1 --dbpath /data/RS1_2 --port 27018 --noprealloc --nojournal &
mongod --replSet RS1 --dbpath /data/RS1_3 --port 27019 --noprealloc --nojournal &

#initiate replica set for each shard
sleep 2
mongo --shell createRS1.js &
#Populate replication database
mongo --shell populateDB.js
