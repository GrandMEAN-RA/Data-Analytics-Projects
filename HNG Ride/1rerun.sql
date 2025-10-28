/* 1.sql
	Top 10 longest rides by distance
*/
DROP VIEW IF EXISTS Top_10_longest_rides_by_distance;
CREATE VIEW Top_10_longest_rides_by_distance AS 
	SELECT *
	FROM (
		SELECT rider_name, pickup_city, dropoff_city, distance_km, 
			method, driver_name, DENSE_RANK() OVER(ORDER BY distance_km DESC) AS ranks
		FROM datatable
		) AS ld
	WHERE ranks <= 10;
SELECT * FROM Top_10_longest_rides_by_distance;