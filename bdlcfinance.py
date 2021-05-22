import yfinance as yf
import pandas as pd
import json
import sys
import argparse


def load_stock_data(ticker_symbol):
    ticker = yf.Ticker(ticker_symbol)
    
    # company infos like name, sector, etc.
    ticker_info = ticker.info
    history_df = ticker.history(period='max')
    
    # add company info to data frame
    history_df['Ticker'] = ticker_symbol
    history_df['Company'] = ticker_info['shortName']
    history_df['Country'] = ticker_info['country']
    history_df['Sector'] = ticker_info['sector']
    history_df['MarketCap'] = ticker_info['marketCap']
    history_df['Currency'] = ticker_info['currency']

    # # convert data frame to JSON
    json_string = history_df.to_json(orient='records')
    print(json_string)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('symbol', help='Ticker symbol for Yahoo Finance, e. g. MSFT', type=str)
    args = parser.parse_args()
    load_stock_data(args.symbol)