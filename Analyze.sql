# ===== STEP1 ======
# Count number of ride_id by casual vs member when ride_length_h > 0 

SELECT 
  COUNT (ride_id) 
FROM tripdata
WHERE ride_length_h > 0
GROUP BY member_casual



# ===== STEP2 ======
# Count top3 ride length and each number of rides. 
Besides, avg, max and min ride lengths. 

SELECT
  AVG(ride_length_h),
  MAX(ride_length_h),
  MIN(ride_length_h),
  APPROX_TOP_COUNT(ride_length_h,3)
FROM
tripdata
WHERE ride_length_h > 0
GROUP BY member_casual



# ===== STEP3 =====
# Count number of rides by day of the week.

SELECT
  COUNTIF(member_casual = 'casual') AS casual,
  COUNTIF(member_casual = 'member') AS member,
FROM
tripdata
WHERE ride_length_h > 0
GROUP BY day_of_week



# ===== STEP4 =====
# I found that casual riders are less than members on weekdays.
#　I can expect that office workers ride bikes for commuting.
#　Thus I extracted only time data from timestamp and saved it with some necessary colums in a temporary table as following. 

SELECT
　　member_casual,
　　day_of_week,
　　ride_length_h,
TIME(started_at) AS started_time
FROM
tripdata
WHERE ride_length_h > 0


# ===== STEP5 =====
# Count each number of rides both between 5am-10am and 4pm-7pm by member vs casual.

SELECT 
  COUNTIF(member_casual = 'member') AS member,
  COUNTIF(member_casual = 'casual') AS casual
FROM tripdata
WHERE
started_time BETWEEN "05:00:00" AND "10:00:00"
GROUP BY day_of_week


SELECT 
  COUNTIF(member_casual = 'member') AS member,
  COUNTIF(member_casual = 'casual') AS casual
FROM tripdata
WHERE
started_time BETWEEN "16:00:00" AND "19:00:00"
GROUP BY day_of_week



# ===== STEP6 =====
# count number of rides per each type of bike. 


SELECT
  COUNTIF(member_casual = 'member') AS member,
  COUNTIF(member_casual = 'casual') AS casual
FROM tripdata
GROUP BY rideable_type 



# ===== STEP7 ======
# Count monthly member vs casual riders from monthly table I created in prior.

SELECT 
  COUNTIF ( member_casual = 'casual') AS casual,
  COUNTIF ( member_casual = 'member') AS member,
FROM monthly-trip-data
WHERE ride_length_h > 0
GROUP BY MONTH
