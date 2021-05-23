USE yfinance_api;

DROP TABLE IF EXISTS yfinance_api.stg_latest_price_history;
DROP VIEW IF EXISTS yfinance_api.stg_latest_price_history;

DROP TABLE IF EXISTS yfinance_api.src_latest_price_history_json;
DROP VIEW IF EXISTS yfinance_api.src_latest_price_history;

DROP TABLE IF EXISTS yfinance_api.price_history;
DROP TABLE IF EXISTS yfinance_api.hwm_price_history;

SHOW tables;

DROP DATABASE IF EXISTS yfinance_api;