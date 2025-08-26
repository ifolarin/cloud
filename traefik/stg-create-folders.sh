#!/bin/bash
#################################################################################
# TRAEFIK
#################################################################################
echo "####### sourcing staging env variables..."
set -a
source ./.stg-env
set +a

# server=labs-ovh-prod-01
server=labs-ovh-stg-01
vol=${DATA_VOLUME?:ERROR DATA_VOLUME NOT SET}/{data,certs,logs}
echo "####### creating folder $vol..."
ssh -tt  $server << EOF
mkdir -p $vol
chown -R \${USER}:docker ${DATA_VOLUME}
echo "####### setting mode for: $vol..."
chmod -R 0775 $vol
exit
EOF