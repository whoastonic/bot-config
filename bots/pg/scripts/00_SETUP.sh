#!/bin/bash
set -e

USER="$(< /run/secrets/ADMIN_USER)"
PASSW="$(< /run/secrets/ADMIN_PASS)"

psql -v ON_ERROR_STOP=1 -U postgres <<-EOSQL
  CREATE USER ${USER} WITH ENCRYPTED PASSWORD '${PASSW}';
	ALTER USER ${USER} WITH SUPERUSER;
EOSQL
