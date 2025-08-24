#!/bin/bash
docker context use stg-enum
docker network inspect stg_enum_frontend_net >/dev/null 2>&1 || docker network create --driver overlay --scope swarm --attachable stg_enum_frontend_net
docker network inspect stg_enum_backend_net >/dev/null 2>&1 || docker network create --driver overlay --scope swarm --attachable stg_enum_backend_net
docker network inspect stg_enum_pulsar_net >/dev/null 2>&1 || docker network create --driver overlay --scope swarm --attachable stg_enum_pulsar_net
docker network inspect stg_enum_postgres_net >/dev/null 2>&1 || docker network create --driver overlay --scope swarm --attachable stg_enum_postgres_net
docker network inspect stg_enum_mongodb_net >/dev/null 2>&1 || docker network create --driver overlay --scope swarm --attachable stg_enum_mongodb_net
docker network ls
docker context use default