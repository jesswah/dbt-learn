WITH
source AS (
    SELECT *
    FROM {{ source('jaffle_shop', 'orders') }}
)

SELECT
    id AS order_id,
    store_id AS location_id,
    customer AS customer_id,
    (order_total / 100.0) AS order_total,
    (tax_paid / 100.0) AS tax_paid,
    {{ dbt.date_trunc('day','ordered_at') }} AS ordered_at
FROM source
