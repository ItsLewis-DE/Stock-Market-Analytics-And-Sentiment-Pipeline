{{
    config(
        materialized = 'ephemeral'
    )
}}

WITH exchange AS (
    SELECT * 
    FROM {{ source('stock_data', 'exchange') }} 
)
SELECT * FROM exchange