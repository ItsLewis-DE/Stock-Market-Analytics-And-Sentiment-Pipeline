SELECT * 
FROM {{ source('stock_data', 'sic_classification') }}