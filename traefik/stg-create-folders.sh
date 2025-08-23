#!/bin/bash
#################################################################################
# TRAEFIK
#################################################################################
echo "####### sourcing staging env variables..."
set -a
source ./.stg-env
set +a

vol=${DATA_VOLUME?:ERROR DATA_VOLUME NOT SET}/data
# PGUID=70
# PGGID=70
echo "####### creating folder $vol..."
ssh -tt labs-ovh-prod-01 << EOF
mkdir -p $vol

echo "####### setting mode for: $vol..."
chmod -R 0777 $vol
exit
EOF