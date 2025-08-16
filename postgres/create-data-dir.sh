#!/bin/bash
set -a
source ./.env
set +a
PGUID=70
PGGID=70
mkdir -p ${DATA_VOLUME?[ERROR] ENV VAR DATA_VOLUME NOT SET}/postgres/primary/data
mkdir -p ${DATA_VOLUME?[ERROR] ENV VAR DATA_VOLUME NOT SET}/postgres/replica/data
chown -R $PGUID:$PGGID ${DATA_VOLUME?[ERROR] ENV VAR DATA_VOLUME NOT SET}/postgres/
