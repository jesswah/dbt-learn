{% test not_null_or_test(model, column_name, column_id) %}

SELECT 
    *
FROM {{ model }}
WHERE 
    {{ column_name }} IS NULL 
    AND {{ column_id }} NOT LIKE '%test%'

{% endtest %}