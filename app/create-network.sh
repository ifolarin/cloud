#!/bin/bash
docker network inspect enumverse_frontend_net >/dev/null 2>&1 || docker network create --driver overlay --scope swarm --attachable enumverse_frontend_net
docker network inspect enumverse_backend_net>/dev/null 2>&1 || docker network create --driver overlay --scope swarm --attachable enumverse_backend_net
docker network inspect enumverse_pulsar_net >/dev/null 2>&1 || docker network create --driver overlay --scope swarm --attachable enumverse_pulsar_net
docker network inspect enumverse_postgres_net >/dev/null 2>&1 || docker network create --driver overlay --scope swarm --attachable enumverse_postgres_net
docker network inspect enumverse_mongodb_net >/dev/null 2>&1 || docker network create --driver overlay --scope swarm --attachable enumverse_mongodb_net
docker network ls