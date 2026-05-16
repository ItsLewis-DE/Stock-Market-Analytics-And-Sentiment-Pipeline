{{
    config(
        materialized = 'ephemeral'
    )
}}

WITH dim_date AS (
    SELECT * 
    FROM {{ source('stock_data', 'dim_date') }} 
)
SELECT * FROM dim_date