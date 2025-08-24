#!/bin/bash
set -a
source ./.env
set +a

docker network inspect edge >/dev/null 2>&1 || docker network create --driver overlay --scope swarm --attachable  edge
docker stack deploy -c local-stack.yml edge
docker stack ls
docker stack ps edge
