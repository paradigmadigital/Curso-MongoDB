#/bin/bash
killall mongod mongos
sleep 1
rm -rf /data/configdb1 /data/configdb2  /data/configdb3   /data/shard1 /data/shard2

