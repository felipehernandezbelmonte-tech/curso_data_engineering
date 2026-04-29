{{ config(materialized='view') }}


with 

source as (

    select * from {{ source('POSGRE', 'POSGRE_ADDRESSES') }}

),

renamed as (

    select
        ADDRESS_ID,
	    ZIPCODE,
	    COUNTRY,
        ADDRESS,
        STATE,
        _FIVETRAN_DELETED,
        _FIVETRAN_SYNCED

    from source

)

select * from renamed