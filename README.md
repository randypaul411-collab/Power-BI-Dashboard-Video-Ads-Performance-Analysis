# 📊 Power BI Dashboard: Video Ad Performance Analysis

![Power BI](https://img.shields.io/badge/Tool-PowerBI-yellow)
![Dashboard](https://img.shields.io/badge/Type-Interactive%20Dashboard-blue)
![Analytics](https://img.shields.io/badge/Focus-Data%20Visualization-orange)

---

## 🧾 Overview

This project presents an **interactive Power BI dashboard** designed to analyze video advertisement performance. It delivers a clear, executive-level view of key business metrics, enabling stakeholders to evaluate campaign effectiveness, engagement, and cost efficiency.

---

## 🏠 Page 1: Home Dashboard

### Dashboard Preview
![Home Dashboard](image/home-dashboard.jpeg)

### What this page shows:
- KPI summary (Revenue, Views, Watch Time, Cost)
- Viewership & Engagement insights
- Revenue distribution by video type and performance tier
- Cost efficiency comparison  

### Key Insights
- Long-format ads dominate engagement, contributing over *70% of total watch time per view*, indicating strong audience retention  
- Long ads also achieve slightly higher total views, suggesting better reach  
- Revenue is evenly distributed across video types, while high-performing ads account for more than *56% of total revenue*  
- Cost analysis shows long ads deliver slightly better efficiency with a lower price per watch  
---

## Page 2: Best & Worst Performing Ads

### Dashboard Preview
![Performance Dashboard](image/performance-dashboard.jpeg)

### What this page shows:
- Top 5 best-performing ads across revenue, views, and watch time  
- Bottom 5 worst-performing ads across key performance metrics  
- Clear comparison of highest and lowest performing campaigns to highlight performance gaps and optimization opportunities  

###  Best Performing Ads
- *punitory-otorhinolaryngologist* leads in revenue generation, making it the most financially impactful campaign  
- *subbranches-spatially* dominates both views and watch time, indicating strong audience reach and engagement  

###  Worst Performing Ads
- *tiptop-stummel* consistently ranks lowest across revenue, views, and watch time, indicating poor performance and low audience engagement  

---

##  Tools Used

- **Power BI** – Dashboard design & visualization  
- **Power Query** – Data transformation  
- **DAX** – KPI and measure calculations  
- **SQL** – Data preparation and advanced KPI computation for both summary and detailed analysis, including revenue aggregation, engagement rate analysis, performance tier segmentation, and ranking of top and underperforming ads across revenue, views, and watch time

---

## Key Metrics

- Total Revenue  
- Total Views  
- Total Watch Time  
- Average Watch Time per View  
- Average Price per Watch  
- Engagement Rate  
- Performance Tier (High / Medium / Low)   

---
## Project Structure

```bash
├── README.md
├── PowerBI/
│   └── [dashboard.pbix](https://github.com/randypaul411-collab/Power-BI-Dashboard-Video-Ads-Performance-Analysis/blob/main/EDA_video_ad_performance_db.sql)
├── SQL/
│   ├── data_cleaning.sql
│   ├── eda_queries.sql
│   └── kpi_calculations.sql
├── Dataset/
│   └── cleaned_data.csv
├── images/
│   ├── home-dashboard.png
│   └── performance-dashboard.png
