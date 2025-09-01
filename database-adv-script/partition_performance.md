# Partitioning Performance Report

## Objective
We implemented **table partitioning** on the `bookings` table using PostgreSQL’s `PARTITION BY RANGE` feature, with partitions based on the `start_date` column. This optimization targets queries that filter by date range.

---

## Test Queries

**Query on unpartitioned table:**
```sql
SELECT * 
FROM bookings
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';
