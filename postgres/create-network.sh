#!/bin/bash
docker network inspect enumverse_postgres_net >/dev/null 2>&1 || docker network create --driver overlay --scope swarm enumverse_postgres_net