#!/bin/bash
set -a
source .stg-env
set +a

LOCAL_CONF=${PWD}/conf
server=labs-ovh-stg-01

# copy configs to server
scp -r ${LOCAL_CONF}/* $server:${CONF_VOLUME}
scp ${LOCAL_CONF}/mongo/keyfile.pem.bak $server:${CONF_VOLUME}/mongo/keyfile.pem

ssh -tt labs-ovh-prod-01 <<EOF
set -e 

# sudo mv ${CONF_VOLUME_MG}/keyfile.pem.bak ${CONF_VOLUME_MG}/keyfile.pem
sudo chown -R root:docker ${CONF_VOLUME}
sudo chmod 0400 ${CONF_VOLUME_MG}/keyfile.pem
exit
EOF
