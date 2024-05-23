# Data Portfolio: Excel to Power BI

![excel-to-powerbi-image](assets/images/Kaggle_to_powerbi.png)

# Table of Contents  

- [Objective](#Objective)
- [Data Source](#Data-Source)
- [Stages](#Stages)
- [Design](#Design)
  - [Dashboard Mockup](#Dashboard-Mockup)
  - [Tools](#Tools)
- [Development](#Development)
  - [Pseudocode](#Pseudocode)
  - [Data Cleaning](#Data-Cleaning)
  - [Creating the SQL View](#Creating-the-SQL-View)
- [Testing](#Testing)
- [Visualization](#Visualization)
  - [Results](#Results)
  - [DAX Measures](#DAX-Measures)
- [Analysis](#Analysis)
  - [Findings and Discoveries](#Findings-and-Discoveries)


# Objective

 - The Sales Department is interested in gaining insights into the following areas:

   - ***1. Top Most Frequent Customers:***  Identify customers who make purchases most frequently to allow the company to tailor loyalty programs and reward them to retain them due to them being an asset to them.

   - ***2. Sales Distribution by Region:***  Analyze sales performance across different regions and determine which region has the highest sales.
  
   - ***3. Sales Distribution by Country:***  Understand which product categories are sold the most and which categories generate highest profits.
  
   - ***4. Top Profitable Products:***  Identify  products that yield the most profit.
  
 - # What is the ideal solution?

    - Creating an interactive and insightful Power BI dashboard that provides the Sales Department with key insights into customer behavior, sales performance across regions, product category performance and profitability. This will help the department make informed decisions based on statistics and visual data representations. 
   

# Data Source

- Our dataset is sourced from Kaggle, specifically from an Excel extract available at [this link](https://www.kaggle.com/datasets/laibaanwer/superstore-sales-dataset?select=SuperStoreOrders.csv). You can access it there.

# Stages

 - Design
 - Development
 - Testing
 - Analysis

## Design

### Dashboard components required

 - What should the dashboard contain based on the requirements provided?

  -  Who are the top most frequent customers?
  -  What is the distribution of sales by region?
  -  How is the sales distribution segmented by category?
  -  What are the top profitable products?

# Dashboard Mockup

- What should it look like?

Some of the data visuals that may be appropriate in making a dashboard mockup include:

1. Stacked column chart
2. Pie chart
3. Map
4. Treemap


## Tools

## Tools and Their Purposes

| Tool        | Purpose                                            |
|-------------|----------------------------------------------------|
| Excel       | Exploring the data                                 |
| SQL Server  | Cleaning, testing, and analyzing the data          |
| Power BI    | Visualizing the data via interactive dashboards    |
| GitHub      | Hosting the project documentation and version control |

# Development

## Pseudocode

- What's the general approach in creating this solution from start to finish?

   1. Get the data
   2. Explore the data in Excel
   3. Load the data in SQL Server
   4. Clean the data with SQL
   5. Test the data with SQL
   6. Visualize the data in Power BI
   7. Generate the findings based on the insights
   8. Write the documentation + commentary
   9. Publish the data to GitHub Pages


# Data Cleaning

 - What do we expect the clean data to look like? (What should it contain? What constraints should we apply to it?)

The aim is to refine our dataset to ensure it is structured and ready for analysis.

The cleaned data should meet the following criteria and constraints:

 - Only relevant columns should be retained.
 - All data types should be appropriate for the contents of each column.
 - No column should contain null values, indicating complete data for all records.

  Below is a table outlining the constraints on our cleaned dataset:

| Property          | Description |
|-------------------|-------------|
| Number of Rows    | 51290       |
| Number of Columns | 8           |

Tabular representation of the expected schemafor the clean data:

| Column Name       | Data Type | Nullable |
|-------------------|-----------|----------|
| order_id          | NVARCHAR  | NO       |
| customer_name     | NVARCHAR  | NO       |
| segment           | NVARCHAR  | NO       |
| region            | NVARCHAR  | NO       |
| category          | NVARCHAR  | NO       |
| product_name      | VARCHAR   | NO       |
| sales             | SMALLINT  | NO       |
| profit            | FLOAT     | NO       |

# Creating the SQL View

```sql
-- Creation of View

CREATE VIEW sales_performance AS
SELECT 
   order_id,customer_name, segment, region, category, product_name, sales, profit  
FROM
   SuperStoreOrders;

```

# Testing

 - What data quality and validation checks are you going to create?

Here are the data quality tests: 

# Row count check

- ***SQL Query***
``` sql
/*
 Count the total number of records (or rows) are in the SQL view
*/
-- TEST 1: ROW COUNT CHECK:

SELECT 
  COUNT(*) AS no_of_rows
FROM sales_performance

```
- ***Output***
![Row-Count Image](assets/images/Row_count.png)

# Column check

- ***SQL Query***
``` sql
-- TEST 2: COLUMN COUNT CHECK:
SELECT 
  COUNT(*) AS no_of_columns
FROM 
  INFORMATION_SCHEMA.COLUMNS
WHERE 
  TABLE_NAME = 'sales_performance'

```

- ***Output***
![Column-Count Image](assets/images/column_check.png)


# Data type check

- ***SQL Query***
``` sql
  SELECT 
  COLUMN_NAME, DATA_TYPE
FROM 
  INFORMATION_SCHEMA.COLUMNS
WHERE 
  TABLE_NAME = 'sales_performance'

```
- ***Output***
![Data-Type Image](assets/images/data_type.png)


# Visualization

# Results

 - What does the dashboard look like?
  
![Data-Dashboard Image](assets/images/Sales_Dashboard.png)

# DAX Measures

# 1. Total Sales 

``` DAX

Total Sales = 
VAR totalSales = SUM(sales_performance[sales])
RETURN totalSales

```

# 2. Total Profits

``` DAX

Total Profits = 
VAR totalProfits = SUM(sales_performance[profit])
RETURN totalProfits

```

# 3. Total Products Sold

``` DAX

Total Products Sold = 
VAR totalProductsSold = DISTINCTCOUNT(product_name)
RETURN totalProductsSold

```


# 4. Average Order Value

``` DAX

Average Order Value = 
VAR avgOrderValue = SUM(sales_performance[sales]) / DISTINCTCOUNT(sales_performance[order_id])
RETURN avgOrderValue

```

# Analysis

# Findings and Discoveries

- ***1. Top most frequent customers***

``` sql

SELECT
  TOP 10 customer_name, SUM(sales) AS total_sales
FROM
  sales_performance
GROUP BY
  customer_name
ORDER BY
  SUM(sales) DESC

```

![Image](assets/images/question_1.png)



- ***2. Distribution of sales by region***

``` sql

SELECT
  region, SUM(sales) AS total_sales, ROUND(SUM(profit), 0) AS total_profits
FROM
  sales_performance
GROUP BY
  region
ORDER BY
  total_sales DESC, total_profits DESC

```

![Image](assets/images/q2a.png)

![Image](assets/images/q2b.png)



- ***3. Sales distribution by Category?***

``` sql

SELECT
  category, SUM(sales) AS total_sales, ROUND(SUM(profit), 0) AS profit
FROM
  sales_performance
GROUP BY
  category
ORDER BY
  total_sales DESC, profit DESC

```

![Image](assets/images/q3.png)



- ***4. Top Profitable Products?***

``` sql

SELECT
  TOP 10 product_name, category, ROUND(SUM(profit), 0) AS total_profits
FROM
  sales_performance
GROUP BY
  product_name,category
ORDER BY
  total_profits DESC

```

![Image](assets/images/q4.png)
