SELECT *
FROM {{ ref('stg_sql_server_dbo__orders') }} 
WHERE status = 'shipped' AND tracking_id = ''