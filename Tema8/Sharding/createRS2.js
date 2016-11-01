config = {
    _id : "shard2",
     members : [
         {_id : 0, host : "mongodb:27028"}
     ]
};
db=db.getSiblingDB("admin");
db.runCommand({replSetInitiate: config});
