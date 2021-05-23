#!/usr/bin/env bash

cd $(dirname $0)

hdfs dfs -mkdir /user/${USER}/load/yfinance_price_history
hdfs dfs -ls /user/${USER}/load/yfinance_price_history
hdfs dfs -put -f data/yfinance_price_history.json /user/${USER}/load/yfinance_price_history
hdfs dfs -ls /user/${USER}/load/yfinance_price_history