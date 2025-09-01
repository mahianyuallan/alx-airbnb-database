# Performance Monitoring and Refinement

## Monitoring Queries
We monitored the performance of frequently used queries with `EXPLAIN ANALYZE` and `SHOW PROFILE`. Example:

```sql
EXPLAIN ANALYZE
SELECT b.id, b.start_date, b.end_date, u.name, p.title
FROM Booking b
JOIN User u ON b.user_id = u.id
JOIN Property p ON b.property_id = p.id
WHERE b.start_date >= '2025-01-01'
  AND b.end_date <= '2025-01-31';
