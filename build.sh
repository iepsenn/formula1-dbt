#!/bin/bash
unzip data/races.zip -d data
rm -f scripts/initdb.sql
cat scripts/ddl.sql >> scripts/initdb.sql
cat scripts/load_data.sql >> scripts/initdb.sql
docker compose up -d
