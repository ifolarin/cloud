#!/bin/bash
docker network inspect enumverse_mongodb_net >/dev/null 2>&1 || docker network create --driver overlay --scope swarm --attachable enumverse_mongodb_net
docker network ls