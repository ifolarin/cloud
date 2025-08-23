#!/bin/bash
# docker stack deploy --with-registry-auth -c stack.yml enumverse
set -a # automatically export all variables
echo "####### sourcing staging env variables..."
source ./.stg-env 
set +a # disable autoatic export
echo "####### switching docker context ..."
docker context use stg-enum # switch docker context
docker stack config -c stg-stack.yml
echo "####### restoring docker context ..."
docker context use default # restore docker context