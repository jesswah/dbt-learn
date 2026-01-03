WITH 
orders AS (
    SELECT * 
    FROM {{ ref('int_orders') }}
)

SELECT
    order_id,
    location_id,
    customer_id,
    order_total,
    tax_paid,
    ordered_at,
    customer_name,
    location_name,
    tax_rate,
    location_opened_at,
    DATE_PART(MONTH, ordered_at) AS ordered_month,
    DATE_PART(DAY, ordered_at) AS ordered_day,
    DATE_PART(YEAR, ordered_at) AS ordered_year
FROM orders
