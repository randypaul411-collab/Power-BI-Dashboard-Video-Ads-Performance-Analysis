-- Exploratory Data Analysis (EDA)

SELECT * FROM video_ad_performance;

-- 1. Overview of Dataset

SELECT count(*) AS Total_records,
ROUND(SUM(total_time_watched)/1000000000.0,2) AS Total_Watch_Time_Billions,
COUNT(DISTINCT(ad_name)) AS Total_Campaign,
COUNT(DISTINCT(website)) AS Total_platforms
FROM video_ad_performance;

-- 2. Descriptive Analysis
SELECT 
AVG(watch_count) AS Average_watch,
MIN(watch_count) AS Min_watch,
MAX(watch_count) AS Max_watch,
AVG(price_per_watch) AS Average_price_per_watch
FROM video_ad_performance;

-- Revenue
ALTER TABLE video_ad_performance
ADD COLUMN revenue DECIMAL(10,2);

SET SQL_SAFE_UPDATES=0;
UPDATE video_ad_performance
SET Revenue = (watch_count * price_per_watch);

SELECT * FROM video_ad_performance;

-- KPI 
SELECT count(*) AS Total_records,
ROUND(SUM(total_time_watched)/1000000000.0,2) AS Total_Watch_Time_Billions,
COUNT(DISTINCT(ad_name)) AS Total_Campaign,
COUNT(DISTINCT(website)) AS Total_platforms,
ROUND(SUM(watch_count)/1000000000.0,2) AS Total_View_Millions,
CAST((SUM(total_time_watched)/ SUM(watch_count))AS DECIMAL(10,2)) AS Avg_Watch_Time_per_View,
ROUND(SUM(watch_count*price_per_watch)/1000000.0,2) AS Total_Revenue_Millions,
CAST(AVG(price_per_watch) AS DECIMAL(10,2)) AS Avg_Price_per_Watch
FROM video_ad_performance;


-- Most viewed 
SELECT video_type,
sum(watch_count) AS Total_view
FROM video_ad_performance
GROUP BY video_type 
ORDER BY Total_view;


-- Engagement rate by video type
SELECT 
    video_type,
    ROUND(SUM(total_time_watched) / NULLIF(SUM(watch_count), 0), 2) AS engagement_rate
FROM video_ad_performance
GROUP BY video_type;

-- Engagement rate by video type (%)
WITH engagement_rate AS
(
SELECT 
    video_type,
    ROUND(SUM(total_time_watched) / NULLIF(SUM(watch_count), 0), 2) AS engagement_rate
FROM video_ad_performance
GROUP BY video_type
)
SELECT video_type, engagement_rate,
 ROUND(
 engagement_rate / SUM(engagement_rate) over() *100 , 2
 ) AS engagement_rate_percent
 FROM engagement_rate;


-- Total Revenue by video Type
SELECT video_type,
ROUND(SUM(watch_count*price_per_watch),2) AS Total_revenue
FROM video_ad_performance
GROUP BY video_type 
ORDER BY Total_revenue;

-- Total Revenue by video Type (%)
WITH Total_revenue AS
(
SELECT video_type,
ROUND(SUM(watch_count*price_per_watch),2) AS Total_revenue
FROM video_ad_performance
GROUP BY video_type 
)
SELECT video_type, Total_revenue,
ROUND(
Total_revenue / SUM(Total_revenue) over() *100, 2
) AS Total_revenue_percent
FROM Total_revenue;

-- Revenue Contribution by Performance_Tier 
SELECT 
    CASE
        WHEN (watch_count * price_per_watch) >= 200000 THEN 'High'
        WHEN (watch_count * price_per_watch) >= 100000 THEN 'Medium'
        ELSE 'Low'
    END AS performance_tier,
    ROUND(SUM(watch_count * price_per_watch), 2) AS revenue
FROM video_ad_performance
GROUP BY performance_tier;

-- Revenue Contribution by Performance_Tier (%)
WITH Revenue_data AS
(
SELECT 
    CASE
        WHEN (watch_count * price_per_watch) >= 200000 THEN 'High'
        WHEN (watch_count * price_per_watch) >= 100000 THEN 'Medium'
        ELSE 'Low'
    END AS performance_tier,
    ROUND(SUM(watch_count * price_per_watch), 2) AS revenue
FROM video_ad_performance
GROUP BY performance_tier
)
SELECT 
Performance_Tier,revenue,
   ROUND(revenue/ SUM(revenue)over () *100,2)  AS Revenue_Percent
FROM Revenue_data 
GROUP BY Performance_Tier;


-- Average Price Per Watch by video Type
SELECT video_type,
ROUND(avg(price_per_watch),3) AS Avg_price_per_watch
FROM video_ad_performance
GROUP BY video_type 
ORDER BY Avg_price_per_watch;


-- dentification of top-performing advertisement campaigns

-- Top 5 Performing Ads by Revenue 
SELECT ad_name,
ROUND(SUM(revenue)/1000000,2) AS Total_revenue_Millions
FROM video_ad_performance
GROUP BY ad_name
ORDER BY Total_revenue_Millions DESC LIMIT 5;

-- Top 5 Performing Ads by Total Time Watched
SELECT ad_name,
ROUND(SUM(total_time_watched)/1000000000,3) AS Total_time_watched_Billions
FROM video_ad_performance
GROUP BY ad_name
ORDER BY Total_time_watched_Billions DESC LIMIT 5;

-- Top 5 Performing Ads by Total View
SELECT ad_name,
ROUND(SUM(watch_count)/1000000,2) AS Total_view_Millions
FROM video_ad_performance
GROUP BY ad_name
ORDER BY Total_view_Millions DESC LIMIT 5;

-- dentification of top-performing advertisement campaigns
-- Worst 5 Performing Ads by Revenue 
SELECT ad_name,
ROUND(SUM(revenue)/1000,2) AS Total_revenue_Thousands
FROM video_ad_performance
GROUP BY ad_name
ORDER BY Total_revenue_Thousands ASC LIMIT 5;

-- Worst 5 Performing Ads by Total Time Watched
SELECT ad_name,
ROUND(SUM(total_time_watched)/1000000,2) AS Total_time_watched_Millions
FROM video_ad_performance
GROUP BY ad_name
ORDER BY Total_time_watched_Millions ASC LIMIT 5;

-- Worst 5 Performing Ads by Total View
SELECT ad_name,
ROUND(SUM(watch_count)/1000,2) AS Total_view_Thousands
FROM video_ad_performance
GROUP BY ad_name
ORDER BY Total_view_Thousands ASC LIMIT 5;




SELECT * FROM video_ad_performance;

