{{
    config(
        materialized = 'ephemeral'
    )
}}

WITH fama_classification AS (
    SELECT * 
    FROM {{ source('stock_data', 'fama_classification') }} 
)
SELECT * FROM fama_classification