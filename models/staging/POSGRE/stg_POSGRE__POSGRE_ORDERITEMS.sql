{{ config(materialized='view') }}


with 

source as (

    select * from {{ source('POSGRE', 'POSGRE_ORDERITEMS') }}

),

renamed as (

    select
        ORDER_ID,
	    PRODUCT_ID,
	    QUANTITY,
	    _FIVETRAN_DELETED,
	    _FIVETRAN_SYNCED
    from source

)

select * from renamed