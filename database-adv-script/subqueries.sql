-- Query 1: Retrieve all properties with an average rating greater than 4.0
SELECT *
FROM properties
WHERE property_id IN (
    -- Subquery: Get property IDs where the average rating from reviews is greater than 4.0
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);

-- Query 2: Retrieve all users who have made more than 3 bookings (using a correlated subquery)
SELECT *
FROM users u
WHERE (
    -- Correlated subquery: Count number of bookings for each user
    SELECT COUNT(*)
    FROM bookings b
    WHERE b.user_id = u.user_id
) > 3;
