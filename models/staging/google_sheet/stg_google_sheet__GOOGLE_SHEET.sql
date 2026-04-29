{{ config(materialized='view') }}


with 

source as (

    select * from {{ source('google_sheet', 'GOOGLE_SHEET') }}

),

renamed as (

    select
        _row,
        quantity,
        month,
        product_id,
        _fivetran_synced

    from source

)

select * from renamed