import yfinance as yf
import pandas as pd
import json

def load_ticker_symbols(path):
    msci_world_tickers = pd.read_json(path)
    return msci_world_tickers['ticker']


def load_stock_data(path_tickers, path_stock_data='stock.json'):
    ticker_list = load_ticker_symbols(path_tickers)
    with open(path_stock_data, 'w', encoding='utf-8') as json_file:
        counter = 1
        for ticker in ticker_list:
            current_ticker = yf.Ticker(ticker)
            ticker_info = current_ticker.info
            print('#' + str(counter) + ' current ticker: ' + ticker)
            history_df = current_ticker.history(period='max')
            # add additional info
            history_df['Ticker'] = ticker
            history_df['Company'] = ticker_info['shortName']
            history_df['Country'] = ticker_info['country']
            history_df['Sector'] = ticker_info['sector']
            history_df['MarketCap'] = ticker_info['marketCap']
            history_df['Currency'] = ticker_info['currency']
            json_file.write(history_df.to_json(orient='records'))
            counter += 1


if __name__ == "__main__":
    load_stock_data("msci_world_ticker_single.csv")
    # print(yf.Ticker('MSFT').info)