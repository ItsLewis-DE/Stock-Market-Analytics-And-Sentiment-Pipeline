SELECT * 
FROM {{ source('stock_data', 'industry') }}