#!/usr/bin/env bash

echo "Stop hadoop dfs daemons."

#---------------------------------------------------------
# namenodes

echo "Stopping namenodes"

hadoop-daemons.sh \
  --config "$CONF_DIR" \
  --script stop namenode

#---------------------------------------------------------
# datanodes (using default slaves file)

echo "Stopping datanodes"

hadoop-daemons.sh \
  --config "$CONF_DIR" \
  --script stop datanode

#---------------------------------------------------------
# secondary namenodes (if any)

# SECONDARY_NAMENODES=$($HADOOP_PREFIX/bin/hdfs getconf -secondarynamenodes 2>/dev/null)

# if [ -n "$SECONDARY_NAMENODES" ]; then
#   echo "Stopping secondary namenodes [$SECONDARY_NAMENODES]"

#   "$HADOOP_PREFIX/sbin/hadoop-daemons.sh" \
#       --config "$HADOOP_CONF_DIR" \
#       --hostnames "$SECONDARY_NAMENODES" \
#       --script "$bin/hdfs" stop secondarynamenode
# fi

# eof
