-- ## Data Exploration ##

-- Now that we have ingested our data into our database, we are able to query it to answer analytical questions.

-- For this study, we will try to answer the question:
-- Which Phylum has the largest mean CPUE per location and year?
-- This will require a join, aggregation, and filtering

-- Create aggregation table of all phylum, year, and location combinations
SELECT Year, Location, Phylum,
    -- We can specify an aggregation to calculate the mean CPUE
    AVG(Mean_cpue) AS Mean_CPUE
    -- Join the station code table to get the location names
    -- We also want to filter for only sites that are currently active
    FROM cpue JOIN (SELECT * FROM site WHERE Status = 'Active') USING (Station_code)
    -- Then we can join the organism names to get the Phylum
    JOIN org_keylist USING (Organism_code)
    -- Group values by phylum, year and location
    GROUP BY (Phylum, Year, Location)
    -- Organize by Location and Year descending
    ORDER BY Location, Year ASC;

-- Create table of only the maximum values for each year and location
SELECT Max(Mean_CPUE) AS Max_CPUE FROM (
    SELECT Year, Location, Phylum,
    -- We can specify an aggregation to calculate the mean CPUE
    AVG(Mean_cpue) AS Mean_CPUE
    -- Join the station code table to get the location names
    -- We also want to filter for only sites that are currently active
    FROM cpue JOIN (SELECT * FROM site WHERE Status = 'Active') USING (Station_code)
    -- Then we can join the organism names to get the Phylum
    JOIN org_keylist USING (Organism_code)
    -- Group values by phylum, year and location
    GROUP BY (Phylum, Year, Location)
)GROUP BY Year, Location;

-- Join tables together to get the most abundant phylum in each year and location
SELECT Phylum, Year, Location, Max_CPUE FROM (
    SELECT Max(Mean_CPUE) AS Max_CPUE FROM (
    SELECT Year, Location, Phylum,
    -- We can specify an aggregation to calculate the mean CPUE
    AVG(Mean_cpue) AS Mean_CPUE
    -- Join the station code table to get the location names
    -- We also want to filter for only sites that are currently active
    FROM cpue JOIN (SELECT * FROM site WHERE Status = 'Active') USING (Station_code)
    -- Then we can join the organism names to get the Phylum
    JOIN org_keylist USING (Organism_code)
    -- Group values by phylum, year and location
    GROUP BY (Phylum, Year, Location)
)GROUP BY Year, Location
) AS max
JOIN (
SELECT Year, Location, Phylum,
    -- We can specify an aggregation to calculate the mean CPUE
    AVG(Mean_cpue) AS Mean_CPUE
    -- Join the station code table to get the location names
    -- We also want to filter for only sites that are currently active
    FROM cpue JOIN (SELECT * FROM site WHERE Status = 'Active') USING (Station_code)
    -- Then we can join the organism names to get the Phylum
    JOIN org_keylist USING (Organism_code)
    -- Group values by phylum, year and location
    GROUP BY (Phylum, Year, Location)
) AS mean
ON max.Max_CPUE = mean.Mean_CPUE
-- Organize by Location and Year descending
ORDER BY Location, Year ASC;