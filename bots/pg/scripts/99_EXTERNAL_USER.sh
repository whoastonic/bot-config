#!/bin/bash
set -e

PGPASSWORD="$POSTGRES_PASSWORD" psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
	CREATE USER external WITH ENCRYPTED PASSWORD 'idyllic-horses';
	GRANT ALL PRIVILEGES ON DATABASE tuxedoman TO external;
	GRANT ALL PRIVILEGES ON DATABASE eli_bot TO external;
	GRANT ALL PRIVILEGES ON DATABASE tagger TO external;
EOSQL