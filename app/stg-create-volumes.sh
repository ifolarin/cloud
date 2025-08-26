#!/bin/bash
set -a 
echo "####### sourcing staging env variables..."
source ./.stg-env 
set +a 
context=stg-docker
compose=stg-stack.yml
echo "####### switching docker context ..."
docker context use $context # switch docker context
docker volume create --driver local pg0_vol
docker volume create --driver local pg1_vol
docker volume create --driver local pg2_vol
echo "####### restoring docker context ..."
docker context use default # restore docker context