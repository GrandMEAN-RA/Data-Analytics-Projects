/* 3.sql
	Quarterly Revenue YOY% Growth
*/

DROP VIEW IF EXISTS Quarterly_Revenue_YOY_Growth;
CREATE VIEW Quarterly_Revenue_YOY_Growth AS 
	WITH QuarterlyYOY AS (
		SELECT YEAR(paid_date) AS "Year", QUARTER(paid_date) AS "Quarter", ROUND(SUM(amount),2) AS QuarterlyRevenue
		FROM datatable
		GROUP BY Year, Quarter
		ORDER BY Year, Quarter
	)
	SELECT Year, Quarter, QuarterlyRevenue,  RevenueSQLY, ROUND(((QuarterlyRevenue - RevenueSQLY)/RevenueSQLY)*100,2) AS "YOY_pct"
	FROM (
		SELECT Year, Quarter, QuarterlyRevenue, LAG(QuarterlyRevenue,4) OVER (ORDER BY Year, Quarter) AS "RevenueSQLY"
		FROM QuarterlyYOY
		ORDER BY YEAR, Quarter ASC
		) AS t;
SELECT * 
FROM Quarterly_Revenue_YOY_Growth
ORDER BY YOY_pct DESC;

