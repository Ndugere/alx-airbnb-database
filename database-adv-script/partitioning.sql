-- Drop existing table (dangerous in production - only for testing)
DROP TABLE IF EXISTS bookings;

-- Create a new partitioned bookings table
CREATE TABLE bookings (
    booking_id INT NOT NULL,
    user_id INT NOT NULL,
    property_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    status VARCHAR(50),
    PRIMARY KEY (booking_id, start_date)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2021 VALUES LESS THAN (2022),
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);

-- Insert test data
INSERT INTO bookings (booking_id, user_id, property_id, start_date, end_date, status) VALUES
(1, 101, 201, '2021-05-10', '2021-05-15', 'confirmed'),
(2, 102, 202, '2022-06-01', '2022-06-05', 'cancelled'),
(3, 103, 203, '2023-07-15', '2023-07-20', 'confirmed'),
(4, 104, 204, '2024-08-10', '2024-08-15', 'confirmed'),
(5, 105, 205, '2025-09-20', '2025-09-25', 'pending');

-- Performance test query: Fetch bookings from 2022
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2022-01-01' AND '2022-12-31';

-- Performance test query: Fetch bookings from 2023 and 2024
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date BETWEEN '2023-01-01' AND '2024-12-31';

-- Performance test query: Specific date lookup
EXPLAIN ANALYZE
SELECT * FROM bookings
WHERE start_date = '2023-07-15';
