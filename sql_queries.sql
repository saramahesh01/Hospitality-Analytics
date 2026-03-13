use Hospitality_Analytics_Project1;

select * from Master_table_cleaned;

-- Market Overview (City Level Analysis)
-- Q1 — How many hotels per city?
SELECT 
    City,
    COUNT(*) AS Total_Hotels
FROM Master_table_cleaned
GROUP BY City
ORDER BY Total_Hotels DESC;

-- Q2 — % market share of each city
SELECT 
    City,
    FORMAT(COUNT(*) * 1.0 / (SELECT COUNT(*) FROM Master_table_cleaned), 'P2') AS Market_Percentage
FROM Master_table_cleaned
GROUP BY City
ORDER BY Market_Percentage DESC;

-- Q3 — Average price by city
SELECT 
    City,
    AVG(Price) AS Avg_Price
FROM Master_table_cleaned
GROUP BY City
ORDER BY Avg_Price DESC;

-- Q4 — Average rating by city
SELECT 
    City,
    CAST(AVG(Rating) AS DECIMAL(10,1)) AS Avg_Rating
FROM Master_table_cleaned
WHERE Rating IS NOT NULL
GROUP BY City
ORDER BY Avg_Rating DESC;

-- Q5 — Total reviews by city (demand indicator)
SELECT 
    City,
    SUM(Reviews) AS Total_Reviews
FROM Master_table_cleaned
GROUP BY City
ORDER BY Total_Reviews DESC;

-- Pricing Strategy Analysis
-- Q6 — Overall price statistics
SELECT DISTINCT
    MIN(Price) OVER() AS Min_Price,
    MAX(Price) OVER() AS Max_Price,
    CAST(AVG(Price) OVER() AS DECIMAL(10,2)) AS Avg_Price,
    PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Price) OVER() AS Median_Price
FROM Master_table_cleaned;

--Q7 — Top 10 most expensive hotels
SELECT TOP 10
    Hotel_Name,
    City,
    Price
FROM Master_table_cleaned
ORDER BY Price DESC;

--Q8 — Cheapest hotels with good ratings (>8)
SELECT TOP 10
    Hotel_Name,
    City,
    Price,
    Rating
FROM Master_table_cleaned
WHERE Rating >= 8
ORDER BY Price ASC;

--Q9 — Price segments (Budget / Mid / Luxury)
SELECT 
    CASE 
        WHEN Price < 2000 THEN 'Budget'
        WHEN Price BETWEEN 2000 AND 5000 THEN 'Mid-range'
        ELSE 'Luxury'
    END AS Price_Category,
    COUNT(*) AS Hotel_Count,
    CAST(AVG(Rating) AS DECIMAL(10,1)) AS Avg_Rating
FROM Master_table_cleaned
GROUP BY 
    CASE 
        WHEN Price < 2000 THEN 'Budget'
        WHEN Price BETWEEN 2000 AND 5000 THEN 'Mid-range'
        -- Ensure the logic in GROUP BY exactly matches the SELECT CASE statement
        ELSE 'Luxury'
    END
ORDER BY 
    -- This keeps the categories in a logical price order (Budget -> Mid -> Luxury)
    MIN(Price) ASC;

-- Customer Satisfaction (Ratings Analysis)
--Rating distribution
SELECT
    FLOOR(Rating) AS Rating_Band,
    COUNT(*) AS Hotels
FROM Master_table_cleaned
WHERE Rating IS NOT NULL
GROUP BY FLOOR(Rating)
ORDER BY Rating_Band;

--Q11 — Low-rated hotels (<6)
SELECT
    Hotel_Name,
    City,
    Rating,
    Reviews
FROM Master_table_cleaned
WHERE Rating < 6
ORDER BY Rating ASC;

--Q12 — High price but low rating (bad value)
SELECT
    Hotel_Name,
    City,
    Price,
    Rating
FROM Master_table_cleaned
WHERE Price > 5000
AND Rating < 7
ORDER BY Price DESC;

-- Q13 — Average rating by price segment
SELECT 
    CASE 
        WHEN Price < 2000 THEN 'Budget'
        WHEN Price BETWEEN 2000 AND 5000 THEN 'Mid-range'
        ELSE 'Luxury'
    END AS Segment,
    CAST(AVG(Rating) AS DECIMAL(10,1)) AS Avg_Rating
FROM Master_table_cleaned
WHERE Rating IS NOT NULL
GROUP BY 
    CASE 
        WHEN Price < 2000 THEN 'Budget'
        WHEN Price BETWEEN 2000 AND 5000 THEN 'Mid-range'
        ELSE 'Luxury'
    END
ORDER BY 
    -- We use MIN(Price) to tell SQL to sort based on the lowest price in each group
    MIN(Price) ASC;

--Demand & Popularity (Reviews Analysis)
-- Q14 - Most reviewed hotels
SELECT TOP 10
    Hotel_Name,
    City,
    Reviews,
    Rating
FROM Master_table_cleaned
ORDER BY Reviews DESC;

--Q15 — Reviews per city
SELECT
    City,
    SUM(Reviews) AS Total_Reviews,
    AVG(Reviews) AS Avg_Reviews
FROM Master_table_cleaned
GROUP BY City
ORDER BY Total_Reviews DESC;

--Q16 — Hotels with many reviews but low ratings (service issue)
SELECT
    Hotel_Name,
    City,
    Reviews,
    Rating
FROM Master_table_cleaned
WHERE Reviews > 1000
AND Rating < 7
ORDER BY Reviews DESC;

-- Combined Insights (Advanced / impressive)
--Q17 — Best value hotels (low price + high rating)
SELECT TOP 10
    Hotel_Name,
    City,
    Price,
    Rating
FROM Master_table_cleaned
WHERE Rating >= 8
ORDER BY Price ASC;

-- Q18 — Worst value hotels (high price + low rating)
SELECT TOP 10
    Hotel_Name,
    City,
    Price,
    Rating
FROM Master_table_cleaned
WHERE Rating < 6
ORDER BY Price DESC;

-- Q19 — Correlation prep (export for Power BI/Python)
SELECT
    Price,
    Rating,
    Reviews
FROM Master_table_cleaned
WHERE Rating IS NOT NULL;

-- Rated vs Unrated Hotels Analysis (Customer Engagement & Pricing)
--Q20 - What is the average price of rated vs unrated hotels?
SELECT
    CASE 
        WHEN Rating IS NULL THEN 'No Rating'
        ELSE 'Rated'
    END AS Rating_Group,
    AVG(Price) AS Avg_Price
FROM Master_table_cleaned
GROUP BY 
    CASE 
        WHEN Rating IS NULL THEN 'No Rating'
        ELSE 'Rated'
    END;


-- Q21 - Which cities have the most unrated hotels?
SELECT
    City,
    COUNT(*) AS No_Rating_Hotels
FROM Master_table_cleaned
WHERE Rating IS NULL
GROUP BY City
ORDER BY No_Rating_Hotels DESC;


