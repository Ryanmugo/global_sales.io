/* 


  Data Testing:
  1. No. of rows.
  2. No. of columns.
  3. Data Types.


*/
USE global_sales
-- TEST 1: ROW COUNT CHECK:

SELECT 
  COUNT(*) AS no_of_rows
FROM sales_performance

---------------------------------------------

-- TEST 2: COLUMN COUNT CHECK:
SELECT 
  COUNT(*) AS no_of_columns
FROM 
  INFORMATION_SCHEMA.COLUMNS
WHERE 
  TABLE_NAME = 'sales_performance'

------------------------------------------------

-- TEST 3: DATA TYPE CHECK:

SELECT 
  COLUMN_NAME, DATA_TYPE
FROM 
  INFORMATION_SCHEMA.COLUMNS
WHERE 
  TABLE_NAME = 'sales_performance'

-----------------------

---- TEST 4: DUPLICATE RECORDS CHECK:

SELECT customer_name, COUNT(*) AS DUPLICATE_COUNT
FROM sales_performance
GROUP BY customer_name
HAVING COUNT(*) > 1