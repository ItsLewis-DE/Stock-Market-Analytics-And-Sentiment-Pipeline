{{ config(
    materialized='incremental',
    unique_key = 'article_id'
)}}
SELECT 
    {{ dbt_utils.generate_surrogate_key(
        ["ticker","relevance_score_ticker","ticker_sentiment_label","ticker_sentiment_score","date_key"]
    )}} AS article_id,
    ticker,
    relevance_score_ticker,
    ticker_sentiment_label,
    ticker_sentiment_score,
    date_key
FROM {{ ref('dim_news') }}