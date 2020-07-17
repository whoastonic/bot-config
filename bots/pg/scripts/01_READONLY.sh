#!/bin/bash
set -e

ADMIN_USER="$(< /run/secrets/ADMIN_USER)"
ADMIN_PASS="$(< /run/secrets/ADMIN_PASS)"

USER="$(< /run/secrets/READONLY_USER)"
PASSW="$(< /run/secrets/READONLY_PASS)"

PGPASSWORD="$ADMIN_PASS" psql -v ON_ERROR_STOP=1 --username "$ADMIN_USER" <<-EOSQL
  CREATE ROLE readonly;

  CREATE USER ${USER} WITH ENCRYPTED PASSWORD '${PASSW}';
	GRANT readonly TO ${USER};
EOSQL
