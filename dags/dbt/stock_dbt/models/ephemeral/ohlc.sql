{{
    config(
        materialized = 'ephemeral'
    )
}}

WITH ohlc AS (
    SELECT * 
    FROM {{ source('stock_data', 'ohlc') }} 
)
SELECT * FROM ohlc