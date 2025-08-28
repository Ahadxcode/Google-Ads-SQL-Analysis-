
CREATE DATABASE google_ads;
USE google_ads;


CREATE TABLE campaigns (
    campaign_id INT PRIMARY KEY AUTO_INCREMENT,
    campaign_name VARCHAR(100),
    impressions INT,
    clicks INT,
    conversions INT,
    cost DECIMAL(10,2),
    device VARCHAR(50),
    region VARCHAR(50),
    ad_group VARCHAR(100)
);


INSERT INTO campaigns (campaign_name, impressions, clicks, conversions, cost, device, region, ad_group)
VALUES
('Search Campaign A', 10000, 1200, 150, 5000, 'Mobile', 'North America', 'AdGroup_1'),
('Search Campaign A', 8000, 800, 100, 3000, 'Desktop', 'Europe', 'AdGroup_1'),
('Display Campaign B', 15000, 600, 50, 4000, 'Mobile', 'Asia', 'AdGroup_2'),
('Video Campaign C', 20000, 1000, 200, 7000, 'Tablet', 'North America', 'AdGroup_3'),
('Shopping Campaign D', 5000, 700, 90, 2500, 'Desktop', 'Europe', 'AdGroup_2'),
('Search Campaign E', 12000, 1500, 220, 6500, 'Mobile', 'Asia', 'AdGroup_4');



SELECT 
    campaign_name,
    ROUND((SUM(clicks) / SUM(impressions)) * 100, 2) AS CTR_Percentage
FROM campaigns
GROUP BY campaign_name;



SELECT 
    campaign_name,
    SUM(conversions) * 50 AS revenue,
    SUM(cost) AS total_cost,
    ROUND((SUM(conversions) * 50 - SUM(cost)) / SUM(cost) * 100, 2) AS ROI_Percentage
FROM campaigns
GROUP BY campaign_name;




SELECT 
    ad_group,
    SUM(conversions) AS total_conversions
FROM campaigns
GROUP BY ad_group
ORDER BY total_conversions DESC
LIMIT 3;


SELECT 
    device,
    region,
    ROUND((SUM(conversions) / SUM(clicks)) * 100, 2) AS Conversion_Rate
FROM campaigns
GROUP BY device, region;

Step 5: Verify

You can check the table with:

SELECT * FROM campaigns;
