#!/bin/bash
docker network inspect app_frontend_network >/dev/null 2>&1 || docker network create --driver overlay -scope swarm app_frontend_network
docker network inspect app_backend_network >/dev/null 2>&1 || docker network create --driver overlay -scope swarm app_backend_network