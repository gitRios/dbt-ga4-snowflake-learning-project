select
    {{ dbt_utils.generate_surrogate_key(['session_id', 'user_pseudo_id']) }} as session_pk,
    session_id,
    user_pseudo_id,
    min(event_date)              as session_date,
    any_value(traffic_source)    as traffic_source,
    any_value(traffic_medium)    as traffic_medium,
    count(*)                     as event_count,
    sum(purchase_revenue)        as session_revenue
from {{ ref('stg_ga4_events') }}
where session_id is not null
group by session_id, user_pseudo_id