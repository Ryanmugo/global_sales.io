-- Creation of View
CREATE VIEW sales_performance AS
SELECT 
   order_id,customer_name, segment, region, category, product_name, sales, profit  
FROM SuperStoreOrders;