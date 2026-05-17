{{ config(
    materialized='incremental',
    unique_key = 'news_grain_id'
)}}
SELECT 
    MD5(CONCAT_WS('||', 
    n.url, 
    COALESCE(f.value::STRING, ''), 
    COALESCE(t.value:"topic"::STRING, ''), 
    COALESCE(ts.value:"ticker"::STRING, '')
    )) AS news_grain_id,
    title,
    url,
    TO_TIMESTAMP(time_published,'YYYYMMDD"T"HH24MISS') AS time_published,
    COALESCE(f.value::STRING,'') AS authors,
    summary,
    source,
    category_within_source,
    source_domain,
    t.value:"topic"::STRING AS topic,
    t.value:"relevance_score"::FLOAT AS relevance_score_topic,
    overall_sentiment_score,
    overall_sentiment_label,
    ts.value:"relevance_score"::FLOAT AS relevance_score_ticker,
    ts.value:"ticker"::STRING AS ticker,
    ts.value:"ticker_sentiment_label"::STRING AS ticker_sentiment_label,
    ts.value:"ticker_sentiment_score"::FLOAT As ticker_sentiment_score,
    inserted_at::DATE AS date_key
FROM {{ source('stock_data', 'news') }} n,
LATERAL FLATTEN(input => PARSE_JSON(n.authors),outer=>true) f,
LATERAL FLATTEN(input=>PARSE_JSON(topics),outer=>true) t,
LATERAL FLATTEN(input=>PARSE_JSON(ticker_sentiment),outer=>true) ts