SELECT *
FROM pizza_sales

-- Total Revenue

SELECT ROUND(SUM(total_price), 2) AS Total_Revenue
FROM pizza_sales


-- Average Order Value

	SELECT ROUND(SUM(total_price)/COUNT(DISTINCT order_id), 2) AS AverageOrderValue
	FROM pizza_sales


-- Total Pizzas Sold

SELECT SUM(quantity) AS Total_Pizzas_Sold
FROM pizza_sales


-- Total Orders

SELECT COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales

-- Average Pizzas Per Order

SELECT CAST(CAST(SUM(quantity) AS decimal(10,2))/CAST(COUNT(DISTINCT order_id) AS decimal(10,2)) AS decimal(10,2)) 
AS AveragePizzasPerOrder
FROM pizza_sales


-- Daily Trend for Total Orders

SELECT DATENAME(DW, order_date) AS order_day, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(DW, order_date)
order by Total_Orders DESC;


-- Hourly Trend for Total Orders

SELECT DATEPART(HOUR, order_time) AS order_hour, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATEPART(HOUR, order_time)
ORDER BY Total_Orders DESC;

-- Monthly Trend for Total Orders

SELECT DATENAME(MONTH, order_date) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY DATENAME(MONTH, order_date)
ORDER BY Total_Orders DESC;


-- Percentage of Sales By Pizza Category

SELECT pizza_category, ROUND(SUM(total_price) * 100/(SELECT SUM(total_price) FROM pizza_sales), 2)
AS PercentPizzaSales
FROM pizza_sales
GROUP BY pizza_category
ORDER BY PercentPizzaSales DESC;

-- Percentage of Sales By Pizza Size

SELECT pizza_size, ROUND(SUM(total_price) * 100/(SELECT SUM(total_price) FROM pizza_sales), 2)
AS PercentPizzaSales
FROM pizza_sales
GROUP BY pizza_size
ORDER BY PercentPizzaSales DESC;

--Total Pizzas Sold By Pizza Category

SELECT pizza_category, SUM(quantity) AS Total_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Sold DESC;

-- Top 5 Pizzas By Revenue

SELECT TOP 5 pizza_name ,SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

--Top 5 Best Sellers By Total Pizzas Sold

SELECT TOP 5 pizza_name ,SUM(quantity) AS Total_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sold DESC


--Top 5 Worst Sellers By Total Pizzas Sold

SELECT TOP 5 pizza_name ,SUM(quantity) AS Total_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Sold