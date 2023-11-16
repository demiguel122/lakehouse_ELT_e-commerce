{{
  config(
    materialized='view'
  )
}}

WITH src_events AS (
    SELECT * 
    FROM {{ source('sql_server_dbo', 'events') }}
    ),

renamed_casted AS (
    SELECT
         event_id,
         event_type,
         user_id,
         session_id,
         page_url,
         order_id,
         product_id,
         created_at,
         _fivetran_synced AS date_loaded
    FROM src_events
    )

SELECT * FROM renamed_casted