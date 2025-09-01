-- Drop table if it exists
DROP TABLE IF EXISTS bookings;

-- Create the parent bookings table (partitioned by RANGE on start_date)
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    payment_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    created_at TIMESTAMP DEFAULT NOW()
) PARTITION BY RANGE (start_date);

-- Create partitions for each year (example: 2022, 2023, 2024)
CREATE TABLE bookings_2022 PARTITION OF bookings
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE bookings_2023 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

CREATE TABLE bookings_2024 PARTITION OF bookings
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Example query on the partitioned table
-- Fetch bookings in a specific date range (uses partition pruning)
SELECT *
FROM bookings
WHERE start_date BETWEEN '2023-06-01' AND '2023-06-30';
