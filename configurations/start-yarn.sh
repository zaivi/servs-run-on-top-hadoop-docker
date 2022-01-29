#!/usr/bin/env bash

# Start all yarn daemons.  Run this on master node.

echo "starting yarn daemons"

# start resourceManager
yarn-daemon.sh --config $CONF_DIR  start resourcemanager

# start nodeManager
yarn-daemons.sh --config $CONF_DIR  start nodemanager