/* 4.sql
	Average monthly rides since signup
*/

DROP VIEW IF EXISTS Average_Monthly_Rides_Since_Signup;
CREATE VIEW Average_Monthly_Rides_Since_Signup AS 
	SELECT driver_name, AvgMonthlyRides, DENSE_RANK() OVER(ORDER BY AvgMonthlyRides DESC) AS ranks
    FROM (
		SELECT driver_name, AVG(MonthlyRides) AS "AvgMonthlyRides"
		FROM (
			SELECT driver_name, YEAR(request_time) AS "Year", Month(Request_time) AS "Month", 
				COUNT(request_time) AS "MonthlyRides"
			FROM datatable
			GROUP BY driver_name, Year, Month
            ORDER By MonthlyRides DESC
			) as mr 
		GROUP BY driver_name
        ) AS amr;
SELECT *
FROM Average_Monthly_Rides_Since_Signup
WHERE ranks <= 5
ORDER BY AvgMonthlyRides DESC;