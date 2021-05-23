USE yfinance_api;

DROP TABLE IF EXISTS yfinance_api.tbl_src_latest_price_history_json;
DROP VIEW IF EXISTS yfinance_api.v_src_latest_price_history;

DROP TABLE IF EXISTS yfinance_api.tbl_price_history;
DROP TABLE IF EXISTS yfinance_api.tbl_hwm_price_history;

SHOW tables;

DROP DATABASE IF EXISTS yfinance_api;