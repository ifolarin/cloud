#!/bin/bash
set -a
source .stg-env
set +a

LOCAL_CONF=${PWD}/conf


# copy configs to server
scp -r ${LOCAL_CONF}/* labs-ovh-prod-01:${CONF_VOLUME}

ssh -tt labs-ovh-prod-01 <<EOF
set -e 

mv ${CONF_VOLUME_MG}/keyfile.pem.bak ${CONF_VOLUME_MG}/keyfile.pem
chmod 0400 ${CONF_VOLUME_MG}/keyfile.pem
exit
EOF
