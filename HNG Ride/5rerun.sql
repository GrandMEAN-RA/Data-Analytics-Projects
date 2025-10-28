/* 5.sql
	Cancellation rate per city
*/

DROP VIEW IF EXISTS Cancellation_rate_per_city;
CREATE VIEW Cancellation_rate_per_city AS 
    SELECT rider_city AS "City", COUNT(*) AS "TotalRides", 
		SUM(CASE WHEN status = "cancelled" THEN 1 ELSE 0 END) AS "CancelledRides", 
        ROUND(SUM(CASE WHEN status = "cancelled" THEN 1 ELSE 0 END)*100/COUNT(*),2) AS "CouncellationRatePct"
	FROM datatable
	GROUP BY rider_city
    ORDER BY CouncellationRatePct DESC;
	SELECT * FROM Cancellation_rate_per_city ;
        
		
        