#!/bin/bash
#################################################################################
# TRAEFIK
#################################################################################
echo "####### sourcing staging env variables..."
set -a
source .env
set +a

# PGUID=70
# PGGID=70
echo "####### creating folder ${DATA_VOLUME?:ERROR DATA_VOLUME NOT SET}..."
mkdir -p ${DATA_VOLUME}

echo "####### setting mode for: ${DATA_VOLUME?:ERROR DATA_VOLUME NOT SET}..."
chmod -R 0777 ${DATA_VOLUME}