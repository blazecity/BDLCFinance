#!/usr/bin/env bash

cd $(dirname $0)
source ./config.sh

hive_cli -f drop.sql

hdfs dfs -rm /user/${USER}/load/yfinance_price_history/yfinance_price_history.json

hdfs dfs -ls -R /user/${USER}/load

hive_cli <<EOSQL
  SHOW DATABASES;
EOSQL
