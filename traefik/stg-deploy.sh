#!/bin/bash
echo "####### sourcing staging env variables..."
set -a
source ./.stg-env
set +a
stack=edge
echo "####### switching docker context ..."
docker context use stg-enum
docker network inspect edge >/dev/null 2>&1 || docker network create --driver overlay --scope swarm --attachable edge && \
docker network ls
docker stack deploy --with-registry-auth -c stg-stack.yml $stack
docker stack ls
docker stack ps $stack
echo "####### restoring docker context ..."
docker context use default 