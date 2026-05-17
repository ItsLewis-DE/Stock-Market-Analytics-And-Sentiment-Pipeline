{{ config(
    materialized='incremental',
    unique_key = 'ohlc_id'
)}}
SELECT 
    T || '-' || t_time AS ohlc_id,
    T AS ticker,
    v AS volume,
    vw AS volumn_weight_average_price,
    o AS open_price,
    c AS close_price,
    h AS highest_price,
    l AS lowest_price,
    t_time AS ex_dividend_date,
    n AS transactions,
    inserted_at::DATE AS inserted_at
FROM {{ source('stock_data', 'ohlc') }}