reate path for config servers
mkdir -p /data/configdb1
mkdir -p /data/configdb2
mkdir -p /data/configdb3

#Start Config Server
mongod --configsvr --dbpath /data/configdb1 --port 27019 &
mongod --configsvr --dbpath /data/configdb2 --port 27029 &
mongod --configsvr --dbpath /data/configdb3 --port 27039 &

#Create path for shard servers
mkdir -p /data/shard1
mkdir -p /data/shard2

#Start shard servers
mongod --shardsvr --replSet RS1 --dbpath /data/shard1 --port 27018 --noprealloc --nojournal &
mongod --shardsvr --replSet RS2 --dbpath /data/shard2 --port 27028 --noprealloc --nojournal &

#initiate replica set for each shard
sleep 2
mongo --port 27018 --shell createRS1.js &
mongo --port 27028 --shell createRS2.js &

#Start mongos
echo "waiting 5 secs to starting config servers after starting mongos"
sleep 5
mongos --configdb paradigma:27019,paradigma:27029,paradigma:27039 &


#add shards to shard cluster
sleep 5
mongo < comandosSharding.in
