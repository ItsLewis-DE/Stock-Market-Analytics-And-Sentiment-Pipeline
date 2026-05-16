{{
    config(
        materialized = 'ephemeral'
    )
}}

WITH news AS (
    SELECT * 
    FROM {{ source('stock_data', 'news') }} 
)
SELECT * FROM news