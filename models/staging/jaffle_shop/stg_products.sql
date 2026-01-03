WITH
source AS (
    SELECT *
    FROM {{ source('jaffle_shop', 'products') }}
)

SELECT
    sku AS product_id,
    name AS product_name,
    type AS product_type,
    description AS product_description,
    (price / 100.0) AS product_price,
    COALESCE(type = 'jaffle', FALSE) AS is_food_item,
    COALESCE(type = 'beverage', FALSE) AS is_drink_item
FROM source
