/*

--- Data Analysis Questions to Ponder:
1. Who are the top 10 most frequent customers in our dataset? 
2. Which countries showed more sales?
3. What categories are sold the most and compare with profits?
4. What products product huge profit?



*/

USE global_sales
-- Question 1:

SELECT 
  TOP 10 customer_name, SUM(sales) AS total_sales
FROM 
  sales_performance
GROUP BY 
  customer_name
ORDER BY 
  SUM(sales) DESC;

---------------------------------------------------------

-- Question 2: 

SELECT  region, SUM(sales) AS total_sales, ROUND(SUM(profit),0) AS total_profits 
FROM 
 sales_performance
GROUP BY 
  region
ORDER BY 
  total_sales DESC, total_profits DESC

------------------------------------------------------------

-- Question 3: 

SELECT category, SUM(sales) AS total_sales, ROUND(SUM(profit),0) AS profit
FROM 
  sales_performance
GROUP BY 
  category
ORDER BY 
  total_sales DESC, profit DESC


-------------------------------------------------------------

-- Question 4:

SELECT 
  TOP 10 product_name, category, ROUND(SUM(profit),0) AS total_profits
FROM 
  sales_performance
GROUP BY 
  product_name,category
ORDER BY 
  total_profits DESC