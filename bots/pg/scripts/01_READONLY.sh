#!/bin/bash
set -e

USER="$(< /run/secrets/READONLY_USER)"
PASSW="$(< /run/secrets/READONLY_PASS)"

PGPASSWORD="$POSTGRES_PASSWORD" psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
  CREATE ROLE readonly;

  CREATE USER ${USER} WITH ENCRYPTED PASSWORD '${PASSW}';
	GRANT readonly TO ${USER};
EOSQL
