config = {
    _id : "RS1",
     members : [
         {_id : 0, host : "mongodb:27017"},
         {_id : 1, host : "mongodb:27018"},
         {_id : 2, host : "mongodb:27019"}
     ]
};
db=db.getSiblingDB("admin");
db.runCommand({replSetInitiate: config});
exit;
