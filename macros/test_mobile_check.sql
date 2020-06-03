-- https://docs.getdbt.com/docs/writing-code-in-dbt/extending-dbts-programming-environment/custom-schema-tests
{% macro test_mobile_check(model, column_name) %}
with validation as (
    select
        {{column_name}} as mobile_field
    from {{model}}
),
validation_errors as (
    select
        mobile_field
    from validation
    -- if this is true, then date_field is actually not in the desired format!
    where length(mobile_field) !=10
)
select count(*)
from validation_errors
{% endmacro %}