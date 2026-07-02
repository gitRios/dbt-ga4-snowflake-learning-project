with raw as (
    select * from {{ source('ga4', 'raw_ga4_events') }}
)

select
    user_pseudo_id,
    session_id,
    event_name,
    to_date(to_varchar(event_date), 'YYYYMMDD')     as event_date,
    to_timestamp_ntz(event_timestamp / 1000000)     as event_timestamp,
    {{ clean_traffic_source('source') }}             as traffic_source,
    {{ clean_traffic_source('medium') }}             as traffic_medium,
    coalesce(purchase_revenue, 0)                   as purchase_revenue
from raw
where to_date(to_varchar(event_date), 'YYYYMMDD')
    between '{{ var("start_date") }}' and '{{ var("end_date") }}'