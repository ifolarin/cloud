#!/bin/bash
set -a
source .stg-env
set +a

ssh -tt labs-ovh-prod-01 << EOF
#################################################################################
# POSTGRES FOLDER
#################################################################################
PGUID=70
PGGID=70
mkdir -p ${DATA_VOLUME_PG?[ERROR] DATA_VOLUME_PG NOT SET}/pg{0..2}/pgdata
# mkdir -p ${DATA_VOLUME_PG?[ERROR] DATA_VOLUME_PG NOT SET}/pg-1/pgdata
# mkdir -p ${DATA_VOLUME_PG?[ERROR] DATA_VOLUME_PG NOT SET}/pg-2/pgdata

mkdir -p ${CONF_VOLUME_PG?[ERROR] DATA_VOLUME_PG NOT SET}

chown -R $PGUID:$PGGID ${DATA_VOLUME_PG}
chown -R $PGUID:$PGGID ${CONF_VOLUME_PG}
chmod -R 0775 ${CONF_VOLUME_PG}

mkdir -p ${DATA_VOLUME_KC:?[ERROR] DATA_VOLUME_KC NOT SET}/data
chmod -R 0775 ${DATA_VOLUME_KC}

mkdir -p ${CONF_VOLUME_KC:?[ERROR] CONF_VOLUME_KC NOT SET}
chmod -R 0775 ${CONF_VOLUME_KC}

#################################################################################
# PULSAR FOLDER
#################################################################################
mkdir -p ${DATA_VOLUME_PS:?[ERROR] DATA_VOLUME_PS NOT SET}/zookeeper
mkdir -p ${DATA_VOLUME_PS:?[ERROR] DATA_VOLUME_PS NOT SET}/bookkeeper
chmod -R 0775 ${DATA_VOLUME_PS}

#################################################################################
# MONGODB FOLDER
#################################################################################
PGUID=999
PGGID=999
mkdir -p ${DATA_VOLUME_MG:?ERROR DATA_VOLUME_MG NOT SET}/mg{1..3}
mkdir -p ${CONF_VOLUME_MG:?ERROR CONF_VOLUME_MG NOT SET}
chown -R $PGUID:$PGGID ${DATA_VOLUME_MG?[ERROR] DATA_VOLUME_MG NOT SET}
chown -R $PGUID:$PGGID ${CONF_VOLUME_MG?[ERROR] CONF_VOLUME_MG NOT SET}
chmod -R 0775 ${DATA_VOLUME_MG}
chmod -R 0775 ${CONF_VOLUME_MG}
# chmod -R 0400 ${CONF_VOLUME_MG}/keyfile.pem
exit
EOF