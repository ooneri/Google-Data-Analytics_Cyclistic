# STEP1
# Counted number of ride ids : member vs casual

SELECT 
  COUNT (ride_id) 
FROM 
`sturdy-pier-354508.Cousera_Cyclistic.12months without null`
GROUP BY user_type

# STEP2
# Counted top 3 ride lengths and each number of rides. 
# Calcurated avg, max and min ride length per member or casual. 

SELECT
  AVG(ride_length_h),
  MAX(ride_length_h),
  MIN(ride_length_h),
  APPROX_TOP_COUNT(ride_length_h,3)
FROM
`sturdy-pier-354508.Cousera_Cyclistic.12months without null`
GROUP BY user_type

# STEP3
# Counted number of rides: member vs casual by day of the week and per hour.

SELECT
 TIME_TRUNC(started_time,HOUR) AS started_hour,
 COUNTIF(user_type = 'member') AS member,
 COUNTIF(user_type = 'casual') AS casual
FROM ( SELECT 
 user_type,
 day_of_week,
 TIME(started_at) AS started_time
FROM `sturdy-pier-354508.Cousera_Cyclistic.12months without null` )
GROUP BY day_of_week,started_hour
ORDER BY day_of_week,started_hour

# STEP4
# Counted number of rides: member vs casual by month.

SELECT 
  COUNTIF ( user_type = 'casual') AS casual,
  COUNTIF ( user_type = 'member') AS member,
FROM ( SELECT 
user_type,
EXTRACT ( MONTH FROM started_at) AS MONTH
FROM `sturdy-pier-354508.Cousera_Cyclistic.12months without null` )
GROUP BY MONTH
