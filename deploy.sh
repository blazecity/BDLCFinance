#!/usr/bin/env bash

cd $(dirname $0)
source ./config.sh

hive_cli -f create.sql