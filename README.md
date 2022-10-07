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
The goal Lily has set is to design marketing strategies aimed at converting casual riders into annual members.<br><br>

With considering Lily's goal and the key stakeholders,the business task is to analyze the company's historical bike-trip data and identify differences/trends between casual riders and annual members with answering three questions below for guiding the future marketing program.<br><br>

* How do annual members and casual riders use Cyclistic bikes differently?
* Why would casual riders buy Cyclistic annual memberships?
* How can Cyclistic use digital media to influence casual riders to become members?

## PREPARE    
Data:06.2021 - 05.2022 was downloaded from [here](https://divvy-tripdata.s3.amazonaws.com/index.html) under this [license](https://ride.divvybikes.com/data-license-agreement). Riders’ personally identifiable information is not included.

## PROCESS
Data cleaning process: 
1. Deleted `start_lat`	`start_lng`	`end_lat`	`end_lng`from each csv file.
2. Created the column `ride_length` which was calculated by subtracting　`started_at` from `ended_at` and then formatted as hours. 
3. Created the column `day_of_week` as the day of the week that the ride started.   
4. Combined 12 month data into one single table using BigQuery.

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
