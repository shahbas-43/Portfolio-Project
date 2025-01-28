
-- Average age of Individuals who participated in the survey--

SELECT 
  AVG (AGE) 
FROM 
  food_impact_data


--number of regions participated in the survey--

SELECT 
  DISTINCT (region) 
FROM 
  food_impact_data

-- number of individuals participated in the survey--

SELECT 
  COUNT (person_id) 
FROM 
  food_impact_data

-- The healthiest region,diet type and their calorie intake --

	SELECT 
  region, 
  diet_type, 
  AVG (daily_calorie_intake), 
  COUNT(health_impact) AS healthy 
FROM 
  food_impact_data 
WHERE 
  health_impact = 'Positive' 
GROUP BY 
  REGION, 
  diet_type 
ORDER BY 
  region DESC 
LIMIT 
  1



--Deatails of individuals whose health score is above 80 and health impact is positive--

SELECT 
  fi.age, 
  fi.gender, 
  fi.region, 
  fi.diet_type, 
  fi.common_diseases, 
  fs.sugar_intake, 
  fs.salt_intake 
FROM 
  food_impact_data as fi 
  join food_imp_score as fs on fi.person_id = fs.food_frequency 
where 
  health_impact = 'Positive' 
  AND health_score Between 80 
  AND 100 
ORDER BY 
  age


-- Categorising the relation between sugar and salt intake with excercise level and health Impact --
CREATE TEMPORARY TABLE hr AS 
SELECT 
  * 
FROM 
  food_impact_data as fi 
  join food_imp_score as fs on fi.person_id = fs.food_frequency 
where 
  health_impact = 'Positive' 
SELECT 
  region, 
  primary_cuisine, 
  daily_calorie_intake, 
  common_diseases, 
  sugar_intake, 
  salt_intake, 
  exercise_level, 
  CASE WHEN sugar_intake IN ('High', 'Low', 'Moderate') 
  AND common_diseases = 'None' Then 'Healthy' WHEN sugar_intake IN ('High', 'Low', 'Moderate') 
  AND common_diseases <> 'None' Then 'Unhealthy' WHEN salt_intake IN ('High', 'Low', 'Moderate') 
  AND common_diseases = 'None' Then 'Healthy' WHEN salt_intake IN ('High', 'Low', 'Moderate') 
  AND common_diseases <> 'None' Then 'Unhealthy' ELSE 'Lifestyle_Unhealthy' END AS Health_correlation 
FROM 
  HR



