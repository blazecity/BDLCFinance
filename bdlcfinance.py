import yfinance as yf
import pandas as pd
import json
import sys
import argparse


def load_stock_data(ticker_symbol, data_period='max'):
    ticker = yf.Ticker(ticker_symbol)
    
    # company infos like name, sector, etc.
    ticker_info = ticker.info
    history_df = ticker.history(period=data_period)
    
    # add company info to data frame
    history_df['Ticker'] = ticker_symbol
    history_df['Company'] = ticker_info['shortName']
    history_df['Country'] = ticker_info['country']
    history_df['Sector'] = ticker_info['sector']
    history_df['MarketCap'] = ticker_info['marketCap']
    history_df['Currency'] = ticker_info['currency']

    # # convert data frame to JSON
    json_string = history_df.to_json(orient='table')
    print(json_string)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument('symbol', help='Ticker symbol for Yahoo Finance, e. g. MSFT', type=str)
    parser.add_argument('-d', '--day', help='Switch for the last day', action='store_true')
    parser.add_argument('-m', '--max', help='Switch for the maximal available period', action='store_true')
    args = parser.parse_args()
    if args.day:
        load_stock_data(args.symbol, data_period='1d')
    elif args.max:
        load_stock_data(args.symbol)