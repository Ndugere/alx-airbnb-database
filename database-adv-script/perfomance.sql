EXPLAIN ANALYZE
SELECT 
  b.booking_id, 
  u.user_first_name, 
  p.property_name, 
  p.property_location, 
  pay.amount
FROM 
  bookings AS b
JOIN users AS u ON b.user_id = u.user_id
JOIN properties AS p ON b.property_id = p.property_id
JOIN payments AS pay ON pay.booking_id = b.booking_id
WHERE 
  b.start_date IS NOT NULL
  AND pay.amount > 0;




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


