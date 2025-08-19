#!/bin/bash
set -a
source ./.env
set +a
docker stack deploy -c local-stack.yml edge