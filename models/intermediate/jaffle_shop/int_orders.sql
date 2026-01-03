WITH
orders AS (
    SELECT *
    FROM {{ ref('stg_orders') }}
),

customers AS (
    SELECT *
    FROM {{ ref('stg_customers') }}
),

locations AS (
    SELECT *
    FROM {{ ref('stg_locations') }}
)

SELECT
    orders.order_id,
    orders.location_id,
    orders.customer_id,
    orders.order_total,
    orders.tax_paid,
    orders.ordered_at,
    customers.customer_name,
    locations.location_name,
    locations.tax_rate,
    locations.location_opened_at
FROM
    orders
    LEFT JOIN customers
        ON orders.customer_id = customers.customer_id
    LEFT JOIN locations
        ON orders.location_id = locations.location_id
