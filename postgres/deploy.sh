#!/bin/bash
# docker stack deploy --with-registry-auth -c stack.yml enumverse
set -a # automatically export all variables
source ./.env 
set +a # disable autoatic export
docker stack config -c docker-compose.yml && \
docker stack deploy -c docker-compose.yml -d=false enumverse