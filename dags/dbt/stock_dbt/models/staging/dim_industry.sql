{{ config(
    materialized='incremental',
    unique_key = 'industry_id'
)}}
SELECT 
    industry_id,
    industry_name,
    sector_name,
    inserted_at::DATE AS date_key
FROM {{ source('stock_data', 'industry') }}