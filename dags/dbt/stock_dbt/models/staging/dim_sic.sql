{{ config(
    materialized='incremental',
    unique_key = 'sic_code'
)}}
SELECT 
    sic_code,
    fama_id,
    sic_industry,
    sic_sector,
    inserted_at::DATE AS date_key
FROM {{ source('stock_data', 'sic_classification') }}