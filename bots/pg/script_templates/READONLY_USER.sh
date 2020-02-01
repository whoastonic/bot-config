#!/bin/bash
set -e
USER=username
PASSW=password

PGPASSWORD="$POSTGRES_PASSWORD" psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
	CREATE USER ${USER} WITH ENCRYPTED PASSWORD '${PASSW}';
	GRANT readonly to external;
EOSQL
