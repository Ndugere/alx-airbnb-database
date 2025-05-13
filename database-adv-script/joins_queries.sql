-- 1. INNER JOIN to retrieve all bookings and the respective users who made those bookings
SELECT 
    bookings.booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    bookings.total_price,
    bookings.status,
    users.user_id,
    users.first_name,
    users.last_name,
    users.email
FROM bookings
INNER JOIN users ON bookings.user_id = users.user_id;


-- 2. LEFT JOIN to retrieve all properties and their reviews, including properties that have no reviews
SELECT 
    properties.property_id,
    properties.name AS property_name,
    properties.description,
    properties.location,
    properties.pricepernight,
    reviews.review_id,
    reviews.rating,
    reviews.comment,
    reviews.created_at AS review_date,
    reviews.user_id AS reviewer_id
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id;


-- 3. FULL OUTER JOIN to retrieve all users and all bookings,
-- including users with no bookings and bookings with no valid user
SELECT 
    users.user_id,
    users.first_name,
    users.last_name,
    users.email,
    bookings.booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    bookings.total_price,
    bookings.status
FROM users
FULL OUTER JOIN bookings ON users.user_id = bookings.user_id;


