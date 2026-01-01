{% test greater_than_number(model, column_name, value) %}

SELECT 
    {{ column_name }}
FROM {{ model }}
WHERE 
    {{ column_name }} <= {{ value }}

{% endtest %}