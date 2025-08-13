#!/bin/bash
docker network inspect app_frontend >/dev/null 2>&1 || docker network create --driver overlay -scope swarm app_frontend
docker network inspect app_backend >/dev/null 2>&1 || docker network create --driver overlay -scope swarm app_backend