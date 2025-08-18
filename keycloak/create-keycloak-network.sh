#!/bin/bash
docker network inspect keycloak_frontend_net >/dev/null 2>&1 || docker network create --driver overlay --scope swarm keycloak_frontend_net
docker network inspect keycloak_backend_net >/dev/null 2>&1 || docker network create --driver overlay --scope swarm keycloak_backend_net