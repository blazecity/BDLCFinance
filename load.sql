USE yfinance_api;

LOAD DATA 'INPATH /user/bd01/load/yfinance_price_history/yfinance_price_history.json' OVERWRITE INTO TABLE src_latest_price_history_json;

INSERT INTO TABLE tbl_price_history
    SELECT *
    FROM v_src_latest_price_history v
    JOIN tbl_hwm_price_history hwm ON v.ticker = hwm.ticker
    WHERE v.price_date > hwm.price_date;

INSERT INTO TABLE tbl_hwm_price_history 
    SELECT ticker, MAX(price_date) AS price_date
    FROM v_src_latest_price_history;

CREATE TEMPORARY TABLE tbl_tmp_hwm AS 
    SELECT ticker, MAX(price_date) AS price_date
    FROM tbl_hwm_price_history;

INSERT OVERWRITE TABLE tbl_hwm_price_history 
    SELECT * FROM tbl_tmp_hwm;

