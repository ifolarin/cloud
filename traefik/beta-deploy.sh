#!/bin/bash
echo "####### sourcing staging env variables..."
set -a
source ./.beta-env
set +a
stack=edge
compose=stg-stack.yml
context=stg-docker
echo "####### switching docker context ..."
docker context use $context
docker network inspect edge >/dev/null 2>&1 || docker network create --driver overlay --scope swarm --attachable edge && \
docker network ls
docker stack deploy --with-registry-auth -c $compose $stack
docker stack ls
docker stack ps $stack
echo "####### restoring docker context ..."
docker context use default 