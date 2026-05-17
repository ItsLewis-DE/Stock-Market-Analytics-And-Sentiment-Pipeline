{{ config(
    materialized='incremental',
    unique_key = 'fama_id'
)}}
SELECT 
    fama_id,
    fama_industry,
    fama_sector,
    inserted_at::DATE as date_key
FROM {{ source('stock_data', 'fama_classification') }}