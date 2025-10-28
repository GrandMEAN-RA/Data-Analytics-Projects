/* 7.sql
	Top 3 drivers in each city by revenue 
*/

DROP VIEW IF EXISTS Top_3_drivers_in_each_city_by_revenue;
CREATE VIEW Top_3_drivers_in_each_city_by_revenue AS 
    WITH TopDrivers AS (
		SELECT *, DENSE_RANK() OVER(PARTITION BY City ORDER BY TotalRevenue DESC) AS "RRank"
        FROM (
			SELECT  driver_name AS "Drivers", pickup_city AS "City", ROUND(SUM(amount),2) AS "TotalRevenue"
			FROM datatable
			WHERE status <> "cancelled"
			GROUP BY pickup_city, driver_name
			ORDER BY pickup_city ASC
		) AS td
	)
SELECT City, Drivers, TotalRevenue
FROM TopDrivers
WHERE RRank <4;
SELECT * FROM Top_3_drivers_in_each_city_by_revenue;
		
        