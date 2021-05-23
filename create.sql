CREATE DATABASE IF NOT EXISTS yfinance_api;
USE yfinance_api;

DROP TABLE IF EXISTS yfinance_api.tbl_src_latest_price_history_json;
CREATE TABLE IF NOT EXISTS yfinance_api.tbl_src_latest_price_history_json (
    price_record STRING
)
STORED AS TEXTFILE;

DROP VIEW IF EXISTS v_src_latest_price_history;
CREATE VIEW IF NOT EXISTS v_src_latest_price_history AS 
    SELECT 
        get_json_object(price_record, '$.date') AS price_date, 
        get_json_object(price_record, '$.open') AS open_price,
        get_json_object(price_record, '$.high') AS high_price,
        get_json_object(price_record, '$.low') AS low_price,
        get_json_object(price_record, '$.close') AS close_price,
        get_json_object(price_record, '$.volume') AS volume,
        get_json_object(price_record, '$.dividends') AS dividends,
        get_json_object(price_record, '$.stockSplits') AS stockSplits,
        get_json_object(price_record, '$.ticker') AS ticker,
        get_json_object(price_record, '$.company') AS company,
        get_json_object(price_record, '$.country') AS country,
        get_json_object(price_record, '$.sector') AS sector,
        get_json_object(price_record, '$.marketcap') AS marketcap,
        get_json_object(price_record, '$.currency') AS currency
    FROM tbl_src_latest_price_history_json;

CREATE TABLE IF NOT EXISTS tbl_price_history (
    date_price STRING,
    open_price STRING,
    high_price STRING,
    low_price STRING,
    close_price STRING,
    volume STRING,
    dividends STRING,
    stockSplits STRING,
    ticker STRING,
    company STRING,
    country STRING,
    sector STRING,
    marketcap STRING,
    currency STRING
) 
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
STORED AS TEXTFILE;

CREATE TABLE IF NOT EXISTS tbl_hwm_price_history (
    ticker,
    date_price STRING
);