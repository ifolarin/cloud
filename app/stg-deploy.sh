#!/bin/bash
set -a 
source ./.stg-env 
set +a 

stack=stg-enum
compose=stg-stack.yml
echo "####### switching docker context ..."
docker context use stg-enum
docker stack deploy --with-registry-auth -c $compose $stack
docker stack ls
docker stack ps $stack
echo "####### restoring docker context ..."
docker context use default 