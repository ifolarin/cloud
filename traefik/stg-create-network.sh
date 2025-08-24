#!/bin/bash
docker context use stg-enum
docker network inspect edge >/dev/null 2>&1 || docker network create --driver overlay  edge
docker network ls
docker context use default