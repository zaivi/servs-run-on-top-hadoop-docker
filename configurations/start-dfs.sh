#!/usr/bin/env bash

echo "Start hadoop dfs daemons."

#---------------------------------------------------------
# namenodes

echo "Starting namenodes"

hadoop-daemons.sh \
  --config "$CONF_DIR" \
  --script start namenode

#---------------------------------------------------------
# datanodes (using default slaves file)

echo "Starting datanodes"

hadoop-daemons.sh \
  --config "$CONF_DIR" \
  --script start datanode

#---------------------------------------------------------
# secondary namenodes (if any)

# SECONDARY_NAMENODES=$($HADOOP_PREFIX/bin/hdfs getconf -secondarynamenodes 2>/dev/null)

# if [ -n "$SECONDARY_NAMENODES" ]; then
#   echo "Starting secondary namenodes [$SECONDARY_NAMENODES]"

#   "$HADOOP_PREFIX/sbin/hadoop-daemons.sh" \
#       --config "$HADOOP_CONF_DIR" \
#       --hostnames "$SECONDARY_NAMENODES" \
#       --script "$bin/hdfs" start secondarynamenode
# fi

# eof
