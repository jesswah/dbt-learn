WITH orders AS (
    SELECT * 
    FROM {{ ref('int_orders') }}
),

order_items AS (
    SELECT * 
    FROM {{ ref('stg_order_items') }}
)

SELECT
    order_items.*,
    orders.location_id,
    orders.customer_id,
    orders.order_total,
    orders.tax_paid,
    orders.ordered_at,
    orders.customer_name,
    orders.location_name,
    orders.tax_rate,
    orders.location_opened_at

FROM orders
    INNER JOIN order_items
        ON orders.order_id = order_items.order_id
