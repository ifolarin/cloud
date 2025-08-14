#!/bin/bash
docker network inspect enumverse_frontend >/dev/null 2>&1 || docker network create --driver overlay --scope swarm enumverse_frontend
docker network inspect enumverse_backend >/dev/null 2>&1 || docker network create --driver overlay --scope swarm enumverse_backend
docker network inspect enumverse_pulsar >/dev/null 2>&1 || docker network create --driver overlay --scope swarm enumverse_pulsar