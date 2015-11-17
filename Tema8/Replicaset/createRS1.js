config = {
    _id : "RS1",
     members : [
         {_id : 0, host : "paradigma:27017"},
         {_id : 1, host : "paradigma:27018"},
         {_id : 2, host : "paradigma:27019"}
     ]
};
db=db.getSiblingDB("admin");
db.runCommand({replSetInitiate: config});
exit(0);

