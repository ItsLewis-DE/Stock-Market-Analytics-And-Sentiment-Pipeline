SELECT * 
FROM {{ source('stock_data', 'fama_classification') }}