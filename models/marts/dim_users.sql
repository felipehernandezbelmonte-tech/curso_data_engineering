{{ config(materialized='table') }}

select 
        user_id,
        updated_at,
        address_id,
        last_name,
        created_at,
        phone_number,
        total_orders,
        first_name,
        email,
        _fivetran_deleted,
        _fivetran_synced

from {{ ref('stg_POSGRE__POSGRE_USER') }}