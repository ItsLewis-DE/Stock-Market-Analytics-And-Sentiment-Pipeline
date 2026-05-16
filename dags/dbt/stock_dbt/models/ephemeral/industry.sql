{{
    config(
        materialized = 'ephemeral'
    )
}}

WITH industry AS (
    SELECT * 
    FROM {{ source('stock_data', 'industry') }} 
)
SELECT * FROM industry