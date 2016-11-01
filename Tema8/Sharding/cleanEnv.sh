#/bin/bash
killall mongod mongos
sleep 1
rm -rf /data/configdb  /data/shard1 /data/shard2 /data/mongos
