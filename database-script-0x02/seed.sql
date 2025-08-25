-- ===========================
-- AirBnB Sample Data Seed
-- ===========================

-- ---------------------------
-- 1. Roles
-- ---------------------------
INSERT INTO Role (role_name) VALUES 
('guest'),
('host'),
('admin');

-- ---------------------------
-- 2. Payment Methods
-- ---------------------------
INSERT INTO PaymentMethod (method_name) VALUES
('credit_card'),
('paypal'),
('stripe');

-- ---------------------------
-- 3. Users
-- ---------------------------
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role_id)
VALUES
(gen_random_uuid(), 'Alice', 'Johnson', 'alice@example.com', 'hash1', '+254700111111', 1), -- guest
(gen_random_uuid(), 'Bob', 'Smith', 'bob@example.com', 'hash2', '+254700222222', 2),       -- host
(gen_random_uuid(), 'Charlie', 'Brown', 'charlie@example.com', 'hash3', '+254700333333', 1),
(gen_random_uuid(), 'David', 'Lee', 'david@example.com', 'hash4', '+254700444444', 2),
(gen_random_uuid(), 'Emma', 'Williams', 'emma@example.com', 'hash5', '+254700555555', 3);   -- admin

-- ---------------------------
-- 4. Properties
-- ---------------------------
INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
SELECT gen_random_uuid(), user_id, 'Cozy Apartment', 'A cozy apartment in the city center.', 'Nairobi, Kenya', 50.00
FROM User WHERE role_id = 2 LIMIT 1;

INSERT INTO Property (property_id, host_id, name, description, location, price_per_night)
SELECT gen_random_uuid(), user_id, 'Beach House', 'Spacious beach house with ocean view.', 'Mombasa, Kenya', 120.00
FROM User WHERE role_id = 2 LIMIT 1 OFFSET 1;

-- ---------------------------
-- 5. Bookings
-- ---------------------------
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
SELECT gen_random_uuid(), property_id, (SELECT user_id FROM User WHERE role_id = 1 LIMIT 1), '2025-09-01', '2025-09-05', 50.00*4, 'confirmed'
FROM Property WHERE name = 'Cozy Apartment';

INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
SELECT gen_random_uuid(), property_id, (SELECT user_id FROM User WHERE role_id = 1 LIMIT 1 OFFSET 1), '2025-10-10', '2025-10-15', 120.00*5, 'pending'
FROM Property WHERE name = 'Beach House';

-- ---------------------------
-- 6. Payments
-- ---------------------------
INSERT INTO Payment (payment_id, booking_id, amount, method_id)
SELECT gen_random_uuid(), booking_id, total_price, 1
FROM Booking WHERE status = 'confirmed';

-- ---------------------------
-- 7. Reviews
-- ---------------------------
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
SELECT gen_random_uuid(), property_id, (SELECT user_id FROM User WHERE role_id = 1 LIMIT 1), 5, 'Amazing stay! Highly recommended.'
FROM Property WHERE name = 'Cozy Apartment';

INSERT INTO Review (review_id, property_id, user_id, rating, comment)
SELECT gen_random_uuid(), property_id, (SELECT user_id FROM User WHERE role_id = 1 LIMIT 1 OFFSET 1), 4, 'Great location, very comfortable.'
FROM Property WHERE name = 'Beach House';

-- ---------------------------
-- 8. Messages
-- ---------------------------
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
SELECT gen_random_uuid(), (SELECT user_id FROM User WHERE first_name='Alice'), (SELECT user_id FROM User WHERE first_name='Bob'), 'Hi Bob, is the apartment available for September?';

INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
SELECT gen_random_uuid(), (SELECT user_id FROM User WHERE first_name='Bob'), (SELECT user_id FROM User WHERE first_name='Alice'), 'Yes Alice, it is available. You can proceed to book.';
