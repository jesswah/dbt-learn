WITH
source AS (
    SELECT *
    FROM {{ source('jaffle_shop', 'items') }}
)

SELECT
    id AS order_item_id,
    order_id,
    sku AS product_id
FROM source
