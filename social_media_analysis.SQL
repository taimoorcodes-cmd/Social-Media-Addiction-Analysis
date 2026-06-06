
-- ================================
-- Social Media Addiction Analysis
-- Author: Taimoor 
-- Tool: MySQL
-- ================================


-- ================================
-- Query 1: Addiction Level Distribution
-- ================================

SELECT 
    addiction_level,
    COUNT(*) AS users
FROM social_media_data
GROUP BY addiction_level
ORDER BY users DESC;


-- ================================
-- Query 2: Usage Group vs Addiction
-- ================================

SELECT
    CASE
        WHEN tiktok_minutes_daily + instagram_minutes_daily < 150 THEN 'Low Usage'
        WHEN tiktok_minutes_daily + instagram_minutes_daily < 300 THEN 'Medium Usage'
        ELSE 'Heavy Usage'
    END AS usage_group,
    COUNT(*) AS users,
    ROUND(AVG(addiction_score),2) AS avg_addiction
FROM social_media_data
GROUP BY usage_group
ORDER BY avg_addiction DESC;


-- ================================
-- Query 3: Dopamine vs Addiction
-- ================================

SELECT
    CASE
        WHEN dopamine_dependency_score < 17 THEN 'Low Dopamine'
        WHEN dopamine_dependency_score < 34 THEN 'Medium Dopamine'
        ELSE 'High Dopamine'
    END AS dopamine_group,
    COUNT(*) AS users,
    ROUND(AVG(addiction_score),2) AS avg_addiction
FROM social_media_data
GROUP BY dopamine_group
ORDER BY avg_addiction DESC;


-- ================================
-- Query 4: Sleep Quality vs Addiction
-- ================================

SELECT
    addiction_level,
    COUNT(*) AS users,
    ROUND(AVG(sleep_quality_index),2) AS avg_sleep_quality
FROM social_media_data
GROUP BY addiction_level
ORDER BY avg_sleep_quality ASC;


-- ================================
-- Query 5: Night Usage vs Addiction
-- ================================

SELECT
    CASE
        WHEN night_usage_ratio < 0.3 THEN 'Low Night Usage'
        WHEN night_usage_ratio < 0.6 THEN 'Medium Night Usage'
        ELSE 'High Night Usage'
    END AS night_group,
    COUNT(*) AS users,
    ROUND(AVG(addiction_score),2) AS avg_addiction
FROM social_media_data
GROUP BY night_group
ORDER BY avg_addiction DESC;


-- ================================
-- Query 6: TikTok vs Instagram
-- ================================

SELECT
    CASE
        WHEN tiktok_minutes_daily > instagram_minutes_daily 
        THEN 'TikTok Heavy Users'
        ELSE 'Instagram Heavy Users'
    END AS usage_type,
    COUNT(*) AS users,
    ROUND(AVG(addiction_score),2) AS avg_addiction
FROM social_media_data
GROUP BY usage_type;


-- ================================
-- Query 7: Top 10 Countries High Addiction
-- ================================

SELECT
    country,
    COUNT(*) AS high_addiction_users
FROM social_media_data
WHERE addiction_level = 'High'
GROUP BY country
ORDER BY high_addiction_users DESC
LIMIT 10;


-- ================================
-- Query 8: MHRI by Addiction Level
-- ================================

SELECT
    addiction_level,
    COUNT(*) AS users,
    ROUND(AVG(MHRI),2) AS avg_mhri
FROM social_media_data
GROUP BY addiction_level
ORDER BY avg_mhri DESC;


-- ================================
-- Query 9: Age Group Analysis
-- ================================

SELECT
    CASE
        WHEN age <= 19 THEN 'Teen'
        WHEN age <= 30 THEN 'Young Adult'
        WHEN age <= 45 THEN 'Adult'
        ELSE 'Older Adult'
    END AS age_group,
    COUNT(*) AS users,
    ROUND(AVG(addiction_score),2) AS avg_addiction
FROM social_media_data
GROUP BY age_group
ORDER BY avg_addiction DESC;


-- ================================
-- Query 10: Sleep Hours vs Addiction
-- ================================

SELECT
    CASE
        WHEN sleep_hours < 6 THEN 'Low Sleep'
        WHEN sleep_hours <= 8 THEN 'Medium Sleep'
        ELSE 'High Sleep'
    END AS sleep_group,
    COUNT(*) AS users,
    ROUND(AVG(addiction_score),2) AS avg_addiction
FROM social_media_data
GROUP BY sleep_group
ORDER BY avg_addiction DESC;