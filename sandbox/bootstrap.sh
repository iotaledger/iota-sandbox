#!/bin/bash

#
# iota-sandbox __VERSION__
# https://github.com/iotaledger/iota-sandbox
#

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
mkdir -p data/sandboxdb/evm-toolkit
mkdir -p data/sandboxdb/wasp-cli

cp assets/wasp-cli/config.json data/sandboxdb/wasp-cli/config.json

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

source .env
echo ${COMPOSE_PROFILES}

# Check if compose profiles contains wasp
if [[ ${COMPOSE_PROFILES} != *"wasp"* ]]; then
  echo "Setup done, run docker compose up -d to start the network."
  exit
fi

# Bootstrap chain
echo "Bootstrap chain..."
docker compose --profile wasp-node --profile inx-indexer --profile bootstrap-chain up -d && docker compose logs bootstrap-chain -f && docker compose logs fund-chain-account -f
echo "Configuring toolkit..."
chain_address=$(jq -r '.chains."glass-chain"' data/sandboxdb/wasp-cli/config.json)
sed -e "s/<httpPort>/${HTTP_PORT:-80}/g" -e "s/<chainAddress>/$chain_address/g" assets/evm-toolkit/networks.json > data/sandboxdb/evm-toolkit/networks.json
echo "Bootstraping and funding chain done. Cleaning up..."
docker compose --profile wasp-node --profile inx-indexer --profile bootstrap-chain down
echo "Cleanup done, run docker compose up -d to start the network."
