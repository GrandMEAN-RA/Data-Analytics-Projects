/* 2.sql
	Riders Who Signedup 2021 and still took ride 2024
*/
DROP VIEW IF EXISTS Riders_Who_Signedup_2021_and_still_took_ride_2024;
CREATE VIEW Riders_Who_Signedup_2021_and_still_took_ride_2024 AS 
	SELECT *
	FROM (
		SELECT rider_name, riders_signup_date, MAX(request_time) AS Most_Recent_Ride
		FROM datatable
		GROUP BY rider_name, riders_signup_date
        ORDER BY YEAR(riders_signup_date), MONTH(riders_signup_date) ASC
		) AS r
	WHERE YEAR(Most_Recent_Ride) =2024;
SELECT * FROM Riders_Who_Signedup_2021_and_still_took_ride_2024;
