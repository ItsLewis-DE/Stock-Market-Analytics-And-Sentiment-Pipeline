SELECT * 
FROM {{ source('stock_data', 'region') }}