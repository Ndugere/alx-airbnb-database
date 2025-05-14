SELECT 
  b.booking_id, 
  u.user_first_name, 
  p.property_name, 
  p.property_location, 
  payments.amount 
FROM 
  bookings AS b
INNER JOIN users AS u 
  ON b.user_id = u.user_id
INNER JOIN properties AS p 
  ON p.property_id = b.property_id
INNER JOIN payments 
  ON payments.booking_id = b.booking_id;



EXPLAIN ANALYZE
SELECT 
  b.booking_id, 
  u.user_first_name, 
  p.property_name, 
  p.property_location, 
  payments.amount 
FROM 
  bookings AS b
INNER JOIN users AS u 
  ON b.user_id = u.user_id
INNER JOIN properties AS p 
  ON p.property_id = b.property_id
INNER JOIN payments 
  ON payments.booking_id = b.booking_id;
