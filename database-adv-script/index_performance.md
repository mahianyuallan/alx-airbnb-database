# Index Performance Analysis

This document explains the indexes created for the **alx-airbnb-database** project and compares query performance before and after indexing.

---

## 1. Indexes Created
- **users.user_id** → speeds up joins between `users` and `bookings`/`reviews`.
- **bookings.user_id** → improves performance when filtering or joining on user bookings.
- **bookings.property_id** → optimizes joins between bookings and properties.
- **properties.property_id** → improves lookups on property information.
- **reviews.property_id** → accelerates joins between reviews and properties.
- **reviews.rating** → helps when filtering or sorting by rating.

SQL script: [`database_index.sql`](./database_index.sql)

---

## 2. Performance Measurement

### Example Query (before indexing)
```sql
EXPLAIN ANALYZE
SELECT u.user_id, u.name, COUNT(b.booking_id) AS total_bookings
FROM users u
JOIN bookings b ON u.user_id = b.user_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;
