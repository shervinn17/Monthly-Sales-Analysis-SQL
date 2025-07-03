
-- 1. Monthly Revenue and Order Volume
SELECT
    EXTRACT(YEAR FROM "Order Date") AS Year,
    EXTRACT(MONTH FROM "Order Date") AS Month,
    SUM(Sales) AS Revenue,
    COUNT(DISTINCT "Order ID") AS Order_Volume
FROM sales_table
GROUP BY Year, Month
ORDER BY Year, Month;

-- 2. Monthly Revenue, Order Volume, and Average Order Value
SELECT
    EXTRACT(YEAR FROM "Order Date") AS Year,
    EXTRACT(MONTH FROM "Order Date") AS Month,
    SUM(Sales) AS Revenue,
    COUNT(DISTINCT "Order ID") AS Order_Volume,
    ROUND(SUM(Sales) / COUNT(DISTINCT "Order ID"), 2) AS Avg_Order_Value
FROM sales_table
GROUP BY Year, Month
ORDER BY Year, Month;

-- 3. Monthly Revenue Growth (MySQL < 8 workaround using self-join)
SELECT
    curr.Year,
    curr.Month,
    curr.Monthly_Revenue,
    prev.Monthly_Revenue AS Prev_Month_Revenue,
    ROUND(
        (curr.Monthly_Revenue - prev.Monthly_Revenue) / NULLIF(prev.Monthly_Revenue, 0) * 100, 2
    ) AS Revenue_Growth_Percent
FROM (
    SELECT
        YEAR(`Order Date`) AS Year,
        MONTH(`Order Date`) AS Month,
        SUM(Sales) AS Monthly_Revenue
    FROM sales_table
    GROUP BY YEAR(`Order Date`), MONTH(`Order Date`)
) AS curr
LEFT JOIN (
    SELECT
        YEAR(`Order Date`) AS Year,
        MONTH(`Order Date`) AS Month,
        SUM(Sales) AS Monthly_Revenue
    FROM sales_table
    GROUP BY YEAR(`Order Date`), MONTH(`Order Date`)
) AS prev
ON (curr.Year = prev.Year AND curr.Month = prev.Month + 1)
   OR (curr.Year = prev.Year + 1 AND curr.Month = 1 AND prev.Month = 12)
ORDER BY curr.Year, curr.Month;

-- 4. Filter: Specific Year (e.g., 2019)
SELECT
    EXTRACT(MONTH FROM "Order Date") AS Month,
    SUM(Sales) AS Revenue,
    COUNT(DISTINCT "Order ID") AS Order_Volume
FROM sales_table
WHERE EXTRACT(YEAR FROM "Order Date") = 2019
GROUP BY Month
ORDER BY Month;

-- 5. Top 5 Months by Revenue
SELECT
    EXTRACT(YEAR FROM "Order Date") AS Year,
    EXTRACT(MONTH FROM "Order Date") AS Month,
    SUM(Sales) AS Revenue
FROM sales_table
GROUP BY Year, Month
ORDER BY Revenue DESC
LIMIT 5;

