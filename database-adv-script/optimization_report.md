# Optimization Report

## Initial Query
The initial query retrieved all booking records along with detailed user, property, and payment information:

```sql
SELECT 
    b.id AS booking_id,
    u.id AS user_id, u.name AS user_name, u.email AS user_email,
    p.id AS property_id, p.name AS property_name, p.location,
    pay.id AS payment_id, pay.amount, pay.status, pay.method
FROM bookings b
JOIN users u ON b.user_id = u.id
JOIN properties p ON b.property_id = p.id
JOIN payments pay ON b.payment_id = pay.id;
