1. ride_length 0以上の　member / casualそれぞれのride_idをカウント

```
SELECT 
  COUNT ( DISTINCT ride_id) 
FROM `sturdy-pier-354508.Cousera_Cyclistic.cyclistic_062021_052022` 
WHERE ride_length_h > 0
GROUP BY member_casual
```

```
SELECT
  AVG(ride_length_h),
  MAX(ride_length_h),
  MIN(ride_length_h),
  APPROX_TOP_COUNT(ride_length_h,3)
FROM
`sturdy-pier-354508.Cousera_Cyclistic.cyclistic_062021_052022`
WHERE ride_length_h > 0
GROUP BY member_casual
```
