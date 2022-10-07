## Project Summary

This is a capstone project of Google Data Analytics Professional Certificate on cousera.<br>
I am a junior data analyst in the marketing anlystics team of a fictional bike-share company. The director of marketing at the company believes the company’s future success depends on maximizing the number of annual memberships. Therefore, my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights, my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives must approve our team's recommendations, so they must be backed up with compelling data insights and professional data visualizations.

## About Company
**Cyclitsic** : a fictional bike-share company in Chicago<br>
**Service Summary & Statistics**:<br>
A bike-share program that features more than 5,800 bicycles and 600 docking stations. Cyclistic sets itself apart by also offering reclining bikes,hand tricycles,and cargo bikes,making bike-share more inclusive to people with disabilities and riders who can’t use a standard two-wheeled bike.The majority of riders opt for traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more likely to ride for leisure, but about 30% use them to commute to work each day.

## ASK
### Key stakeholders
**Lily Moreno** - The director of marketing. Moreno is responsible for the development of campaigns and initiatives to promote the bike-share program. These may include email, social media, and other channels.<br>
**Cyclistic marketing analytics team** - A team of data analysts who are responsible for collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy.<br>
**Cyclistic executive team** - The notoriously detail-oriented executive team will decide whether to approve the recommended marketing program.

### The business task
The goal Lily has set is to design marketing strategies aimed at converting casual riders into annual members.<br>

With considering Lily's goal and the key stakeholders,the business task is to analyze the company's historical bike-trip data and identify differences/trends between casual riders and annual members with answering three questions below for guiding the future marketing program.<br>

* How do annual members and casual riders use Cyclistic bikes differently?
* Why would casual riders buy Cyclistic annual memberships?
* How can Cyclistic use digital media to influence casual riders to become members?

## PREPARE
**1. Data credibility**<br>
I used the public data provided by divvy from [here](https://divvy-tripdata.s3.amazonaws.com/index.html) under this [license](https://ride.divvybikes.com/data-license-agreement). <br>
The data period: 06.2021 - 05.2022<br>
*Riders’ personally identifiable information is not included.<br>

**2. Data organization**<br>
The original data is consisted by the following columns.<br>

`ride_id` — ride id<br>
`ridable_type` — bike type<br>
`started_at` — timestamp of the trip started at<br>
`ended_at` — timestamp of the trip ended at<br>
`start_station_name` — the name of the station the trip started from<br>
`start_station_id` — station id the trip started from<br>
`end_station_name` — the name of the station the trip ended<br>
`end_station_id` — station id the trip ended<br>
`start_lat` — latitude of start point<br>
`start_lng` — longitude of start point<br>
`end_lat` — latitude of end point<br>
`end_lng` — longitude of end point<br>
`member_casual` — member type ( annual member or casual rider )<br>


**3. The sample size**<br>
The sample size is enough for my analysis. it has 5860776 ride_ids.  

```SELECT 
COUNT(ride_id) 
FROM `sturdy-pier-354508.Cousera_Cyclistic.cyclistic_062021_052022` 
```

## PROCESS
**1. Clean the data**
I primarily used Excel for the following 3 steps of cleaning process as it is the easiest tool to glimse, filter and sort the data. And then, Combined all the data into one single table using BigQuery(SQL).

* For this analysis, I do not use lat/lng.Therefore, the columns`start_lat`,`start_lng`,`end_lat`,`end_lng` were deleted from each monthly csv file
* Added a new column `ride_length` which was calculated by subtracting　`started_at` from ended_at and then formatted as hours using excel
* Added a new column `day_of_week` as the day of the week that the ride started
* Combined separated csv files into one single table

```
# repeated the same syntax for 12 times as the table was separated by month
SELECT *
FROM `sturdy-pier-354508.Cousera_Cyclistic.cyclistic_062021` 
UNION ALL
```
**2. Check the data for errors**
* Removed null data
* Changed some column names
* Extracted the data where the ride_length_h is > 0

The number ofride_id is 5860776 when it INCLUDES the invalid data, 4662347 when it EXCLUDES the invalid data.<br>
About 20% was dropped after the invalid(ride_length is NOT more than 0, null data) data was removed.

```
# Remove null data
# Change some column names
# Remain the data where the ride_length_h is > 0 

SELECT 
  ride_id,
  member_casual AS user_type,
  rideable_type AS bike_type,
  started_at,
  ended_at,
  start_station_name,
  start_station_id,
  end_station_name,
  end_station_id,
  ride_length_h,
  day_of_week
FROM `sturdy-pier-354508.Cousera_Cyclistic.cyclistic_062021_052022` 
WHERE
 ride_length_h > 0
 AND
 start_station_name IS NOT NULL
 AND
 start_station_id IS NOT NULL
 AND 
 end_station_name IS NOT NULL
 AND
 end_station_id IS NOT NULL
 ```

## ANALYZE
You can find a whole analysis process from [here](https://github.com/ooneri/Google-Data-Analytics_Cyclistic/blob/main/Analyze.sql)

Key Findings: 
- Casual users’ average ride is more than 10 minutes longer than members
- Casual users ride on weekends and holiday seasons, especially in summer
- Members ride more in the morning and evening on weekdays.

## SHARE

<img width="852" alt="スクリーンショット 2022-08-24 22 47 49" src="https://user-images.githubusercontent.com/27768556/186606198-8ecb92c7-37cd-4bec-bc6d-91d49cc085d4.png">

You will find a presentation from [here](https://docs.google.com/presentation/d/1GDMy8ohbnWCLAIxgxZ-mgp6IN6YnT62TezRtIEA3BeI/edit?usp=sharing)

Recommendations:
- Offer special deals of converting membership targeted to casual riders who ride in the morning or evening on the weekdays
- Offer a weekend membership plan to casual users already use on the weekends
- Place a digital ad to promote holiday season membership plans
