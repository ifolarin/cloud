#!/bin/bash
set -a 
echo "####### sourcing staging env variables..."
source ./.beta-env 
set +a 
compose=stg-stack.yml
context=stg-docker
echo "####### switching docker context ..."
docker context use $context # switch docker context
docker stack config -c $compose
echo "####### restoring docker context ..."
docker context use default # restore docker context