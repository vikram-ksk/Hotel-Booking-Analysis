CREATE DATABASE IF NOT EXISTS HotelBookingDB;
USE HotelBookingDB;
SELECT DATABASE();
CREATE TABLE hotel_bookings (
    hotel VARCHAR(50),
    is_canceled INT,
    lead_time INT,
    arrival_date_year INT,
    arrival_date_month VARCHAR(20),
    arrival_date_week_number INT,
    arrival_date_day_of_month INT,
    stays_in_weekend_nights INT,
    stays_in_week_nights INT,
    adults INT,
    children DECIMAL(10,2),
    babies INT,
    meal VARCHAR(20),
    country VARCHAR(10),
    market_segment VARCHAR(50),
    distribution_channel VARCHAR(50),
    is_repeated_guest INT,
    previous_cancellations INT,
    previous_bookings_not_canceled INT,
    reserved_room_type VARCHAR(10),
    assigned_room_type VARCHAR(10),
    booking_changes INT,
    deposit_type VARCHAR(30),
    agent DECIMAL(10,2),
    company DECIMAL(10,2),
    days_in_waiting_list INT,
    customer_type VARCHAR(50),
    adr DECIMAL(12,2),
    required_car_parking_spaces INT,
    total_of_special_requests INT,
    reservation_status VARCHAR(30),
    reservation_status_date DATE,
    arrival_date_month_num INT,
    arrival_date DATE,
    total_nights INT,
    total_guests INT,
    estimated_revenue DECIMAL(14,2),
    revenue_at_risk DECIMAL(14,2),
    cancellation_status VARCHAR(30),
    has_deposit VARCHAR(10),
    lead_time_bucket VARCHAR(30)
);
SHOW TABLES;
DESCRIBE hotel_bookings;

SELECT COUNT(*) AS Total_Records
FROM hotel_bookings;

SELECT *
FROM hotel_bookings
LIMIT 10;

SELECT
    COUNT(*) AS Total_Rows,
    SUM(hotel IS NULL) AS Hotel_Nulls,
    SUM(is_canceled IS NULL) AS Cancellation_Nulls,
    SUM(lead_time IS NULL) AS Lead_Time_Nulls,
    SUM(adr IS NULL) AS ADR_Nulls,
    SUM(arrival_date IS NULL) AS Arrival_Date_Nulls,
    SUM(total_nights IS NULL) AS Nights_Nulls,
    SUM(total_guests IS NULL) AS Guests_Nulls,
    SUM(estimated_revenue IS NULL) AS Revenue_Nulls
FROM hotel_bookings;

SELECT
    COUNT(*) AS Total_Rows,
    COUNT(DISTINCT CONCAT_WS('|',
        hotel,
        arrival_date,
        lead_time,
        adults,
        children,
        babies,
        adr
    )) AS Unique_Records
FROM hotel_bookings;

SELECT COUNT(*) AS Total_Bookings
FROM hotel_bookings;

SELECT COUNT(*) AS Canceled_Bookings
FROM hotel_bookings
WHERE is_canceled = 1;

SELECT COUNT(*) AS Non_Canceled_Bookings
FROM hotel_bookings
WHERE is_canceled = 0;

SELECT
    ROUND(
        100.0 * SUM(is_canceled) / COUNT(*),
        2
    ) AS Cancellation_Rate
FROM hotel_bookings;

SELECT
    ROUND(AVG(adr), 2) AS Average_ADR
FROM hotel_bookings;

SELECT
    ROUND(AVG(lead_time), 2) AS Average_Lead_Time
FROM hotel_bookings;

SELECT
    ROUND(AVG(total_nights), 2) AS Average_Stay_Nights
FROM hotel_bookings;

SELECT
    ROUND(SUM(estimated_revenue), 2) AS Total_Estimated_Revenue
FROM hotel_bookings;

SELECT
    ROUND(SUM(revenue_at_risk), 2) AS Total_Revenue_At_Risk
FROM hotel_bookings;

##HOTEL ANALYSIS
SELECT
    hotel,
    COUNT(*) AS Total_Bookings,
    SUM(is_canceled) AS Canceled_Bookings,
    ROUND(
        100.0 * SUM(is_canceled) / COUNT(*),
        2
    ) AS Cancellation_Rate
FROM hotel_bookings
GROUP BY hotel;

##MARKET SEGMENT ANALYSIS
SELECT
    market_segment,
    COUNT(*) AS Total_Bookings,
    SUM(is_canceled) AS Canceled_Bookings,
    ROUND(
        100.0 * SUM(is_canceled) / COUNT(*),
        2
    ) AS Cancellation_Rate
FROM hotel_bookings
GROUP BY market_segment
ORDER BY Cancellation_Rate DESC;

##LEAD TIME ANALYSIS
SELECT
    lead_time_bucket,
    COUNT(*) AS Total_Bookings,
    SUM(is_canceled) AS Canceled_Bookings,
    ROUND(
        100.0 * SUM(is_canceled) / COUNT(*),
        2
    ) AS Cancellation_Rate
FROM hotel_bookings
GROUP BY lead_time_bucket
ORDER BY
    CASE lead_time_bucket
        WHEN '0-7 days' THEN 1
        WHEN '8-30 days' THEN 2
        WHEN '31-90 days' THEN 3
        WHEN '90+ days' THEN 4
    END;
    
##DEPOSIT TYPE ANALYSIS
SELECT
    deposit_type,
    COUNT(*) AS Total_Bookings,
    SUM(is_canceled) AS Canceled_Bookings,
    ROUND(
        100.0 * SUM(is_canceled) / COUNT(*),
        2
    ) AS Cancellation_Rate
FROM hotel_bookings
GROUP BY deposit_type
ORDER BY Cancellation_Rate DESC;

##CUSTOMER TYPE
SELECT
    customer_type,
    COUNT(*) AS Total_Bookings,
    SUM(is_canceled) AS Canceled_Bookings,
    ROUND(
        100.0 * SUM(is_canceled) / COUNT(*),
        2
    ) AS Cancellation_Rate
FROM hotel_bookings
GROUP BY customer_type
ORDER BY Total_Bookings DESC;

##DISTRIBUTION CHANNEL
SELECT
    distribution_channel,
    COUNT(*) AS Total_Bookings,
    SUM(is_canceled) AS Canceled_Bookings,
    ROUND(
        100.0 * SUM(is_canceled) / COUNT(*),
        2
    ) AS Cancellation_Rate
FROM hotel_bookings
GROUP BY distribution_channel
ORDER BY Total_Bookings DESC;

##REVENUE BY HOTEL
SELECT
    hotel,
    ROUND(SUM(estimated_revenue), 2) AS Estimated_Revenue,
    ROUND(SUM(revenue_at_risk), 2) AS Revenue_At_Risk
FROM hotel_bookings
GROUP BY hotel
ORDER BY Estimated_Revenue DESC;

##MONTHLY BOOKING ANALYSIS
SELECT
    arrival_date_year AS Year,
    arrival_date_month_num AS Month_Number,
    arrival_date_month AS Month,
    COUNT(*) AS Total_Bookings
FROM hotel_bookings
GROUP BY
    arrival_date_year,
    arrival_date_month_num,
    arrival_date_month
ORDER BY
    Year,
    Month_Number;
    
##TOP 10 COUNTRIES
SELECT
    country,
    COUNT(*) AS Total_Bookings
FROM hotel_bookings
GROUP BY country
ORDER BY Total_Bookings DESC
LIMIT 10;

##REPEAT VS NEW GUESTS
SELECT
    CASE
        WHEN is_repeated_guest = 1 THEN 'Repeat Guest'
        ELSE 'New Guest'
    END AS Guest_Type,
    COUNT(*) AS Total_Bookings
FROM hotel_bookings
GROUP BY is_repeated_guest;

##ROOM TYPE ANALYSIS
SELECT
    reserved_room_type,
    COUNT(*) AS Total_Bookings,
    ROUND(AVG(adr), 2) AS Average_ADR
FROM hotel_bookings
GROUP BY reserved_room_type
ORDER BY Total_Bookings DESC;

##SPECIAL REQUESTS
SELECT
    total_of_special_requests,
    COUNT(*) AS Total_Bookings
FROM hotel_bookings
GROUP BY total_of_special_requests
ORDER BY total_of_special_requests;

##DENSE_RANK
SELECT
    hotel,
    market_segment,
    COUNT(*) AS Total_Bookings,
    DENSE_RANK() OVER (
        PARTITION BY hotel
        ORDER BY COUNT(*) DESC
    ) AS Segment_Rank
FROM hotel_bookings
GROUP BY hotel, market_segment;
