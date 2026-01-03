WITH products AS (
    SELECT *
    FROM {{ ref('stg_products') }}
),

supplies AS (
    SELECT *
    FROM {{ ref('stg_supplies') }}
),

product_supplies_summary AS (
    SELECT
        product_id,
        SUM(supply_cost) AS supply_cost
    FROM supplies
    GROUP BY 1
)

SELECT
    products.*,
    product_supplies_summary.supply_cost
FROM products
    LEFT JOIN product_supplies_summary
        ON products.product_id = product_supplies_summary.product_id
