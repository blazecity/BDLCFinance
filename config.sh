#!/usr/bin/env bash

function hive_cli {
  if [ -n "${JDBC_HIVE2_URL}" ]; then
    beeline -n "${USER}" -u "${JDBC_HIVE2_URL}" "$@"
  else
    hive "$@"
  fi
}

set -xv
