with payments as (
    select * from {{ ref('stg_payments') }}
),
customers as (
    select * from {{ ref('stg_customers') }}
),
orders as (
    select * from {{ ref('stg_orders') }}
),
renamed as (
    select order_id,sum(amount) as total_amount
    from payments
    group by order_id
),
final as (
    select *
    from orders
    left join customers using (customer_id)
    left join renamed using(order_id)
)
select * from final