SELECT * FROM green_taxi_data
LIMIT 10;

SELECT MAX(total_amount)FROM green_taxi_data;

SELECT * FROM zones
LIMIT 10;

SELECT * FROM zones
WHERE "Zone"='Astoria';

SELECT z."Borough", z."Zone", MAX(g.tip_amount)
FROM zones z
JOIN green_taxi_data g ON g."DOLocationID"=z."LocationID"
--WHERE z."Zone"='Astoria'
GROUP BY z."Borough", z."Zone"
ORDER BY MAX(g.tip_amount) DEsc;

SELECT z."Zone",g."PULocationID",g."DOLocationID", MAX(g.tip_amount)
FROM zones z
JOIN green_taxi_data g ON g."DOLocationID"=z."LocationID"
WHERE g."PULocationID"=7
GROUP BY z."Zone", g."PULocationID", g."DOLocationID"
ORDER BY MAX(g.tip_amount) DEsc
limit 1;

SELECT zones."Borough", SUM(g.total_amount) FROM green_taxi_data g
INNER JOIN zones ON g."DOLocationID"=zones."LocationID"
WHERE DATE(lpep_pickup_datetime) = '2019-09-18'
GROUP BY zones."Borough"
HAVING SUM(g.total_amount)> 50000
ORDER BY SUM(g.total_amount) DESC;


SELECT COUNT(*) AS total_trips
FROM green_taxi_data
WHERE DATE(lpep_pickup_datetime) = '2019-09-18'
AND DATE(lpep_dropoff_datetime) = '2019-09-18';


SELECT lpep_pickup_datetime, MAX(trip_distance)
FROM green_taxi_data
GROUP BY lpep_pickup_datetime
ORDER BY MAX(trip_distance) DESC 
LIMIT 1;

SELECT MAX(trip_distance)
FROM green_taxi_data;