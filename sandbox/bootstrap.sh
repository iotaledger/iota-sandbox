#!/bin/bash

if [[ "$OSTYPE" != "darwin"* && "$EUID" -ne 0 ]]; then
  echo "Please run as root or with sudo"
  exit
fi

# Cleanup if necessary
if [ -d "data" ]; then
  docker compose down --remove-orphans
  rm -Rf data
fi

# Prepare db directory
mkdir -p data/sandboxdb/grafana
mkdir -p data/sandboxdb/prometheus
mkdir -p data/sandboxdb/dashboard
mkdir -p data/sandboxdb/database_legacy
mkdir -p data/sandboxdb/database_chrysalis
mkdir -p data/sandboxdb/wasp
mkdir -p data/sandboxdb/hornet
mkdir -p data/sandboxdb/hornet-1
mkdir -p data/sandboxdb/state
mkdir -p data/sandboxdb/indexer
mkdir -p data/sandboxdb/participation
mkdir -p data/snapshots/hornet

if [[ "$OSTYPE" != "darwin"* ]]; then
  chown -R 65532:65532 data
fi

# Create snapshot
docker compose run create-snapshots

# Bootstrap network (create hornet database, create genesis milestone, create coo state)
docker compose run bootstrap-network

# Duplicate snapshot
cp -R data/snapshots/hornet data/snapshots/hornet-1

if [[ "$OSTYPE" != "darwin"* ]]; then
  chown -R 65532:65532 data
fi
