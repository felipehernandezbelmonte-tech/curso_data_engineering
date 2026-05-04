{{ config(materialized='table') }}

select
        o.order_id,
        o.shipping_service,
        o.address_id,
        o.user_id,
        o.delivered_at,
        o.tracking_id,
        o.status,
        o._fivetran_deleted,
        o._fivetran_synced,
    cast(o.created_at as timestamp_ntz) as order_date,
    a.country as address_country,
    TRY_CAST(REPLACE(o.order_total::STRING, ',', '.') AS NUMBER(18, 2)) as ORDER_TOTAL,
    TRY_CAST(REPLACE(o.order_cost::STRING, ',', '.') AS NUMBER(18, 2)) as ORDER_COST,
    TRY_CAST(REPLACE(o.shipping_cost::STRING, ',', '.') AS NUMBER(18, 2)) as SHIPPING_COST
from {{ ref('dim_orders') }} o
    inner join {{ ref('dim_addresses') }} a on o.address_id = a.address_id
    inner join {{ ref('dim_users') }} u on o.user_id = u.user_id
