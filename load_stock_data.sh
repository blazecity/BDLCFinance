#!/usr/bin/env bash

jq -c '.[] | .ticker' $2 | while read i; do
    SYMBOL=$(echo $i | tr -d '\r"')
    echo "Current stock " ${SYMBOL}
    if [ "$1" == "-d" ]; 
        then python bdlcfinance.py ${1:-d} ${SYMBOL} | jq -c '.data[0] | with_entries(.key |= ascii_downcase) | with_entries(if .key == "stock splits" then .key = "stockSplits" else . end)' >> data/yfinance_price_history.json
        else if [ "$1" == "-m" ]
        then python bdlcfinance.py ${1:-d} ${SYMBOL} | jq -c '.data[] | with_entries(.key |= ascii_downcase) | with_entries(if .key == "stock splits" then .key = "stockSplits" else . end)' >> data/yfinance_price_history.json
        fi
    fi
done