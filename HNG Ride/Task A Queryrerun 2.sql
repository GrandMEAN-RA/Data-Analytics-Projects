CREATE TABLE hngridersdata_merged AS (
	SELECT  *
	FROM (
		SELECT  r.name AS "rider_name", r.signup_date AS "riders_signup_date", r.city AS "rider_city", r.email,
			request_time, pickup_time, dropoff_time, pickup_city, dropoff_city, distance_km, status,fare, 
			p.payment_id, p.amount, p.method, p.paid_date,
            d.name AS "driver_name", d.city AS "driver_city" , d.signup_date AS "drivers_signup_date", d.rating 
		FROM rides as rides
			INNER JOIN drivers as d ON d.driver_id = rides.driver_id
			INNER JOIN riders as r ON r.rider_id = rides.rider_id
			INNER JOIN payments as p ON p.ride_id = rides.ride_id
		) AS joined
	);
SELECT * FROM hngridersdata_merged;

DESCRIBE hngridersdata_merged;

-- ensure proper date formats
UPDATE hngridersdata_merged
SET riders_signup_date = STR_TO_DATE(riders_signup_date, '%c/%e/%Y %H:%i');
ALTER TABLE hngridersdata_merged
MODIFY riders_signup_date DATETIME;
UPDATE hngridersdata_merged
SET drivers_signup_date = STR_TO_DATE(drivers_signup_date, '%c/%e/%Y %H:%i');
ALTER TABLE hngridersdata_merged
MODIFY drivers_signup_date DATETIME;
UPDATE hngridersdata_merged
SET request_time = STR_TO_DATE(request_time, '%c/%e/%Y %H:%i');
ALTER TABLE hngridersdata_merged
MODIFY request_time DATETIME;
UPDATE hngridersdata_merged
SET pickup_time = STR_TO_DATE(pickup_time, '%c/%e/%Y %H:%i');
ALTER TABLE hngridersdata_merged
MODIFY pickup_time DATETIME;
UPDATE hngridersdata_merged
SET dropoff_time = STR_TO_DATE(dropoff_time, '%c/%e/%Y %H:%i');
ALTER TABLE hngridersdata_merged
MODIFY dropoff_time DATETIME;
UPDATE hngridersdata_merged
SET paid_date = STR_TO_DATE(paid_date, '%c/%e/%Y %H:%i');
ALTER TABLE hngridersdata_merged
MODIFY paid_date DATETIME;

-- checking inconsistent data formats
SELECT DISTINCT(pickup_city), COUNT(*)	-- L.A 123, N.Y 217
FROM hngridersdata_merged
GROUP BY pickup_city;
UPDATE hngridersdata_merged
SET pickup_city = "Los Angeles"
WHERE pickup_city = "L.A";
UPDATE hngridersdata_merged
SET pickup_city = "New York"
WHERE pickup_city = "N.Y";

SELECT DISTINCT(dropoff_city), COUNT(*)	-- S.F 733
FROM hngridersdata_merged
GROUP BY dropoff_city;
UPDATE hngridersdata_merged
SET dropoff_city = "San Francisco"
WHERE dropoff_city = "S.F";

SELECT DISTINCT(rider_city), COUNT(*)	-- S.F 1182, L.A 226, N.Y 1558
FROM hngridersdata_merged
GROUP BY rider_city;
UPDATE hngridersdata_merged
SET rider_city = "San Francisco"
WHERE rider_city = "S.F";
UPDATE hngridersdata_merged
SET rider_city = "Los Angeles"
WHERE rider_city = "L.A";
UPDATE hngridersdata_merged
SET rider_city = "New York"
WHERE rider_city = "N.Y";

SELECT DISTINCT(driver_city), COUNT(*)	-- S.F 720, L.A 445, N.Y 762
FROM hngridersdata_merged
GROUP BY driver_city;
UPDATE hngridersdata_merged
SET driver_city = "San Francisco"
WHERE driver_city = "S.F";
UPDATE hngridersdata_merged
SET driver_city = "Los Angeles"
WHERE driver_city = "L.A";
UPDATE hngridersdata_merged
SET driver_city = "New York"
WHERE driver_city = "N.Y";

CREATE TABLE datatable AS (
	SELECT  *
	FROM hngridersdata_merged
	WHERE YEAR(drivers_signup_date)>=2021 AND MONTH(drivers_signup_date)>5 
		AND YEAR(riders_signup_date)>=2021 AND MONTH(riders_signup_date)>5 
        AND YEAR(paid_date)>=2021 AND MONTH(paid_date)>5 
        AND YEAR(request_time)>=2021 AND MONTH(request_time)>5
        AND YEAR(dropoff_time)>=2021 AND MONTH(dropoff_time)>5
        AND YEAR(pickup_time)>=2021 AND MONTH(pickup_time)>5
	ORDER BY drivers_signup_date ASC
);
SELECT * FROM datatable;