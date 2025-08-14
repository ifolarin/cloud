create user ${PGUSER} with replication encrypted password '${PGPASSWORD}';
select pg_create_physical_replication_slot('replication_slot');