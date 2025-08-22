#!/bin/bash

m1=mg1
m2=mg2
m3=mg3
port=${PORT:-27017}

echo "###### Waiting for ${m1} instance startup.."
until mongosh --host ${m1}:${port} --eval 'quit(db.runCommand({ ping: 1 }).ok ? 0 : 2)' &>/dev/null; do
  printf '.'
  sleep 1
done
echo "###### Working ${m1} instance found, initiating user setup & initializing rs setup.."

until mongosh --host ${m2}:${port} --eval 'quit(db.runCommand({ ping: 1 }).ok ? 0 : 2)' &>/dev/null; do
  printf '.'
  sleep 1
done
echo "###### Working ${m2} instance found, initiating user setup & initializing rs setup.."

until mongosh --host ${m3}:${port} --eval 'quit(db.runCommand({ ping: 1 }).ok ? 0 : 2)' &>/dev/null; do
  printf '.'
  sleep 1
done
echo "###### Working ${m3} instance found, initiating user setup & initializing rs setup.."


# setup user + pass and initialize replica sets
mongosh --host ${m1}:${port} <<EOF
var rootUser = '$MONGO_INITDB_ROOT_USERNAME';
var rootPassword = '$MONGO_INITDB_ROOT_PASSWORD';
var admin = db.getSiblingDB('admin');
admin.auth(rootUser, rootPassword);

var config = {
    "_id": "${MONGO_REPLSET}",
    "version": 1,
    "members": [
        {
            "_id": 1,
            "host": "${m1}:${port}",
            "priority": 2
        },
        {
            "_id": 2,
            "host": "${m2}:${port}",
            "priority": 1
        },
        {
            "_id": 3,
            "host": "${m3}:${port}",
            "priority": 1,
            "arbiterOnly": true 
        }
    ]
};
rs.initiate(config, { force: true });
rs.status();
EOF

echo "###### Waiting for Primary election.."
until mongosh --host ${m1}:${port} --eval 'quit(db.isMaster().ismaster ? 0 : 2)' &>/dev/null; do
  printf '.'
  sleep 5
done

echo "###### Primary elected. Initiating initial db and user setup..."
mongosh --host ${m1}:${port} <<EOF
var rootUser = '$MONGO_INITDB_ROOT_USERNAME';
var rootPassword = '$MONGO_INITDB_ROOT_PASSWORD';
var admin = db.getSiblingDB('admin');
admin.auth(rootUser, rootPassword);

var db = db.getSiblingDB('${MONGO_INITDB_DATABASE}');
show dbs;
db.createUser(
  {
    user: "${MONGO_USERNAME}", 
    pwd: "${MONGO_PASSWORD}", 
    roles :[ 
      {role: "readWrite", db: "${MONGO_INITDB_DATABASE}"}
    ]
  }
);
show users;
db.createCollection("initCollection");
db.initCollection.insertOne({ name: "Enumverse Document", value: 123 });
EOF