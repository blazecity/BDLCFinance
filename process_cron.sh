#!/usr/bin/env bash

cd $(dirname $0)

test -d ./log || mkdir ./log

./process.sh > log/$(basename $0 .sh).$(date +%Y%m%d_%H%M%S).log 2> log/$(basename $0 .sh).$(date +%Y%m%d_%H%M%S).err