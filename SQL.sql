SELECT * FROM Covid_deaths
ORDER BY location,date


SELECT * FROM Covid_Vacination
ORDER BY location,date


SELECT location,date,total_cases,new_cases,total_deaths,population FROM Covid_deaths
ORDER BY location,date

-- casting is done to convert it into float

-- Total cases vs total deaths
SELECT location,date,total_cases,total_deaths,(CAST(total_deaths AS Float)/total_cases)*100 AS DeathPercentage FROM Covid_deaths
WHERE location='India'
ORDER BY location,date


-- Total cases vs Population
SELECT location,date,population,total_cases,(total_cases/population)*100 AS CovidPercentage FROM Covid_deaths
WHERE location='India'
ORDER BY location,date

-- Countries with HighestDeathCount
SELECT location,MAX(CAST(total_deaths as float)) AS HighestDeathCount FROM Covid_deaths
Group BY location
ORDER BY HighestDeathCount desc 

-- continents with HighestDeathCount

SELECT continent,MAX(CAST(total_deaths as float)) AS HighestDeathCount FROM Covid_deaths
WHERE continent is not null
Group BY continent
ORDER BY HighestDeathCount desc 

-- Total Population vs Vaccinations
SELECT 
  D.continent, 
  D.location, 
  D.date, 
  D.population, 
  V.new_vaccinations 
FROM 
  Covid_deaths D 
  Join Covid_Vacination V on D.location = V.location 
  AND D.date = V.date
WHERE D.continent IS NOT NULL
ORDER BY 1,2,3
