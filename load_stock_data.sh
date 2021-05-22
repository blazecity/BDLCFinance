#!/usr/bin/env bash

jq -c '.[] | .ticker' $1 | while read i; do
    SYMBOL=$(echo $i | tr -d '\r"')
    python bdlcfinance.py ${SYMBOL} | jq -c ".[]" >> stock.json
done