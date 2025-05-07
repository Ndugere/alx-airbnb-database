-- USERS
INSERT INTO users (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (uuid_generate_v4(), 'Alice', 'Kariuki', 'alice@example.com', 'hashedpass123', '0711223344', 'guest'),
  (uuid_generate_v4(), 'Bob', 'Kamau', 'bob@example.com', 'hashedpass456', '0722334455', 'host'),
  (uuid_generate_v4(), 'Carol', 'Otieno', 'carol@example.com', 'hashedpass789', '0733445566', 'admin');

-- PROPERTIES
-- Assuming Bob is a host (index 2 above)
INSERT INTO properties (property_id, host_id, name, description, location, pricepernight)
VALUES
  (uuid_generate_v4(), (SELECT user_id FROM users WHERE email='bob@example.com'), 
   'Nairobi Studio Apartment', 'A modern, fully-furnished studio in Westlands.', 'Nairobi', 4500.00),
  (uuid_generate_v4(), (SELECT user_id FROM users WHERE email='bob@example.com'), 
   'Mombasa Beach House', 'A beachfront house with ocean views.', 'Mombasa', 8500.00);

-- BOOKINGS
-- Assuming Alice is booking
INSERT INTO bookings (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (uuid_generate_v4(), 
   (SELECT property_id FROM properties WHERE name='Nairobi Studio Apartment'), 
   (SELECT user_id FROM users WHERE email='alice@example.com'),
   '2025-08-01', '2025-08-05', 18000.00, 'confirmed'),
  (uuid_generate_v4(), 
   (SELECT property_id FROM properties WHERE name='Mombasa Beach House'), 
   (SELECT user_id FROM users WHERE email='alice@example.com'),
   '2025-09-10', '2025-09-15', 42500.00, 'pending');

-- PAYMENTS
INSERT INTO payments (payment_id, booking_id, amount, payment_method)
VALUES
  (uuid_generate_v4(), 
   (SELECT booking_id FROM bookings WHERE total_price = 18000.00), 
   18000.00, 'credit_card');

-- REVIEWS
INSERT INTO reviews (review_id, property_id, user_id, rating, comment)
VALUES
  (uuid_generate_v4(), 
   (SELECT property_id FROM properties WHERE name='Nairobi Studio Apartment'), 
   (SELECT user_id FROM users WHERE email='alice@example.com'),
   5, 'Great location, super clean and responsive host.');

-- MESSAGES
INSERT INTO messages (message_id, sender_id, recipient_id, message_body)
VALUES
  (uuid_generate_v4(), 
   (SELECT user_id FROM users WHERE email='alice@example.com'), 
   (SELECT user_id FROM users WHERE email='bob@example.com'),
   'Hi Bob, is your Mombasa house available for next weekend?');
