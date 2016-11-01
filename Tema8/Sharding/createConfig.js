config = {
    _id : "config",
     members : [
         {_id : 0, host : "mongodb:27019"}
     ]
};
db=db.getSiblingDB("admin");
db.runCommand({replSetInitiate: config});
exit(0);
