#!/bin/bash
docker network inspect frontend >/dev/null 2>&1 || docker network create --driver overlay --scope swarm frontend
docker network inspect enumverse_backend_network >/dev/null 2>&1 || docker network create --driver overlay --scope swarm enumverse_backend_network