{{
    config(
        materialized = 'ephemeral'
    )
}}

WITH company AS (
    SELECT * 
    FROM {{ source('stock_data', 'company') }} 
)
SELECT * FROM company