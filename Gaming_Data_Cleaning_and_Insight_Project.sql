CREATE DATABASE personal_portfolio_project_v01;
USE personal_portfolio_project_v01;
SHOW TABLES;

SELECT *
FROM video_game_dataset_final;

-- Double Checking Dataset is clean for analysis --
DESCRIBE video_game_dataset_final;
-- OR --
SHOW COLUMNS FROM video_game_dataset_final;

-- Checking for Null Values --
SELECT
	COUNT(*) AS total_rows,
    COUNT(`Gaming Devices`) AS non_null_gaming_devices,
    COUNT(*) - COUNT(`Gaming Devices`) AS null_gaming_devices,
    COUNT(`Gender`) AS non_null_gender,
    COUNT(*) - COUNT(`Gender`) AS null_gender,
    COUNT(`Age`) AS non_null_age,
    COUNT(*) - COUNT(`Age`) AS null_age,
    COUNT(`Gaming Motivation`) AS non_null_gaming_motivation,
    COUNT(*) - COUNT(`Gaming Motivation`) AS null_gaming_motivation,
    COUNT(`Video Game Genre`) AS non_null_video_game_genre,
    COUNT(*) - COUNT(`Video Game Genre`) AS null_video_game_genre,
    COUNT(`Property Owner`) AS non_null_property_owner,
    COUNT(*) - COUNT(`Property Owner`) AS null_property_owner,
    COUNT(`Hours Sleep Daily`) AS non_null_hours_sleep,
    COUNT(*) - COUNT(`Hours Sleep Daily`) AS null_hours_sleep,
    COUNT(`Hours Played Daily`) AS non_null_hours_played,
    COUNT(*) - COUNT(`Hours Played Daily`) AS null_hours_played,
    COUNT(`Monthly Gaming Purchases`) AS non_null_gaming_purchases,
    COUNT(*) - COUNT(`Monthly Gaming Purchases`) AS null_gaming_purchases,
    COUNT(`Mental Wellness Score`) AS non_null_wellness_score, 
    COUNT(*) - COUNT(`Mental Wellness Score`) AS null_wellness_score,
    COUNT(`Productivity Loss`) AS non_null_productiviity_level,
    COUNT(*) - COUNT(`Productivity Loss`) AS null_productivity_level,
    COUNT(`Addiction Level`) AS non_null_addiction_level,
    COUNT(*) - COUNT(`Addiction Level`) AS null_addiction_level,
    COUNT(`Self Control`) AS non_null_self_control,
    COUNT(*) - COUNT(`Self Control`) AS null_self_control,
	COUNT(`Importance Score`) AS non_null_importance_score,
    COUNT(*) - COUNT(`Importance Score`) AS null_importance_score,
	COUNT(`Yearly Income`) AS non_null_yearly_income,
    COUNT(*) - COUNT(`Yearly Income`) AS null_yearly_income,
	COUNT(`Profession`) AS non_null_profession,
    COUNT(*) - COUNT(`Profession`) AS null_profession,
	COUNT(`UserID`) AS non_null_userid,
    COUNT(*) - COUNT(`UserID`) AS null_userid,
	COUNT(`Name`) AS non_null_name,
    COUNT(*) - COUNT(`Name`) AS null_name
FROM
	video_game_dataset_final;

-- Check for duplicated rows --
SELECT
	`UserID`,
    COUNT(*)
FROM
	video_game_dataset_final
GROUP BY
	`UserID`
HAVING
	COUNT(*) > 1;
-- UserID would be the primary key, and executing the command displayed blank results indicated there are no duplicates --

-- Checking for Inconsistant Data --
SELECT
	DISTINCT `Gaming Devices`, `Gaming Motivation`
FROM
	video_game_dataset_final
ORDER BY
	`Gaming Devices` ASC;

SELECT
	DISTINCT `Gaming Devices`, `Gender`
FROM
	video_game_dataset_final
ORDER BY
	`Gaming Devices` ASC;

SELECT
	DISTINCT `Gaming Devices`, `Physical Activity`
FROM
	video_game_dataset_final
ORDER BY
	`Gaming Devices` ASC;

SELECT
	DISTINCT `Gaming Devices`, `Video Game Genre`
FROM
	video_game_dataset_final
ORDER BY
	`Gaming Devices` ASC;



-- Check for Outliers --
SELECT
	`Hours Played Daily`
FROM
	video_game_dataset_final
ORDER BY
	`Hours Played Daily` DESC
LIMIT 10;

SELECT
	`Hours Sleep Daily`
FROM
	video_game_dataset_final
ORDER BY
	`Hours Sleep Daily` DESC
LIMIT 8;

SELECT
	`Age`
FROM
	video_game_dataset_final
ORDER BY
	`Age` DESC
LIMIT 35;

SELECT
	`Addiction Level`,
    `Importance Score`, 
    `Self Control`, 
    `Satisfaction`,
    `Mental Wellness Score`,
    `Productivity Loss`
FROM
	video_game_dataset_final
ORDER BY
	`Hours Played Daily` DESC
LIMIT 100;

-- Checking Data Type Consistency --
DESCRIBE video_game_dataset_final;

-- Summary Statistics --
SELECT
	AVG(`Hours Played Daily`) AS avg_hours_played,
    MIN(`Hours Played Daily`) AS min_hours_played,
    MAX(`Hours Played Daily`) AS max_hours_played,
    ROUND(STDDEV(`Hours Played Daily`), 2) AS stddev_hours_played,
    
    AVG(`Hours Sleep Daily`) AS avg_hours_sleep,
    MIN(`Hours Sleep Daily`) AS min_hours_sleep,
    MAX(`Hours Sleep Daily`) AS max_hours_sleep,
    ROUND(STDDEV(`Hours Sleep Daily`), 2) AS stddev_hours_sleep,
    
    AVG(`Addiction Level`) AS avg_addiction,
    MIN(`Addiction Level`) AS min_addiction,
    MAX(`Addiction Level`) AS max_addiction,
    ROUND(STDDEV(`Addiction Level`), 2) AS stddev_addiction,
    
    AVG(`Satisfaction`) AS avg_satisfaction,
    MIN(`Satisfaction`) AS min_satisfaction,
    MAX(`Satisfaction`) AS max_satisfaction,
    ROUND(STDDEV(`Satisfaction`), 2) AS stddev_satisfaction,
    
    AVG(`Self Control`) AS avg_self_control,
    MIN(`Self Control`) AS min_self_control,
    MAX(`Self Control`) AS max_self_control,
    ROUND(STDDEV(`Self Control`), 2) AS stddev_self_control,
    
    AVG(`Productivity Loss`) AS avg_productivity,
    MIN(`Productivity Loss`) AS min_productivity,
    MAX(`Productivity Loss`) AS max_productivity,
    ROUND(STDDEV(`Productivity Loss`), 2) AS stddev_productivity,
    
    AVG(`Mental Wellness Score`) AS avg_wellness_score,
    MIN(`Mental Wellness Score`) AS min_wellness_score,
    MAX(`Mental Wellness Score`) AS max_wellness_score,
    ROUND(STDDEV(`Hours Played Daily`), 2) AS stddev_wellness_score
FROM
	video_game_dataset_final;

-- findings the average hours played for each gaming devices -- 
SELECT `Gaming Devices`, AVG(`Hours Played Daily`) AS avg_hours
FROM video_game_dataset_final
GROUP BY `Gaming Devices`;

-- Need to round to the nearest decimal place --
SELECT 
	`Gaming Devices`, ROUND(AVG(`Hours Played Daily`), 1) AS avg_hours
FROM
	video_game_dataset_final
GROUP BY
	`Gaming Devices`;

-- Investigating patterns and trends within the dataset --
SELECT
	`Gaming Devices`,
    `Gender`,
    ROUND(AVG(`Hours Played Daily`), 1) AS avg_hours_played,
    ROUND(AVG(`Mental Wellness Score`), 0) AS avg_wellness_score,
    ROUND(AVG(`Hours Sleep Daily`), 1) AS avg_hours_sleep
FROM
	video_game_dataset_final
GROUP BY
	`Gaming Devices`,
    `Gender`
ORDER BY
	`Gaming Devices` ASC;
    
SELECT
	`Gaming Devices`,
    `Gender`,
    `Video Game Genre`,
    ROUND(AVG(`Hours Played Daily`), 1) AS avg_hours_played,
    ROUND(AVG(`Mental Wellness Score`), 0) AS avg_wellness_score,
    ROUND(AVG(`Hours Sleep Daily`), 1) AS avg_hours_sleep,
    ROUND(AVG(`Age`), 0) As avg_age
FROM
	video_game_dataset_final
WHERE
	`Age` BETWEEN 18 AND 25
GROUP BY
	`Gaming Devices`,
    `Gender`,
    `Video Game Genre`,
    `Age`
ORDER BY
	`Gaming Devices` ASC;

SELECT
	`Gaming Devices`,
    `Gender`,
    `Video Game Genre`,
    ROUND(AVG(`Hours Played Daily`), 1) AS avg_hours_played,
    ROUND(AVG(`Mental Wellness Score`), 0) AS avg_wellness_score,
    ROUND(AVG(`Hours Sleep Daily`), 1) AS avg_hours_sleep,
    ROUND(AVG(`Age`), 0) As avg_age
FROM
	video_game_dataset_final
WHERE
	`Age` BETWEEN 26 AND 35
GROUP BY
	`Gaming Devices`,
    `Gender`,
    `Video Game Genre`,
    `Age`
ORDER BY
	`Gaming Devices` ASC;

SELECT
	`Gaming Devices`,
    `Gender`,
    `Video Game Genre`,
    ROUND(AVG(`Hours Played Daily`), 1) AS avg_hours_played,
    ROUND(AVG(`Mental Wellness Score`), 0) AS avg_wellness_score,
    ROUND(AVG(`Hours Sleep Daily`), 1) AS avg_hours_sleep,
    ROUND(AVG(`Age`), 0) As avg_age,
    ROUND(AVG(`Satisfaction`), 0) AS avg_satisfaction,
    ROUND(AVG(`Importance Score`), 0) AS avg_importancce_score,
    ROUND(AVG(`Monthly Gaming Purchases`), 0) AS avg_gaming_purchases,
    ROUND(AVG(`Addiction Level`), 0) AS avg_addiction_level,
    ROUND(AVG(`Self Control`), 0) AS avg_self_control,
    ROUND(AVG(`Productivity Loss`), 0) AS avg_productivity_loss
FROM
	video_game_dataset_final
GROUP BY
	`Gaming Devices`,
    `Gender`,
    `Video Game Genre`,
    `Age`,
    `Satisfaction`,
    `Self Control`,
    `Addiction Level`,
    `Monthly Gaming Purchases`,
    `Importance Score`
ORDER BY
	`Gaming Devices` ASC;

-- Investigating how gaming motivation has an impact on gamer habits and wellness score --
SELECT
	`Gaming Devices`,
    `Gender`,
    `Gaming Motivation`,
    ROUND(AVG(`Hours Played Daily`), 1) AS avg_hours_played,
    ROUND(AVG(`Mental Wellness Score`), 0) AS avg_wellness_score,
    ROUND(AVG(`Hours Sleep Daily`), 1) AS avg_hours_sleep,
    ROUND(AVG(`Age`), 0) As avg_age
FROM
	video_game_dataset_final
GROUP BY
	`Gaming Devices`,
    `Gender`,
    `Gaming Motivation`
ORDER BY
	`Gaming Devices` ASC;

-- Investigating which gaming devices certain genders prefer to use based on two different age groups --
SELECT
	`Gaming Devices`,
    `Gender`,
	COUNT(*) AS count
FROM
	video_game_dataset_final
WHERE
	`Age` BETWEEN 18 AND 25
GROUP BY
	`Gaming Devices`,
    `Gender`;

SELECT
	`Gaming Devices`,
    `Gender`,
	COUNT(*) AS count
FROM
	video_game_dataset_final
WHERE
	`Age` BETWEEN 26 AND 35
GROUP BY
	`Gaming Devices`,
    `Gender`;