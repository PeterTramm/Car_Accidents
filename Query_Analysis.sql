-- Checking minimum, maximum date and count of accident in the entire table
SELECT MIN(Accident_date), Max(Accident_Date), COUNT(accident_no)
FROM AccidentInfo;

-- Checking count of accidents in each type of area throughout the years
SELECT DISTINCT Lga_Name, EXTRACT(YEAR FROM Accident_Date), count(Accident_No) as No_Accidents,
	SUM(No_Persons) as Total_Of_People, SUM(No_Person_Killed) as Total_People_Killed, 
	SUM(No_Person_inj) as Total_People_Inj
FROM AccidentInfo
Group By Lga_Name, EXTRACT(YEAR FROM Accident_Date)
ORDER BY EXTRACT(YEAR FROM Accident_Date) desc, COUNT(Accident_No) desc;

-- Count of accidents at each hour 
SELECT EXTRACT(HOUR FROM accident_time) AS "Hour", COUNT(Accident_No) 
FROM AccidentInfo
GROUP BY EXTRACT(HOUR FROM accident_time)
ORDER BY "Hour"

-- Count of accident types
SELECT AI.Accident_Type, Act.Accident_Type_Desc, COUNT(AI.Accident_No)
FROM AccidentInfo as AI
LEFT JOIN AccidentType as Act 
on AI.Accident_Type = Act.Accident_Type
GROUP BY AI.Accident_Type, Act.Accident_Type_Desc
ORDER BY Count(AI.Accident_No) desc

-- Count of accident grouped by day of the week
SELECT Day_Week_Desc, Count(Accident_No) 
FROM AccidentInfo
GROUP BY Day_Week_Desc
ORDER BY Count(Accident_No) desc

-- Avg of people involved and killed/injury 
SELECT pollie_attend, 
ROUND(AVG(no_persons),2) as Avg_Total_Ppl, 
ROUND(AVG(no_person_killed),2) AS Avg_Ppl_Kill, 
ROUND(AVG(no_person_inj),2) as AVG_Ppl_Inj, 
ROUND(Avg(no_person_inj_2),2) as AVG_Ppl_Inj_2, 
ROUND(Avg(no_person_inj_3),2) AS AVG_Ppl_Injuried_3,
COUNT(accident_no) as Total_accidents
FROM AccidentINfo
GROUP BY pollie_attend

-- Checking kill/injury number from type of accidents
SELECT AI.Accident_Type AS "Accident Type", 
Act.Accident_Type_Desc AS "Accident Desc", 
COUNT(AI.Accident_No) AS "Total Accidents",
SUM(AI.no_person_killed) as "Total Deaths",
SUM(AI.no_person_inj + AI.no_person_inj_2 + AI.no_person_inj_3) as "Total Inj"
FROM AccidentInfo as AI
LEFT JOIN AccidentType as Act 
on AI.Accident_Type = Act.Accident_Type
GROUP BY AI.Accident_Type, Act.Accident_Type_Desc
ORDER BY Count(AI.Accident_No) desc

-- Checking total acicdents by speed zone
SELECT
AI.speed_zone AS "Speed Zone",
COUNT(Accident_No) AS "Total Accidents"
FROM AccidentInfo as AI
LEFT JOIN AccidentType as Act 
on AI.Accident_Type = Act.Accident_Type
GROUP BY AI.speed_zone
ORDER BY AI.Speed_Zone

-- CHecking the type of accident at the highest occurence speed zone 
SELECT
AI.speed_zone AS "Speed Zone",
COUNT(Accident_No) AS "Total Accidents",
AI.Accident_Type AS "Accident Type",
Act.Accident_Type_desc as "Accident Desc"
FROM AccidentInfo as AI
LEFT JOIN AccidentType as Act 
on AI.Accident_Type = Act.Accident_Type
WHERE AI.speed_zone = 60
GROUP BY AI.speed_zone, AI.Accident_Type, Act.Accident_Type_Desc
ORDER BY "Total Accidents" desc

-- Speed zone vs severity 
SELECT
speed_zone AS "Speed Zone",
ROUND(AVG(severity),2)
FROM AccidentInfo
GROUP BY speed_zone
ORDER BY AVG(Severity) desc

-- Count of accidents against road geometry
SELECT
AI.road_geometry AS "Road Geometry Type",
RG.road_geometry_desc as "Road Geometry desc",
count(accident_no) AS "Total Accidents"
FROM AccidentInfo AS AI
LEFT JOIN RoadGeometry AS RG
ON AI.road_geometry = RG.road_geometry
Group BY AI.road_geometry, RG.road_Geometry_desc
Order BY "Total Accidents" desc


-- Count of accidents according to vehicle brand
SELECT Vehicle_Make, COUNT(Accident_no)
FROM Vehicle
GROUP BY Vehicle_Make
ORDER BY COUNT(Accident_No) desc 
LIMIT 20

-- Count of accident according to vehicle colour
SELECT Vehicle_Colour_1, COUNT(Accident_no)
FROM Vehicle
GROUP BY Vehicle_Colour_1
ORDER BY COUNT(Accident_No) desc 
LIMIT 20

-- COunt of accident according to vehicle year manufacturing
SELECT Vehicle_Year_Manuf, COUNT(Accident_no)
FROM Vehicle
GROUP BY Vehicle_Year_Manuf
ORDER BY COUNT(Accident_No) desc 
LIMIT 20

-- Count of accident according to body style
SELECT Vehicle_Body_Style, COUNT(Accident_no)
FROM Vehicle
GROUP BY Vehicle_Body_Style
ORDER BY COUNT(Accident_No) desc 
LIMIT 20


-- Altering Level of Damage into an integer
ALTER TABLE Vehicle ALTER COLUMN Level_Of_Damage TYPE integer USING (Level_Of_Damage::integer);

-- Level of damage in descending order by brand 
SELECT 
Vehicle_Make, 
COUNT(Accident_no) AS "Total Accidents", 
ROUND(avg(Level_Of_Damage),2) AS "Level of Damage"
FROM Vehicle
GROUP BY Vehicle_Make
HAVING COUNT(Accident_no) > 100
ORDER BY avg(Level_Of_Damage) desc 
LIMIT 20 

-- Count of accident according to direction 
SELECT final_direction, count(Accident_No)
FROM Vehicle
GROUP BY final_direction
ORDER BY count(Accident_no) desc