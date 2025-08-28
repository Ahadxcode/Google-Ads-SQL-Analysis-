# Google-Ads-SQL-Analysis-

## Overview
This project analyzes ad campaign performance using **SQL queries**:
- CTR (Click-through rate) by campaign
- ROI by campaign
- Conversion rate by region & device
- CPC & CPA by device

## Database Schema
- `campaigns` (campaign_id, name, impressions, clicks, conversions, cost, device, region, ad_group)

## Example Query
```sql
SELECT c.campaign_name,
       ROUND(SUM(p.clicks) * 100.0 / NULLIF(SUM(p.impressions),0), 2) AS ctr_pct
FROM campaigns c
JOIN ad_groups a ON c.campaign_id = a.campaign_id
JOIN performance p ON a.ad_group_id = p.ad_group_id
GROUP BY c.campaign_name
ORDER BY ctr_pct DESC;
