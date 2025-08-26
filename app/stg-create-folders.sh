#!/bin/bash
set -a
source ./.stg-env
set +a


server=labs-ovh-stg-01

ssh -t $server << EOF

#################################################################################
# POSTGRES FOLDER
#################################################################################
PGUID=70
PGGID=70
# mkdir -p ${DATA_VOLUME_PG?[ERROR] DATA_VOLUME_PG NOT SET}/pg{0..2}/pgdata

sudo mkdir -p ${CONF_VOLUME_PG?[ERROR] DATA_VOLUME_PG NOT SET}
sudo chmod -R 0777 ${CONF_VOLUME_PG}

# chown -R 70:70 ${DATA_VOLUME_PG}
# chown -R 70:70 ${CONF_VOLUME_PG}

sudo mkdir -p ${DATA_VOLUME_KC:?[ERROR] DATA_VOLUME_KC NOT SET}/data
sudo chmod -R 0777 ${DATA_VOLUME_KC}

sudo mkdir -p ${CONF_VOLUME_KC:?[ERROR] CONF_VOLUME_KC NOT SET}
sudo chmod -R 0777 ${CONF_VOLUME_KC}

#################################################################################
# PULSAR FOLDER
#################################################################################
sudo mkdir -p ${DATA_VOLUME_PS:?[ERROR] DATA_VOLUME_PS NOT SET}/zookeeper
sudo mkdir -p ${DATA_VOLUME_PS:?[ERROR] DATA_VOLUME_PS NOT SET}/bookkeeper
sudo chmod -R 0777 ${DATA_VOLUME_PS}

#################################################################################
# MONGODB FOLDER
#################################################################################
PGUID=999
PGGID=999
sudo mkdir -p ${DATA_VOLUME_MG:?ERROR DATA_VOLUME_MG NOT SET}/mg{1..3}
sudo mkdir -p ${CONF_VOLUME_MG:?ERROR CONF_VOLUME_MG NOT SET}
sudo chown -R 999:999 ${DATA_VOLUME_MG?[ERROR] DATA_VOLUME_MG NOT SET}
sudo chown -R 999:999 ${CONF_VOLUME_MG?[ERROR] CONF_VOLUME_MG NOT SET}
sudo chmod -R 0777 ${DATA_VOLUME_MG}
sudo chmod -R 0777 ${CONF_VOLUME_MG}
# chmod -R 0400 ${CONF_VOLUME_MG}/keyfile.pem
exit
exit
EOF