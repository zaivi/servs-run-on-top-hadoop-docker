#!/usr/bin/env bash

# Stop all yarn daemons.  Run this on master node.

echo "stopping yarn daemons"

# stop resourceManager
yarn-daemon.sh --config $CONF_DIR  stop resourcemanager
# stop nodeManager
yarn-daemons.sh --config $CONF_DIR  stop nodemanager