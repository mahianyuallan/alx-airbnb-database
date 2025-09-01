-- database_index.sql

-- Indexes on frequently queried columns

CREATE INDEX idx_users_user_id ON users(user_id);

CREATE INDEX idx_bookings_user_id ON bookings(user_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

CREATE INDEX idx_properties_property_id ON properties(property_id);

CREATE INDEX idx_reviews_property_id ON reviews(property_id);
CREATE INDEX idx_reviews_rating ON reviews(rating);
