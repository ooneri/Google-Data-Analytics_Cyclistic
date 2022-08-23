# Google Data Analytics Project:Cyclistic bike-share　

*This project is a capstone project of Google Data Analytics Professional Certificate on cousera.

## Summary
I am a junior data analyst working in the marketing analyst team at Cyclistic, a fictional bike-share company in Chicago. 
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. 
The director of marketing Lily Moreno believes the company’s future success depends on maximizing the number of annual memberships. 
Therefore,my team wants to understand how casual riders and annual members use Cyclistic bikes differently. From these insights,
my team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives
must approve your recommendations, so they must be backed up with compelling data insights and professional data
visualizations.

## ASK
The director of marketing, Lily Moreno believes that maximizing the number of annual members will be key to future growth rather than creating a marketing campaign that targets all-new customers. She has set a clear goal: Design marketing strategies aimed at converting casual riders into annual members. 

Therefore, the business task is to analyze the company's historical bike-trip data and identify differences/trends between casual riders and annual members with answering three questions below for guiding the future marketing program. 
 
1. How do annual members and casual riders use Cyclistic bikes differently?
2. Why would casual riders buy Cyclistic annual memberships?
3. How can Cyclistic use digital media to influence casual riders to become members?

## PREPARE    
Data:06.2021 - 05.2022 was downloaded from [here](https://divvy-tripdata.s3.amazonaws.com/index.html) under this [license](https://ride.divvybikes.com/data-license-agreement). Riders’ personally identifiable information is not included.

## PROCESS
Data cleaning process: 
1. Deleted `start_lat`	`start_lng`	`end_lat`	`end_lng`from each csv file.
2. Created the column `ride_length` which was calculated by subtracting　`started_at` from `ended_at` and then formatted as hours. 
3. Created the column `day_of_week` as the day of the week that the ride started.   
4. Combined 12 month data into one single table.

## ANALYZE
