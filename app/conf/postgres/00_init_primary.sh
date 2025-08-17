#!/usr/bin/env bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    create user ${PGUSER?[ERROR] PGUSER NOT SET} with replication encrypted password '${PGPASSWORD?[ERROR] PGPASSWORD NOT SET}';
    select pg_create_physical_replication_slot('replication_slot_1');
    select pg_create_physical_replication_slot('replication_slot_2');
EOSQL