# Index Performance Analysis

## Indexes Created
- `users.user_id`
- `bookings.user_id`
- `bookings.property_id`
- `properties.property_id`
- `reviews.property_id`
- `reviews.rating`

SQL file: [database_index.sql](./database_index.sql)

---

## Performance Measurement

### Example Query (Before Indexing)
```sql
EXPLAIN ANALYZE
SELECT u.user_id, u.name, COUNT(b.booking_id) AS total_bookings
FROM users u
JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;
