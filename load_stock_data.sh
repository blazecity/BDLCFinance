#!/usr/bin/env bash

jq -c '.[] | .ticker' $1 | while read i; do
    SYMBOL=$(echo $i | tr -d '\r"')
    python bdlcfinance.py ${SYMBOL} | jq -c '.data[] | with_entries(.key |= ascii_downcase) | with_entries(if .key == "stock splits" then .key = "stockSplits" else . end)' > stock.json
done