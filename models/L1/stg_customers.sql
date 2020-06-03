with source as (

    {#-
    Normally we would select from the table here, but we are using seeds to load
    our data in this project
    #}
    select * from {{ source('rahul_jaffle_shop', 'raw_customers') }}

),

renamed as (

    select
        id as customer_id,
        initials,
        first_name,
        last_name,
        email,
        gender,
        mobile

    from source

)

select * from renamed
