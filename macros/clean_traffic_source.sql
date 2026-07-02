-- Macro that cleans up a traffic source/medium string
-- a genuinely useful marketing analytics operation (standardizing (none), (not set), empty strings to a clean NULL or 'direct').

{% macro clean_traffic_source(column_name) %}
    case
        when {{ column_name }} in ('(none)', '(data deleted)', '(not set)', '(not provided)', '') then NULL
        when {{ column_name }} is null then NULL
        else lower(trim({{ column_name }}))
    end
{% endmacro %}