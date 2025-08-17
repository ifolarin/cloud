#!/bin/bash
docker network inspect enumverse_frontend_net >/dev/null 2>&1 || docker network create --driver overlay --scope swarm enumverse_frontend_net
docker network inspect enumverse_backend_net>/dev/null 2>&1 || docker network create --driver overlay --scope swarm enumverse_backend_net
docker network inspect enumverse_pulsar_net >/dev/null 2>&1 || docker network create --driver overlay --scope swarm enumverse_pulsar_net
docker network inspect enumverse_postgres_net >/dev/null 2>&1 || docker network create --driver overlay --scope swarm enumverse_postgres_net