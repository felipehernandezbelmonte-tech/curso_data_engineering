{{ config(materialized='table') }}

select *
from {{ ref('stg_POSGRE__POSGRE_ADRESSES') }}