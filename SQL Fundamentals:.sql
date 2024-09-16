SQL Fundamentals:
-- databases are comprised of tables 
-- many can analyze data in database with queries 
-- rows are records (holds data on individual observation) and columns are fields 
-- different data types: string (varchar), integer (whole number), numeric (decimal)
-- data in database is physically stored on hard disk of server
-- database schema provides info about data type of each field 
-- two SQL flavors: PostgreSQL and SQL Server
-- Using double quotes around a non-standard name allows us to run the SQL query
-- Add your own queries here
-- to select all column headers from the dataframe books
-- following code was used to query databases provided by DataCamp

SELECT * 
FROM books

-- select distinct row and column combo
SELECT DISTINCT books.author 
FROM books

-- Alias author, renaming column 
SELECT author AS unique_author
FROM books;

-- Save the results of this query as a view called library_authors
CREATE VIEW view_title AS
SELECT DISTINCT author AS unique_author
FROM books;
-- no result will be generated from this query 

-- Select the first 10 genres from books using PostgreSQL
SELECT books.genre
FROM books
LIMIT 10

-- Count number of rows with value in film_id column
SELECT COUNT(film_id) AS count_film_id
FROM reviews;

-- Count the number of records in the people table
SELECT COUNT(*) AS count_records
FROM people;

-- Count the records for languages and countries (2 fields) represented in the films table
SELECT COUNT(language) AS count_languages, COUNT(country) AS count_countries
FROM films;

-- Count the distinct countries from the films table
SELECT COUNT(DISTINCT country) AS count_distinct_countries
FROM films;

-- Select film_ids and imdb_score with an imdb_score over 7.0
SELECT film_id, imdb_score
FROM reviews
WHERE imdb_score > 7.0;

-- Count the Spanish-language films
SELECT COUNT(language) AS count_spanish
FROM films
WHERE language = 'Spanish';

-- Select all records for German-language films released after 2000 and before 2010
SELECT *
FROM films
    WHERE release_year > 2000
    AND release_year < 2010
    AND language = 'German';
	
	SELECT title, release_year
FROM films
WHERE (release_year = 1990 OR release_year = 1999)
	AND (language = 'English' OR language = 'Spanish')
	AND gross > 2000000
	
	-- Select the title and release_year for films released between 1990 and 2000
SELECT title, release_year
FROM films
WHERE release_year BETWEEN 1990 AND 2000;

-- Select the names that start with B
SELECT name
FROM people
WHERE name LIKE 'B%';

-- Select names with r as second letter 
SELECT name
FROM people
WHERE name LIKE '_r%';

-- select names that do not start with a
SELECT name
FROM people
WHERE name NOT LIKE 'A%';

-- Select only records that contain the word 'GOLD'
SELECT *
FROM film
WHERE title LIKE '%GOLD%';

--using tsvectors: converts every word to a small character string
-- Select the film description as a tsvector
SELECT to_tsvector(description)
FROM film;

--search for elf (IS NOT CASE SENSTITVE) - USE THIS
SELECT title, description
FROM film
WHERE to_tsvector(title) @@ to_tsquery('elf');

--select similarity between things
select similarity(x,y)

-- Find the title and release_year for all films over two hours in length released in 1990 and 2000
SELECT title, release_year
FROM films
WHERE release_year IN (1990, 2000)
	AND duration > 120;
	
-- Count the unique titles
SELECT COUNT(DISTINCT title) AS nineties_english_films_for_teens
FROM films
WHERE release_year BETWEEN 1990 AND 1999
AND language = 'English'
AND certification IN ('G', 'PG', 'PG-13');

-- List all film titles with missing budgets
SELECT title AS no_budget_info
FROM films
WHERE budget IS NULL;

-- Query the sum of film durations
SELECT SUM(duration) AS total_duration
FROM films;

-- Calculate the average duration of all films
SELECT AVG(duration) AS average_duration
FROM films;

-- Find the latest release_year (can be used for non-numeric)
SELECT MAX(release_year) AS latest_year
FROM films;

-- Find the duration of the shortest film (can be used for non-numeric)
SELECT MIN(duration) AS shortest_film
FROM films; 

-- Round the average number of facebook_likes to one decimal place
#use negative number is rounding to ones place
SELECT ROUND(AVG(facebook_likes), 1) AS avg_facebook_likes
FROM reviews;

-- Calculate the title and duration_hours from films
SELECT title, duration/60.0 AS duration_hours
FROM films;

-- Calculate the percentage of people who are no longer alive
SELECT COUNT(deathdate) * 100.0 / COUNT(*) AS percentage_dead
FROM people;

-- Find the number of decades in the films table
SELECT (MAX(release_year) - MIN(release_year)) / 10.0 AS number_of_decades
FROM films;

-- Find the release_year and film_count of each year - group by needs some aggregrate function
SELECT release_year, COUNT(title) AS film_count
FROM films
GROUP BY release_year;

-- Find the release_year, country, and max_budget, then group and order by release_year and country
SELECT release_year, country, MAX(budget) AS max_budget
FROM films
GROUP BY release_year, country
ORDER BY release_year, country;

-- grounps have own key words for filtering -> having
-if you give new name, still must specificy aggregate function in filtering clause
SELECT release_year, AVG(budget) AS avg_budget, AVG(gross) AS avg_gross
FROM films
WHERE release_year > 1990
GROUP BY release_year
HAVING AVG(budget) > 60000000
-- Order the results from highest to lowest average gross and limit to one
ORDER BY avg_gross DESC
LIMIT 1;

--join tables
SELECT 
FROM prime_ministers
INNER JOIN presidents
ON prime_ministers.country = presidents.country;

-- Select name fields (with alias) and region - need to be specific about which columns (and from which tables) you are selecting
SELECT cities.name AS city, countries.name AS country, region 
FROM cities
INNER JOIN countries
ON cities.country_code = countries.code;

-- Select fields with aliases
SELECT c.code AS country_code, name, year, inflation_rate
FROM countries AS c
-- Join to economies (alias e)
INNER JOIN economies AS e
-- Match on code field using table aliases
ON c.code = e.code;

--joining using USING
SELECT c.name AS country, l.name AS language, official
FROM countries AS c
INNER JOIN languages AS l
-- Match using the code column
USING (code)

--two joins
SELECT name, fertility_rate, e.year, e.unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
ON c.code = p.country_code
-- Join to economies (as e)
INNER JOIN economies AS e
-- Match on country code
ON c.code = e.code
-- Add an additional joining condition such that you are also joining on year
	AND e.year = p.year;
	
--left join (all records in left table and records in right that match)
--replace "INNER" with "LEFT"

--full join retains all ids, even if not matched
--replace "INNER" with "FULL"

--cross join takes every single combination of two columns 
--replace with CROSS

--filtering with several things
SELECT name AS country, code, region, basic_unit
FROM countries
-- Join to currencies
FULL JOIN currencies 
USING (code)
-- Where region is North America or name is null
WHERE region = 'North America' OR 
    name IS NULL
ORDER BY region;

--peforming join on itself
SELECT 
	p1.country_code, 
    p1.size AS size2010, 
    p2.size AS size2015
FROM populations AS p1
INNER JOIN populations AS p2
ON p1.country_code = p2.country_code
WHERE p1.year = 2010
-- Filter such that p1.year is always five years before p2.year
AND p1.year = p2.year - 5


--union excludes duplicates
--union all takes all records from two tables, including duplicates, so same thing as rbind()
--this stacks rows from both tables on top of each other 
-- Select all fields from economies2015
SELECT *
FROM economies2015   
-- Set operation
UNION
-- Select all fields from economies2019
SELECT * 
FROM economies2019
ORDER BY code, year;

-- Return all cities with the same name as a country
-- intesect returns columns when specified two columns have same record 
SELECT name
FROM cities
INTERSECT
SELECT name
FROM countries;

-- Return all cities that do not have the same name as a country
--only records in one table not present in another
SELECT name
FROM cities
EXCEPT
SELECT name
FROM countries
ORDER BY name;

--semi joins: filters unique languages for those only spoken in the Middle East
SELECT DISTINCT name
FROM languages
-- Add syntax to use bracketed subquery below as a filter
WHERE code IN
  (SELECT code
  FROM countries
  WHERE region = 'Middle East')
ORDER BY name;

SELECT code, name
FROM countries
WHERE continent = 'Oceania'
-- Filter for countries not included in the bracketed subquery
  AND code NOT IN
    (SELECT code
    FROM currencies);
	
--subquery
SELECT *
FROM populations
WHERE life_expectancy > 1.15*
  (SELECT AVG(life_expectancy)
   FROM populations
   WHERE year = 2015) 
    AND year = 2015;
	
--another subquery practice:
SELECT countries.name AS country,
-- Subquery that provides the count of cities   
  (SELECT COUNT(*)
   FROM cities
   WHERE countries.code = cities.country_code) AS cities_num
FROM countries
ORDER BY cities_num DESC, country
LIMIT 9;

-- interested in countries that are not monarchies or republics in 2015
SELECT code, inflation_rate, unemployment_rate
FROM economies
WHERE year = 2015 
  AND code NOT IN
-- Subquery returning country codes filtered on gov_form
    (SELECT code
     FROM countries
     WHERE (gov_form LIKE '%Monarchy%' OR gov_form LIKE '%Republic%'))
ORDER BY inflation_rate;

-- calculate city_perc of only capital cities in europe of americas and sort and limit
SELECT name, country_code, city_proper_pop, metroarea_pop, city_proper_pop / metroarea_pop * 100 AS city_perc
FROM cities
WHERE metroarea_pop IS NOT NULL
AND name IN --subqeries require this syntax
-- Use subquery to filter city name
    (SELECT capital
    FROM countries
    WHERE (continent = 'Europe' OR continent LIKE '%America'))
-- Sort and limit the result
ORDER BY city_perc DESC
LIMIT 10;

--filtering and using case statements 
SELECT team_api_id,team_long_name
FROM teams_germany
-- Only include FC Schalke 04 and FC Bayern Munich
WHERE team_long_name IN ('FC Bayern Munich', 'FC Schalke 04');

-- Identify the home team as Bayern Munich, Schalke 04, or neither
SELECT 
    CASE WHEN hometeam_id = 10189 THEN 'FC Schalke 04'
         WHEN hometeam_id = 9823 THEN 'FC Bayern Munich'
         ELSE 'Other' END AS home_team,
	COUNT(id) AS total_matches
FROM matches_germany
-- Group by the CASE statement alias
GROUP BY home_team;

--complex case statements 
SELECT 
	season,
	date,
	CASE WHEN hometeam_id = 9857
        AND home_goal > away_goal 
        THEN 'Bologna Win'
		WHEN awayteam_id = 9857
        AND away_goal > home_goal 
        THEN 'Bologna Win' 
		END AS outcome
FROM matches_italy;

--case statements with nulls and where
SELECT 
	season,
    date,
	home_goal,
	away_goal
FROM matches_italy
WHERE 
	CASE WHEN hometeam_id = 9857 AND home_goal > away_goal THEN 'Bologna Win'
		WHEN awayteam_id = 9857 AND away_goal < home_goal THEN 'Bologna Win' 
		END IS NOT NULL;
--count with case
		SELECT 
	c.name AS country,
    -- Count matches in each of the 3 seasons
	COUNT(CASE WHEN m.season = '2012/2013' THEN m.id END) AS matches_2012_2013,
	COUNT(CASE WHEN m.season = '2013/2014' THEN m.id END) AS matches_2013_2014,
	COUNT(CASE WHEN m.season = '2014/2015' THEN m.id END) AS matches_2014_2015
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
-- Group by country name alias
GROUP BY country;

--ANOTHER way of doing the same
SELECT 
	c.name AS country,
    -- Sum the total records in each season where the home team won
	SUM(CASE WHEN m.season = '2012/2013' AND m.home_goal > m.away_goal 
        THEN 1 ELSE 0 END) AS matches_2012_2013,
 	SUM(CASE WHEN m.season = '2013/2014' AND m.home_goal > m.away_goal  
        THEN 1 ELSE 0 END) AS matches_2013_2014,
	SUM(CASE WHEN m.season = '2014/2015' AND m.home_goal > m.away_goal 
        THEN 1 ELSE 0 END) AS matches_2014_2015
FROM country AS c
LEFT JOIN match AS m
ON c.id = m.country_id
-- Group by country name alias
GROUP BY country;

--calculating percentage with rounded
SELECT 
	c.name AS country,
    -- Round the percentage of tied games to 2 decimal points
	ROUND(AVG(CASE WHEN m.season='2013/2014' AND m.home_goal = m.away_goal THEN 1
			 WHEN m.season='2013/2014' AND m.home_goal != m.away_goal THEN 0
			 END),2) AS pct_ties_2013_2014,
	ROUND(AVG(CASE WHEN m.season='2014/2015' AND m.home_goal = m.away_goal THEN 1
			 WHEN m.season='2014/2015' AND m.home_goal != m.away_goal THEN 0
			 END),2) AS pct_ties_2014_2015
FROM country AS c
LEFT JOIN matches AS m
ON c.id = m.country_id
GROUP BY country;

--subqueries again
--subqueries in where statement
SELECT
	-- Select the team long and short names
	team_long_name,
	team_short_name
FROM team
-- Filter for teams with 8 or more home goals
WHERE team_api_id IN
	  (SELECT hometeam_ID
       FROM match
       WHERE home_goal >= 8);
--subqueries with From
SELECT
	-- Select country, date, home, and away goals from the subquery
    subq.country,
    subq.date,
    home_goal,
    away_goal
FROM 
	-- Select country name, date, home_goal, away_goal, and total goals in the subquery
	(SELECT c.name AS country, 
     	    m.date, 
     		m.home_goal, 
     		m.away_goal,
           (m.home_goal + m.away_goal) AS total_goals
    FROM match AS m
    LEFT JOIN country AS c
    ON m.country_id = c.id) AS subq
-- Filter by total goals scored in the main query
WHERE total_goals >= 10;

--SELECT QUERIES - for generating aggregate values - useful for calcs
SELECT 
	l.name AS league,
    -- Select and round the league's total goals
    ROUND(AVG(m.home_goal + m.away_goal), 2) AS avg_goals,
    -- Select & round the average total goals for the season
    (SELECT ROUND(AVG(home_goal + away_goal), 2) 
     FROM match
     WHERE season = '2013/2014') AS overall_avg
FROM league AS l
LEFT JOIN match AS m
ON l.country_id = m.country_id
-- Filter for the 2013/2014 season
WHERE season = '2013/2014'
GROUP BY l.name;

--with multiple subqueries, must remember to filter each time
--correlated subqueries cannot run on their own and depend on main query 
SELECT 
	-- Select country ID, date, home, and away goals from match
	main.country_id,
    main.date,
    main.home_goal, 
    main.away_goal
FROM match AS main
WHERE 
	-- Filter the main query by the subquery
	(home_goal + away_goal) > 
        (SELECT AVG((sub.home_goal + sub.away_goal) * 3)
         FROM match AS sub
         -- Join the main query to the subquery in WHERE
         WHERE main.country_id = sub.country_id);
--nested subquery
-- Count match ids
SELECT
    country_id,
    season,
    COUNT(id) AS matches
-- Set up and alias the subquery
FROM (
	SELECT
    	country_id,
    	season,
    	id
	FROM match
	WHERE home_goal >= 5 OR away_goal >= 5) 
    AS subquery
-- Group by country_id and season
GROUP BY country_id, season;

--common table expressions make it much easier 
-- Set up your CTE
WITH cte AS (
    SELECT 
  		country_id, 
  		id
    FROM match
    WHERE (home_goal + away_goal) >= 10)
-- Select league and count of matches from the CTE
SELECT
    l.name AS league,
    COUNT(cte.id) AS matches
FROM league AS l
-- Join the CTE to the league table
LEFT JOIN cte
ON l.id = cte.country_id
GROUP BY l.name;

**def go with CTEs - much easier to understand 
--when creating two CTES:
WITH home AS (
  SELECT m.id, m.date, 
  		 t.team_long_name AS hometeam, m.home_goal
  FROM match AS m
  LEFT JOIN team AS t 
  ON m.hometeam_id = t.team_api_id),
away AS (
  SELECT m.id, m.date, 
  		 t.team_long_name AS awayteam, m.away_goal
  FROM match AS m
  LEFT JOIN team AS t 
  ON m.awayteam_id = t.team_api_id)
-- Select date, home_goal, and away_goal
SELECT 
	home.date,
    home.hometeam,
    away.awayteam,
    home.home_goal,
    away.away_goal
-- Join away and home on the id column
FROM home
INNER JOIN away
ON home.id = away.id;

--window functions
--produces aggregrate average total goals for all rows, so same product in last column 
SELECT 
	-- Select the id, country name, season, home, and away goals
	m.id, 
    c.name AS country, 
    m.season,
	m.home_goal,
	m.away_goal,
    -- Use a window to include the aggregate average in each row
	AVG(m.home_goal + m.away_goal) OVER() AS overall_avg
FROM match AS m
LEFT JOIN country AS c ON m.country_id = c.id;

--using rank window function
SELECT 
	-- Select the league name and average goals scored
	l.name AS league,
    AVG(m.home_goal + m.away_goal) AS avg_goals,
    -- Rank each league according to the average goals
    RANK() OVER(ORDER BY AVG(m.home_goal + m.away_goal)) AS league_rank
FROM league AS l
LEFT JOIN match AS m 
ON l.id = m.country_id
WHERE m.season = '2011/2012'
GROUP BY l.name
-- Order the query by the rank you created
ORDER BY league_rank;
--partition: aggregate function that is specified based on other column value 
--horizontal partition = split up table  by rows 
SELECT
	date,
	season,
	home_goal,
	away_goal,
	CASE WHEN hometeam_id = 8673 THEN 'home' 
		 ELSE 'away' END AS warsaw_location,
    -- Calculate the average goals scored partitioned by season
    AVG(home_goal) OVER(PARTITION BY season) AS season_homeavg,
    AVG(away_goal) OVER(PARTITION BY season) AS season_awayavg
FROM match
-- Filter the data set for Legia Warszawa matches only
WHERE 
	hometeam_id = 8673
	OR awayteam_id = 8673
ORDER BY (home_goal + away_goal) DESC;

--creating new table with table partitions
-- Create a new table called film_partitioned
CREATE TABLE film_partitioned (
  film_id INT,
  title TEXT NOT NULL,
  release_year TEXT
)
PARTITION BY LIST (release_year);

-- Create the partitions for 2019, 2018, and 2017
CREATE TABLE film_2019
	PARTITION OF film_partitioned FOR VALUES IN ('2019');

CREATE TABLE film_2018
	PARTITION OF film_partitioned FOR VALUES IN ('2018');

CREATE TABLE film_2017
	PARTITION OF film_partitioned FOR VALUES IN ('2017');

-- Insert the data into film_partitioned
INSERT INTO film_partitioned
SELECT film_id, title, release_year FROM film;

-- View film_partitioned
SELECT * FROM film_partitioned;


--sliding window functions: aggregates relative to row 
--doesnt make sense
SELECT 
	-- Select the date, home goal, and away goals
     date,
     home_goal,
     away_goal,
    -- Create a running total and running average of home goals
    SUM(home_goal) OVER(ORDER BY date DESC
         ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS running_total,
    AVG(home_goal) OVER(ORDER BY date DESC
         ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS running_avg
FROM match
WHERE 
	awayteam_id = 9908 
    AND season = '2011/2012';
	
--putting it all together
-- Set up the home team CTE
WITH home AS (
  SELECT m.id, t.team_long_name,
	  CASE WHEN m.home_goal > m.away_goal THEN 'MU Win'
		   WHEN m.home_goal < m.away_goal THEN 'MU Loss' 
  		   ELSE 'Tie' END AS outcome
  FROM match AS m
  LEFT JOIN team AS t ON m.hometeam_id = t.team_api_id),
-- Set up the away team CTE
away AS (
  SELECT m.id, t.team_long_name,
	  CASE WHEN m.home_goal > m.away_goal THEN 'MU Loss'
		   WHEN m.home_goal < m.away_goal THEN 'MU Win' 
  		   ELSE 'Tie' END AS outcome
  FROM match AS m
  LEFT JOIN team AS t ON m.awayteam_id = t.team_api_id)
-- Select columns and and rank the matches by goal difference
SELECT DISTINCT
    date,
    home.team_long_name AS home_team,
    away.team_long_name AS away_team,
    m.home_goal, m.away_goal,
    RANK() OVER(ORDER BY ABS(home_goal - away_goal) DESC) as match_rank
-- Join the CTEs onto the match table
FROM match AS m
LEFT JOIN home ON m.id = home.id
LEFT JOIN away ON m.id = away.id
WHERE m.season = '2014/2015'
      AND ((home.team_long_name = 'Manchester United' AND home.outcome = 'MU Loss')
      OR (away.team_long_name = 'Manchester United' AND away.outcome = 'MU Loss'));
	  
--anatomy of a window function: 
function_name() OVER (...)

--assigning row_number
ROW_NUMBER() OVER() AS Row_N

--order_by inside vs order_by outside: inside takes place first 

--returns column's value at row n rows before current row (previous event)
LAG(columnm, n) OVER(..) 

--order by with row number example
SELECT
  Year,
  -- Assign the lowest numbers to the most recent years
  ROW_NUMBER() OVER (ORDER BY Year DESC) AS Row_N
FROM (
  SELECT DISTINCT Year
  FROM Summer_Medals
) AS Years
ORDER BY Year DESC;

--lag example:
WITH Weightlifting_Gold AS (
  SELECT
    -- Return each year's champions' countries
    Year,
    Country AS champion
  FROM Summer_Medals
  WHERE
    Discipline = 'Weightlifting' AND
    Event = '69KG' AND
    Gender = 'Men' AND
    Medal = 'Gold')
SELECT
  Year, Champion, -- this fetches current champion (need to select current and lag to have both in table)
  -- Fetch the previous year's champion
  LAG(Champion, 1) OVER
    (order by Year ASC) AS Last_Champion
FROM Weightlifting_Gold
ORDER BY Year ASC;

--lag with order and partition
SELECT
  Gender, Year,
  Country AS Champion,
  -- Fetch the previous year's champion by gender
  LAG(Country, 1) OVER (PARTITION BY Gender
                        ORDER BY Year ASC) AS Last_Champion
FROM Tennis_Gold
ORDER BY Gender ASC, Year ASC;

--returning value after current row (so future event):
LEAD(column, n)

--returns first value in table
FIRST_VALUE(column)

SELECT
  -- Fetch all athletes and the first athlete alphabetically
  athlete,
  FIRST_VALUE(athlete) OVER (
    ORDER BY athlete ASC
  ) AS First_Athlete
FROM All_Male_Medalists;
--returns last value in table
LAST_VALUE(column)

--ranking:
ROW_NUMBER() every row gets a different value, does not matter if identical
RANK() assigns same number to rows with identical values & skips over (1..2..2..4)
RANK() OVER(ORDER BY AVG(m.home_goal + m.away_goal)) AS league_rank(1..2..2..3)

DENSE_RANK() assigns same number to rows with identical values but does not skip over

--paging = paging data into quartiles 
NTILE(intohowmanypages) -> can create a new column header so you know which quantile row occupies
  Thirds AS (
  SELECT
    Athlete,
    Medals,
    NTILE(3) OVER (ORDER BY Medals DESC) AS Third
  FROM Athlete_Medals)
SELECT
  -- Get the average medals earned in each third
  Third,
  AVG(Medals) AS Avg_Medals
FROM Thirds
GROUP BY Third
ORDER BY Third ASC
  
--frames: aggregate value taking from specific rows 
ROWS BETWEEN CURRENT ROW AND 1 FOLLOWING: future
"" AND PRECEDING: previous

--using average with these frame functions - moving average

--pivoting: reversing rows with columns
-- Create the correct extension to enable CROSSTAB
CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT * FROM CROSSTAB($$
  SELECT
    Gender, Year, Country
  FROM Summer_Medals
  WHERE
    Year IN (2008, 2012)
    AND Medal = 'Gold'
    AND Event = 'Pole Vault'
  ORDER By Gender ASC, Year ASC;
-- Fill in the correct column names for the pivoted table
$$) AS ct (Gender VARCHAR,
           "2008" VARCHAR,
           "2012" VARCHAR)
CREATE EXTENSION IF NOT EXISTS tablefunc;

--ANOTHER
SELECT * FROM CROSSTAB($$
  WITH Country_Awards AS (
    SELECT
      Country,
      Year,
      COUNT(*) AS Awards
    FROM Summer_Medals
    WHERE
      Country IN ('FRA', 'GBR', 'GER')
      AND Year IN (2004, 2008, 2012)
      AND Medal = 'Gold'
    GROUP BY Country, Year)

  SELECT
    Country,
    Year,
    RANK() OVER
      (PARTITION BY Year
       ORDER BY Awards DESC) :: INTEGER AS rank
  FROM Country_Awards
  ORDER BY Country ASC, Year ASC;
-- Fill in the correct column names for the pivoted table
$$) AS ct (Country VARCHAR,
           "2004" INTEGER,
           "2008" INTEGER,
           "2012" INTEGER)

Order by Country ASC;

--group totals: 
--rollup for specific group totals
-- Count the gold medals per country and gender
SELECT
  Country,
  Gender,
  COUNT(*) AS Gold_Awards
FROM Summer_Medals
WHERE
  Year = 2004
  AND Medal = 'Gold'
  AND Country IN ('DEN', 'NOR', 'SWE')
-- Generate Country-level subtotals
GROUP BY Country, ROLLUP(Gender)
ORDER BY Country ASC, Gender ASC;

--all possible group-level subtotals
-- Count the medals per gender and medal type
SELECT
  Gender,
  Medal,
  COUNT(*) AS Awards
FROM Summer_Medals
WHERE
  Year = 2012
  AND Country = 'RUS'
-- Get all possible group-level subtotals
GROUP BY CUBE(Gender, medal)
ORDER BY Gender ASC, Medal ASC;

--get rid of nulls - only for grouping 
SELECT
  -- Replace the nulls in the columns with meaningful text
  COALESCE(Country, 'All countries') AS Country,
  COALESCE(Gender, 'All gender') AS Gender,
  COUNT(*) AS Awards
FROM Summer_Medals
WHERE
  Year = 2004
  AND Medal = 'Gold'
  AND Country IN ('DEN', 'NOR', 'SWE')
GROUP BY ROLLUP(Country, Gender)
ORDER BY Country ASC, Gender ASC;

--UNDERSTANDING INFO ABOUT DATABASE
SELECT * 
 FROM INFORMATION_SCHEMA.COLUMNS
 or FROM INFORMATION_SCHEMA.TABLES
 
--interval data types 
SELECT
 	-- Select the rental and return dates
	rental_date,
	return_date,
 	-- Calculate the expected_return_date
	rental_date + INTERVAL '3 days' AS expected_return_date
FROM rental;

--searching in sql
SELECT
  title, 
  special_features 
FROM film 
-- Modify the query to use the ANY function (search for trailers in any index of special features column)
WHERE 'Trailers' = ANY(special_features);

--you can subtract timestamps from each other to get the AGE() of time interval
-- Convert the rental_duration to an interval
SELECT INTERVAL '1' day * f.rental_duration,

--super easy to select current date
SELECT CURRENT_DATE, CURRENT_TIMESTAMP

--grouping by dayofweek
-- Extract day of week from rental_date
SELECT 
  EXTRACT(dow FROM rental_date) AS dayofweek, 
  -- Count the number of rentals
  COUNT(*) as rentals 
FROM rental 
GROUP BY 1;

--adding character strings to get large character string
-- Concatenate the first_name and last_name and email
SELECT CONCAT(first_name,' ' , last_name,  ' <', email, '>') AS full_email 
FROM customer

--uppercase and concatonate
SELECT 
  -- Concatenate the category name to coverted to uppercase
  -- to the film title converted to title case
  UPPER(c.name)  || ': ' || INITCAP(f.title) AS film_category, 
  -- Convert the description column to lowercase
  LOWER(f.description) AS description
FROM 
  film AS f 
  INNER JOIN film_category AS fc 
  	ON f.film_id = fc.film_id 
  INNER JOIN category AS c 
  	ON fc.category_id = c.category_id;
	
--replacing strings
SELECT 
  -- Replace whitespace in the film title with an underscore
  REPLACE(title, ' ', '_') AS title
FROM film; 

  -- Determine the length of the description column
  LENGTH(description) AS desc_len
FROM film;

--selecting first 50 characters
SELECT 
  LEFT(description, 50) AS short_desc
FROM 
  film AS f;
  
--EXTREMELY USEFUL FUNCTION!!
--selecting part of character string given position of motif 
SELECT 
  -- Select only the street name from the address table
  SUBSTRING(address FROM POSITION(' ' in address) +1 FOR LENGTH(address))
FROM 
  address;
  
--PUTTING IT TOGETHER
  SELECT
  -- Extract the characters to the left of the '@'
  LEFT(email, POSITION('@' IN email)-1) AS username,
  -- Extract the characters to the right of the '@'
  SUBSTRING(email FROM POSITION('@' IN email)+1 FOR LENGTH(email)) AS domain
FROM customer;

--creating enum datatypes: creating a column of values that is fact, do not change
-- Create an enumerated data type, compass_position
CREATE TYPE compass_position AS ENUM (
  	-- Use the four cardinal directions
  	'North', 
  	'South',
  	'East', 
  	'West'
);
-- Confirm the new data type is in the pg_type system table
SELECT typname, typcategory
FROM pg_type
WHERE typname='compass_position';

--how to create a new extension (i guess like a new package)
-- Enable the pg_trgm extension
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- confirmed enabled extensions
SELECT *
FROM pg_extension;

---types of database processing: OLTP = money, more normalized; OLAP = analytics, less normalized

--data warehouse:
--contains data from multiple sources, used for aggregating, massively parallel processing, AZURE
--data mart is a subset of a data warehouse, dedicated to specific topic
--etl
--adaption of relation model is dimensional modeling

--data lakes:
--store all types of data (like unstructured) at a lower cost
--run big data analytics with apache spark and hadoop
--elt

--database design = how data is stored
--database model = specifications for database structure like relational model of sql
--schema = blueprint of database and relationship of tables to each other 
--conceptual, logical and physical

--creating dimension tables;
-- Create a route dimension table
CREATE TABLE route(
	route_id INTEGER PRIMARY KEY,
    city_name VARCHAR(160) NOT NULL,
    park_name VARCHAR(160) NOT NULL,
    distance_km FLOAT NOT NULL,
    route_name VARCHAR(160) NOT NULL
);
-- Create a week dimension table
CREATE TABLE week(
	week_id INTEGER PRIMARY KEY,
    week INTEGER NOT NULL,
    month VARCHAR(160) NOT NULL,
    year INTEGER NOT NULL
);
--star schema = dimensional modeling 
--composed of fact and dimension tables
--snowflake is more complicated than star, more dimensions and extensions
--normalization - dividing tables into smaller tables and connecting via relationships 
--tried to limit repeats, breaks it down into repeatable units 

--connecting dimensional table to fact table
-- Add the book_id foreign key
ALTER TABLE fact_booksales ADD CONSTRAINT sales_book
    FOREIGN KEY (book_id) REFERENCES dim_book_star (book_id);
	
--creating a new dimensional table
-- Create a new table for dim_author with an author column
CREATE TABLE dim_author (
    author varchar(256)  NOT NULL
);
-- Insert authors (you actually have to insert data)
INSERT INTO dim_author
SELECT DISTINCT author FROM dim_book_star;
-- Add a primary key 
ALTER TABLE dim_author ADD COLUMN author_id SERIAL PRIMARY KEY
-- Output the new table
SELECT * FROM dim_author;

--finding views within a database
-- Get all non-systems views
SELECT * FROM information_schema.views
WHERE table_schema NOT IN ('pg_catalog', 'information_schema');

-- Revoke everyone's update and insert privileges
REVOKE UPDATE, INSERT ON long_reviews FROM PUBLIC; 
-- Grant the editor update and insert privileges 
GRANT UPDATE, INSERT ON long_reviews TO EDITOR; 

--creating role with prviledges
-- Create an admin role
CREATE ROLE admin WITH CREATEDB CREATEROLE;

--adding users to groups
-- Add Marta to the data scientist group
GRANT data_scientist TO MARTA;