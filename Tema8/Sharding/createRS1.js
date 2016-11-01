config = {
    _id : "shard1",
     members : [
         {_id : 0, host : "mongodb:27018"}
     ]
};
db=db.getSiblingDB("admin");
db.runCommand({replSetInitiate: config});
