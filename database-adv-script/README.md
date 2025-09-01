# Complex SQL Queries with Joins

This project demonstrates how to use different types of SQL joins to retrieve data from multiple related tables in the **alx-airbnb-database** project.

---

## Queries Implemented

### 1. INNER JOIN
```sql
SELECT 
    b.booking_id,
    b.property_id,
    b.date,
    u.user_id,
    u.name,
    u.email
FROM bookings b
INNER JOIN users u 
    ON b.user_id = u.user_id;
