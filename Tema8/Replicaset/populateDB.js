db=db.getSiblingDB("miBD");

for (i=0 ; i < 10000 ; i ++) {
   db.muchosDatos.insert({x:i,y:i+2,z:i*2})
}

