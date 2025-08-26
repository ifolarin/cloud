#!/bin/bash
set -a 
echo "####### sourcing staging env variables..."
source ./.stg-env 
set +a 
context=stg-docker
compose=stg-stack.yml
echo "####### switching docker context ..."
docker context use $context # switch docker context
docker volume create --driver local beta_pg0_vol
docker volume create --driver local beta_pg1_vol
docker volume create --driver local beta_pg2_vol
docker volume create --driver local beta_mg0_vol
docker volume create --driver local beta_mg1_vol
docker volume create --driver local beta_mg2_vol
echo "####### restoring docker context ..."
docker context use default # restore docker context