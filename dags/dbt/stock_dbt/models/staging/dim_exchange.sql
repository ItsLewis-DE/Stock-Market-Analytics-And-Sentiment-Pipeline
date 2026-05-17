{{ config(
    materialized='incremental',
    unique_key = 'exchange_name'
)}}
SELECT 
    exchange_id,
    exchange_name,
    region_id,
    inserted_at::DATE AS date_key
FROM {{ source('stock_data', 'exchange') }}