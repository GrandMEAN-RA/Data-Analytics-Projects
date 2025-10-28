/* 6.sql
	Riders who never paid cash 
*/

DROP VIEW IF EXISTS Riders_who_never_paid_cash ;
CREATE VIEW Riders_who_never_paid_cash AS 
    WITH riderss AS (
		SELECT rider_name AS "Riders", COUNT(*) AS "TotalRides", SUM(amount) AS "AmountPaid",
			SUM(CASE WHEN method <> "cash" THEN 1 ELSE 0 END) AS "NonCashPay",
            SUM(CASE WHEN method = "cash" THEN 1 ELSE 0 END) AS "CashPay"
		FROM datatable
        GROUP BY rider_name
        ORDER BY TotalRides DESC
	)
	SELECT Riders, TotalRides
	FROM Riderss 
	WHERE AmountPaid >0 AND TotalRides >10 AND CashPay = 0;
SELECT * FROM Riders_who_never_paid_cash;
		
        