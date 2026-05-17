{{ config(
    materialized='incremental',
    unique_key = 'article_id'
)}}
SELECT 
    {{ dbt_utils.generate_surrogate_key(
        ["title","url","time_published","authors","source_domain","overall_sentiment_score","overall_sentiment_label"]
    )}} AS article_id,
    title,
    url,
    TO_TIMESTAMP(time_published,'YYYYMMDD"T"HH24MISS') AS time_published,
    COALESCE(f.value::STRING,'') AS authors,
    summary,
    source,
    category_within_source,
    source_domain,
    overall_sentiment_score,
    overall_sentiment_label
FROM {{ source('stock_data', 'news') }} n,
LATERAL FLATTEN(input => PARSE_JSON(n.authors),outer=>true) f,

