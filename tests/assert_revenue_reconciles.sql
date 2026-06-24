-- Fails if total revenue in the mart doesn't match total revenue in staging.
-- Same logic pattern as reconciling SAP balances against bank statements.

with mart_total as (
    select sum(session_revenue) as total from {{ ref('mart_sessions') }}
),

staging_total as (
    select sum(purchase_revenue) as total from {{ ref('stg_ga4_events') }}
)

select *
from mart_total
cross join staging_total
where abs(mart_total.total - staging_total.total) > 0.01