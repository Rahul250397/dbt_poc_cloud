{% macro test_email_check(model, column_name) %}
with validation as (
    select
        {{column_name}} as email_field
    from {{model}}
),
validation_errors as (
    select
        email_field
    from validation
    -- if this is true, then date_field is actually not in the desired format!
    where email_field  NOT like '%@%'
)
select count(*)
from validation_errors
{% endmacro %}