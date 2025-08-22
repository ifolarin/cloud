#!/bin/bash
# docker stack deploy --with-registry-auth -c stack.yml enumverse
set -a # automatically export all variables
source ./.env 
set +a # disable autoatic export
CONFIG="stack.yml"
if [ ! -f $CONFIG ]; then CONFIG="docker-compose.yml"; fi # shellcheck source=path/to/file
docker stack deploy -c $CONFIG mg_cluster
