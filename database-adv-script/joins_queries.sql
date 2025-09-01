-- 1. INNER JOIN: Retrieve all bookings and the respective users who made those bookings
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


-- 2. LEFT JOIN: Retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    p.property_id,
    p.property_name,
    p.location,
    r.review_id,
    r.rating,
    r.comment
FROM properties p
LEFT JOIN reviews r 
    ON p.property_id = r.property_id;


-- 3. FULL OUTER JOIN: Retrieve all users and all bookings, even if the user has no booking or a booking is not linked to a user
-- Note: If using PostgreSQL or SQL Server, you can use FULL OUTER JOIN directly:
SELECT 
    u.user_id,
    u.name,
    b.booking_id,
    b.property_id,
    b.date
FROM users u
FULL OUTER JOIN bookings b
    ON u.user_id = b.user_id;

-- If using MySQL (since FULL OUTER JOIN is not supported), use UNION of LEFT and RIGHT joins:
-- SELECT 
--     u.user_id, u.name, b.booking_id, b.property_id, b.date
-- FROM users u
-- LEFT JOIN bookings b ON u.user_id = b.user_id
-- UNION
-- SELECT 
--     u.user_id, u.name, b.booking_id, b.property_id, b.date
-- FROM users u
-- RIGHT JOIN bookings b ON u.user_id = b.user_id;
