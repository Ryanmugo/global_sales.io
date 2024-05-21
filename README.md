# Data Portfolio: Excel to Power BI

![excel-to-powerbi-image](assets/images/Kaggle_to_powerbi.png)

# Table of Contents

- [Objective](#Objective)
- [Data Source](#Data-Source)
- [Stages](#Stages)
- [Design](#Design)
  - [Mockup](#Mockup)
  - [Tools](#Tools)
- [Development](#Development)
  - [Pseudocode](#Pseudocode)
  - [Data Exploration](#Data-Exploration)
  - [Data Cleaning](#Data-Cleaning)
  - [Transforming the Data](#Transforming-the-Data)
  - [Create the SQL View](#Create-the-SQL-View)
- [Testing](#Testing)
  - [Data Quality Tests](#Data-Quality-Tests)
- [Visualization](#Visualization)
  - [Results](#Results)
  - [DAX Measures](#DAX-Measures)
- [Analysis](#Analysis)
  - [Findings](#Findings)
  - [Validation](#Validation)
  - [Discovery](#Discovery)
- [Conclusion](#Conclusion)


# Objective

 ## What is the key main point?

 - The Sales Department is interested in gaining insights into the following areas:

   - ***1. Top Most Frequent Customers:***  Identify the customers who make purchases most frequently to allow the company to tailor loyalty programs and reward them to retain them due to them being an asset to them.

   - ***2. Sales Distribution by Region:***  Analyzing sales performance across different regions and determing which region has the highest sales.
  
   - ***3. Sales Distribution by Country:***  Understanding which product categories are sold the most and which catgories generate the highest profits.
  
   - ***4. Top Profitable Products:***  Identifying the products that yield the most profit.
  
 - ## What is the ideal solution?

    - To create an interactive and insightful Power BI dashboard that provides the Sales Department with key insights into customer behavior, sales performance across regions, product category performance and profitability. This will help the department make informed decisions based on statistics and visual data representations. 
   

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

To understand what it should contain, we need to figure out what questions we need the dashboard to answer:

 - 1. Who are the top most frequent customers?
 - 2. What is the distribution of sales by region?
 - 3. How is the sales distribution segmented by country?
 - 4. What are the top profitable products?

### Dashboard Mockup

- What should it look like?

Some of the data visuals that may be appropriate in answering our questions include:

1. Stacked column chart
2. Pie chart
3. Map
4. Treemap


### Tools

## Tools and Their Purposes

| Tool        | Purpose                                            |
|-------------|----------------------------------------------------|
| Excel       | Exploring the data                                 |
| SQL Server  | Cleaning, testing, and analyzing the data          |
| Power BI    | Visualizing the data via interactive dashboards    |
| GitHub      | Hosting the project documentation and version control |

