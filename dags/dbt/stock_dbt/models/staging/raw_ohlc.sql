SELECT *
FROM {{ source('stock_data', 'ohlc') }}