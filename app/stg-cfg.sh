#!/bin/bash
set -a 
echo "####### sourcing staging env variables..."
source ./.stg-env 
set +a 
compose=stg-stack.yml
echo "####### switching docker context ..."
docker context use stg-enum # switch docker context
docker stack config -c $compose
echo "####### restoring docker context ..."
docker context use default # restore docker context