#!/bin/bash
# docker stack deploy --with-registry-auth -c stack.yml enumverse
set -a # automatically export all variables
source ./.env 
set +a # disable autoatic export
CONFIG=${1:-"local-stack.yml"}
if [ ! -f $CONFIG ]; then CONFIG="stack.yml"; fi # shellcheck source=path/to/file
echo "checking config: $CONFIG"
docker stack config -c $CONFIG