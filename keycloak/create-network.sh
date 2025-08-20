#!/bin/bash
docker network inspect enumverse_keycloak_net>/dev/null 2>&1 || docker network create enumverse_keycloak_net
docker network ls