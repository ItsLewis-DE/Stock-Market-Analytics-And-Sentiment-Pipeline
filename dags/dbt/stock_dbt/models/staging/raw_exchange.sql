SELECT * 
FROM {{ source ('stock_data', 'exchange') }}