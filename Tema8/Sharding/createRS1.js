config = {
    _id : "RS1",
     members : [
         {_id : 0, host : "paradigma:27018"}
     ]
};
db=db.getSiblingDB("admin");
db.runCommand({replSetInitiate: config});
exit(0);

