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

