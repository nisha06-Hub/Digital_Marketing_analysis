SELECT 
SUM(Ad_Spend) AS Total_Ad_Spend,
SUM(Revenue) AS Total_Revenue,
SUM(`leads Generated`) AS Total_Leads,
SUM(`sales Converted`) AS Total_Sales
FROM Advertising_Dataset;

--  Revenue by Platform
SELECT 
Platform,
SUM(Revenue) AS Total_Revenue
FROM Advertising_Dataset
GROUP BY Platform;

-- Spend by Platform
SELECT 
Platform,
SUM(Ad_Spend) AS Total_Spend
FROM Advertising_Dataset
GROUP BY Platform;

--  Best Performing Campaigns
SELECT 
`Campaign Name` As Campaign,
SUM(Revenue) AS Revenue
FROM Advertising_Dataset
GROUP BY Campaign
ORDER BY Revenue DESC
LIMIT 10;

-- Calculate ROI
SELECT 
`Campaign Name` As Campaign,
SUM(Revenue) AS Revenue,
SUM(Ad_Spend) AS Spend,
(SUM(Revenue)-SUM(Ad_Spend))/SUM(Ad_Spend)*100 AS ROI
FROM Advertising_Dataset
GROUP BY Campaign
ORDER BY ROI DESC;

-- Conversion rate 
SELECT 
`Campaign Name` As Campaign,
SUM(`Sales Converted`)/SUM(`Leads Generated`)*100 AS Conversion_Rate
FROM Advertising_Dataset
GROUP BY Campaign;