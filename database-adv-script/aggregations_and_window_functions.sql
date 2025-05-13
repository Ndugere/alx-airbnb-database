-- Query 1: Find total bookings made by each user
SELECT 
    u.user_id,                            -- Select the user ID
    u.first_name,                         -- Select the first name of the user
    u.last_name,                          -- Select the last name of the user
    COUNT(b.booking_id) AS total_bookings -- Count the total number of bookings for each user
FROM users u
JOIN bookings b ON u.user_id = b.user_id  -- Join the 'users' table with the 'bookings' table on user_id
GROUP BY u.user_id;                      -- Group the results by user_id to count bookings for each user

SELECT 
    p.property_id,
    p.name,
    COUNT(b.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(b.booking_id) DESC) AS rank
FROM properties p
LEFT JOIN bookings b ON p.property_id = b.property_id
GROUP BY p.property_id
ORDER BY rank;