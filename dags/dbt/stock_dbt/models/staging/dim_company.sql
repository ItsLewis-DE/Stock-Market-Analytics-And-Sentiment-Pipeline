{{ config(
    materialized='incremental',
    unique_key = 'company_id'
)}}
SELECT
    company_id,
    company_name,
    ticker,
    cik,
    cusip,
    exchange_id,
    isdelisted,
    industry_id,
    TRIM(SPLIT_PART(location,';',1)) AS STATE,
    TRIM(SPLIT_PART(location,';',2)) AS COUNTRY,
    currency,
    category,
    sic_code,
    inserted_at::DATE as date_key
FROM {{ source('stock_data', 'company') }}
