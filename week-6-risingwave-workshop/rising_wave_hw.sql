--Question 1: 
--Create a materialized view to compute the average, min and max trip time between each taxi zone.
--From this MV, find the pair of taxi zones with the highest average trip time.

CREATE MATERIALIZED VIEW trip_time_stats AS
SELECT 
    tz1.zone AS pickup_zone,
    tz2.zone AS dropoff_zone,
    AVG(EXTRACT(EPOCH FROM (tpep_dropoff_datetime - tpep_pickup_datetime))) AS avg_trip_time,
    MIN(EXTRACT(EPOCH FROM (tpep_dropoff_datetime - tpep_pickup_datetime))) AS min_trip_time,
    MAX(EXTRACT(EPOCH FROM (tpep_dropoff_datetime - tpep_pickup_datetime))) AS max_trip_time
FROM 
    trip_data td
JOIN 
    taxi_zone tz1 ON td.pulocationid = tz1.location_id
JOIN 
    taxi_zone tz2 ON td.dolocationid = tz2.location_id
GROUP BY 
    tz1.zone, tz2.zone;

SELECT 
    pickup_zone,
    dropoff_zone,
    avg_trip_time
FROM 
    trip_time_stats
ORDER BY 
    avg_trip_time DESC
LIMIT 1;

--Question 2:
--Recreate the MV(s) in question 1, to also find the number of trips for the pair of taxi zones with the highest average trip time.

CREATE MATERIALIZED VIEW trip_time_stats_with_count AS
SELECT 
    tz1.zone AS pickup_zone,
    tz2.zone AS dropoff_zone,
    COUNT(*) AS num_trips,
    AVG(EXTRACT(EPOCH FROM (tpep_dropoff_datetime - tpep_pickup_datetime))) AS avg_trip_time,
    MIN(EXTRACT(EPOCH FROM (tpep_dropoff_datetime - tpep_pickup_datetime))) AS min_trip_time,
    MAX(EXTRACT(EPOCH FROM (tpep_dropoff_datetime - tpep_pickup_datetime))) AS max_trip_time
FROM 
    trip_data td
JOIN 
    taxi_zone tz1 ON td.pulocationid = tz1.location_id
JOIN 
    taxi_zone tz2 ON td.dolocationid = tz2.location_id
GROUP BY 
    tz1.zone, tz2.zone;

SELECT 
    pickup_zone,
    dropoff_zone,
    num_trips,
    avg_trip_time
FROM 
    trip_time_stats_with_count
ORDER BY 
    avg_trip_time DESC
LIMIT 1;

--Question 3:
--From the latest pickup time to 17 hours before, what are the top 3 busiest zones in terms of number of pickups?
SELECT 
    tz.zone AS pickup_zone,
    COUNT(*) AS num_pickups
FROM 
    trip_data td
JOIN 
    taxi_zone tz ON td.pulocationid = tz.location_id
WHERE 
    td.tpep_pickup_datetime >= (SELECT MAX(tpep_pickup_datetime) - INTERVAL '17 hours' FROM trip_data)
    AND td.tpep_pickup_datetime <= (SELECT MAX(tpep_pickup_datetime) FROM trip_data)
GROUP BY 
    tz.zone
ORDER BY 
    num_pickups DESC
LIMIT 3;