WITH
source AS (
    SELECT *
    FROM {{ source('jaffle_shop', 'supplies') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['id', 'sku']) }} AS supply_uuid,
    id AS supply_id,
    sku AS product_id,
    name AS supply_name,
    (cost / 100.0) AS supply_cost,
    perishable AS is_perishable_supply
FROM source
