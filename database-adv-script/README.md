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

# Practice Subqueries

This project demonstrates how to use **correlated** and **non-correlated subqueries** in SQL within the **alx-airbnb-database** project.

---

## Queries Implemented

### 1. Non-Correlated Subquery
```sql
SELECT 
    p.property_id,
    p.property_name,
    p.location
FROM properties p
WHERE p.property_id IN (
    SELECT r.property_id
    FROM reviews r
    GROUP BY r.property_id
    HAVING AVG(r.rating) > 4.0
);

# Aggregations and Window Functions

This project demonstrates how to use **SQL aggregation** and **window functions** to analyze booking and property data in the **alx-airbnb-database**.

---

## Queries Implemented

### 1. Aggregation with COUNT + GROUP BY
```sql
SELECT 
    u.user_id,
    u.name,
    COUNT(b.booking_id) AS total_bookings
FROM users u
LEFT JOIN bookings b 
    ON u.user_id = b.user_id
GROUP BY u.user_id, u.name
ORDER BY total_bookings DESC;


