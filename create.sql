CREATE DATABASE IF NOT EXISTS yfinance_api;
USE yfinance_api;

CREATE TABLE IF NOT EXISTS yfinance_api.src_latest_price_history_json (
    price_record STRING
)
STORED AS TEXTFILE;

CREATE VIEW IF NOT EXISTS src_latest_price_history AS 
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
    FROM src_latest_price_history_json;

CREATE TABLE price_history (
    date STRING,
    open STRING,
    high STRING,
    low STRING,
    low STRING,
    close STRING,
    volume STRING,
    dividends STRING,
    stockSplits STRING,
    ticker STRING,
    company STRING,
    country STRING,
    marketcap STRING,
    currency STRING
);

CREATE TABLE hwm_price_history (
    date STRING
);