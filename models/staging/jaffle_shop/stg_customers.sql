WITH
    source AS (
        SELECT * 
        FROM {{ source('jaffle_shop', 'customers') }}
    )

SELECT
    id AS customer_id,
    name AS customer_name
FROM source
