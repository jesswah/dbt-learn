WITH
    source AS (
        SELECT * 
        FROM {{ source('jaffle_shop', 'stores') }}
    )

SELECT
    id AS location_id,
    name AS location_name,
    tax_rate,
    opened_at AS location_opened_at
FROM source
