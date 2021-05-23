#!/usr/bin/env bash

cd $(dirname $0)
source ./config.sh

# fetch and convert data
./load_stock_data.sh

# push file to HDFS
./push_hdfs.sh

# load data
hive_cli -f load.sql
