SELECT * 
FROM {{ source('stock_data', 'news') }}