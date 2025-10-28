/* 8.sql
	Top 10 Drivers
*/

DROP VIEW IF EXISTS Top_10_Drivers;
CREATE VIEW Top_10_Drivers AS 
    SELECT Driver, TotalRides, AvgRating, CouncellationRatePct, DENSE_RANK() OVER(ORDER BY TotalRides DESC) AS "RRank"
    FROM (
		SELECT driver_name AS "Driver", COUNT(*) AS "TotalRides", ROUND(AVG(rating),2) AS "AvgRating",
			SUM(CASE WHEN status = "cancelled" THEN 1 ELSE 0 END) AS "CancelledRides", 
			ROUND(SUM(CASE WHEN status = "cancelled" THEN 1 ELSE 0 END)*100/COUNT(*),2) AS "CouncellationRatePct"
		FROM datatable
		GROUP BY driver_name
		ORDER BY driver_name
        ) AS td
	WHERE TotalRides >= 5 AND AvgRAting >=4.5 AND CouncellationRatePct <5.0
    ORDER BY TotalRides DESC;
SELECT TotalRides, AvgRating, CouncellationRatePct
FROM Top_10_Drivers
WHERE RRank <= 10;
        
		
        