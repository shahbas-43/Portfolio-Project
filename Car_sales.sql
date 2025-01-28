       --Create Table and Import data from excel--

CREATE TABLE car_sales (Car_id text, date date,customer_name text, 
	gender text, annual_income integer, dealer_name text, model text, 
	transmission text, color text, dealer_no varchar)


	--Create Price Table and Import data from excel--
	
CREATE TABLE car_price (Car_id text, price integer, Body_Style text,
Company text) 

    
	
	--Total percenatge of cars bought by men and women--

	

	SELECT   
    gender,
    COUNT(*) AS total_cars,
      (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM car_sales)) AS percentage
  FROM
    car_sales
GROUP BY
    gender


    --Top 3 areas where the highest car owmners are situated--

     SELECT 
	 place,
     COUNT(place)
  FROM car_sales
    GROUP BY place
 ORDER BY  count(place) DESC
     LIMIT 3
   
	
--Total number of cars bought/Percentage by Male and Female according to the transmission--

WITH Total_cars AS(
	SELECT
	COUNT (*) As total_cars_sold 
	FROM car_sales
	)

SELECT
gender, transmission,
	COUNT (transmission) as car_count,

	(COUNT (transmission)*100.0/(SELECT total_cars_sold from Total_cars))
	FROM car_sales       
	GROUP BY gender,transmission  



	---Company preference of individuals relative to their annual income--
 
	  
	
	SELECT  
	cs.customer_name, cs.gender,
    cs.annual_income, MAX(cp.price) as car_cost,
	cp.company
	
FROM car_sales as cs
    INNER JOIN car_price as cp
    ON cs.car_id=cp.car_id
GROUP BY cs.customer_name, cs.gender,
cp.company, cs.annual_income
    ORDER BY  car_cost  DESC
    LIMIT 5


	--Total number of cars sold bewtween 2022 and 2023--


   SELECT
COUNT (*) as total_cars
     FROM car_sales
WHERE date BETWEEN'2023-01-01' AND '2023-12-31'


Select *
from car_sales

