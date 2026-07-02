# GA4 → Snowflake → dbt Project

A small analytics engineering project demonstrating data modeling, testing, and documentation
using dbt and Snowflake, built on Google Analytics 4 sample e-commerce event data.

## What it does
- Loads raw GA4 events into Snowflake
- Cleans and types the data in a staging model
- Aggregates events into a session-level mart (event counts, revenue, traffic source/medium)
- Validates data quality with not_null, unique, and a custom revenue reconciliation test
- Auto-generates documentation and a lineage graph via `dbt docs generate` (now it is `dbt compile --write-catalog`)

## Why I built this
I wanted hands-on experience with dbt and Snowflake, applying the same data quality and
reconciliation patterns I use professionally (e.g. building automated reconciliation pipelines
for bank account balances) to a marketing analytics dataset.

## Diagram
<img width="1165" height="524" alt="image" src="https://github.com/user-attachments/assets/0d29f55d-2084-4fb9-8f75-d9d8bbce8f51" />
