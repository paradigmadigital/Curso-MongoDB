#/bin/bash
#Create directory for mongos logs
mkdir -p /data/mongos
#Create path for config servers
mkdir -p /data/configdb

#Start Config Server
mongod --configsvr --dbpath /data/configdb --fork --logpath /data/configdb/mongod.log --noprealloc --port 27019 --replSet config &


#Create path for shard servers
mkdir -p /data/shard1
mkdir -p /data/shard2

#Start shard servers
mongod --shardsvr --replSet shard1 --dbpath /data/shard1 --port 27018 --noprealloc --nojournal --fork --logpath /data/shard1/mongod.log &
mongod --shardsvr --replSet shard2 --dbpath /data/shard2 --port 27028 --noprealloc --nojournal --fork --logpath /data/shard2/mongod.log &

#initiate replica set for config server and each shard
sleep 2
mongo --port 27019  createConfig.js &
mongo --port 27018  createRS1.js &
mongo --port 27028  createRS2.js &

#Start mongos
echo "waiting 5 secs to starting config servers and shards after starting mongos"
sleep 5
mongos --configdb config/mongodb:27019 --fork --logpath /data/mongos/mongos.log &


#add shards to shard cluster
sleep 5
mongo < comandosSharding.in
