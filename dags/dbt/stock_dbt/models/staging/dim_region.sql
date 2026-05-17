{{ config(
    materialized='incremental',
    unique_key = 'region_id'
)}}
SELECT 
    region_id,
    region_name,
    market_type,
    CAST((local_open/1000000)::INT::VARCHAR AS TIME) AS local_open,
    CAST((local_close/1000000)::INT::VARCHAR AS TIME) AS local_close,
    inserted_at::DATE AS date_key
FROM {{ source('stock_data', 'region') }}