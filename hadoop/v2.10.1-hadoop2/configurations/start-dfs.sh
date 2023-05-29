#!/usr/bin/env bash

echo "Start hadoop dfs daemons."

#---------------------------------------------------------
# namenodes

echo "Starting namenode"
hadoop-daemon.sh --config $CONF_DIR start namenode


#---------------------------------------------------------
# secondary namenodes (if any)

echo "Starting secondarynamenode"
hadoop-daemon.sh --config $CONF_DIR start secondarynamenode


#---------------------------------------------------------
# datanodes (using default slaves file)

echo "Starting datanode"
hadoop-daemon.sh --config $CONF_DIR start datanode


# eof
