-- Database Creation-- 
--Create a database to store the sales data.Create a table named "sales_sample" with the specified columns.

CREATE TABLE sales_sample(

    Product_Id INT NOT NULL,

    Region VARCHAR(20) NOT NULL CHECK (Region IN ('East', 'West', 'North', 'South')),

    [Date] DATE,

    Sales_Amount numeric(10,2)

);


--2. Data Creation--

--Insert 10 sample records into the "sales_sample" table, representing sales data.-- 

INSERT INTO sales_sample(Product_Id, Region, [Date], Sales_Amount)

VALUES

(101, 'East',  '2025-01-10', 5000),

(101, 'North',  '2025-01-15', 5500),

(102, 'West',  '2025-02-01', 6200),

(103, 'South', '2025-02-10', 7100),

(101, 'North',  '2025-03-05', 9800),

(102, 'East',  '2025-03-15', 5300),

(103, 'West',  '2025-04-10', 3900),

(102, 'South', '2025-04-12', 2400),

(103, 'North',  '2025-05-01', 6000),

(101, 'South', '2025-05-10', 4000);

 
-- 3. Perform OLAP operations --

-- 3(a): Drill-down: #Write a query to perform drill down from region 
--to product level to understand sales performance.

--Method 1

PRINT 'Drill-down: Sales by Region and Product';

SELECT region, product_Id, SUM(sales_amount) AS total_sales_amt 

FROM sales_sample

GROUP BY Region, Product_Id

ORDER BY Region, Product_Id;

GO

-------------------------------------------------

--Method 2 - with drill-down data

SELECT ISNULL(Region, 'All Regions') AS sales_region, 

ISNULL(CAST(Product_Id AS VARCHAR), 'Subtotal') AS sales_products,

SUM(Sales_Amount) AS total_sales_amt,

GROUPING_ID(Region, Product_Id) AS drill_down_level

FROM sales_sample

GROUP BY ROLLUP (Region, Product_Id)

ORDER BY GROUPING_ID(Region, Product_Id), sales_region, sales_products;

GO

-------------------------------------------------


--3(b):rollup: To summarize sales data at different levels of granularity.

--Write a query to perform roll up from product to region level to view total sales by region. 

PRINT 'Rollup: Sales by Region and Product with Subtotals';

SELECT region, product_Id, SUM(sales_amount) AS total_sales_amt 

FROM sales_sample

GROUP BY ROLLUP (region, product_Id);

GO

--3(c):cube:Write a query to explore sales data from different perspectives, such as product, region, and date.


PRINT 'Cube: Sales by Product, Region, and Date';

SELECT

    ISNULL(CAST(Product_Id AS VARCHAR(20)), 'All Products IDs') AS Product_Id,

    ISNULL(Region, 'All Regions Details') AS Region,

    ISNULL(CONVERT(VARCHAR(10), [Date], 120), 'ALL Dates') AS Sale_Date,

    SUM(Sales_Amount) AS Total_Sales_Amt

FROM sales_sample

GROUP BY CUBE (Product_Id, Region, [Date])

ORDER BY Product_Id, Region, [Date];

GO


--3(d) slice:Write a query to slice the data to view sales for a particular region or date range.

PRINT 'Slice: Sales for West Region';

SELECT * FROM sales_sample

WHERE Region = 'West' --Filtering One dimension--

ORDER BY Product_Id;

GO

--or --

PRINT 'Slice: Sales from Feb to March 2025';

SELECT * FROM sales_sample

WHERE [Date] BETWEEN '2025-02-01' AND '2025-03-30';  --Filtering One dimension--

GO

-- 3(e) dice: Write a query to view sales for specific combinations of product, region, and date

PRINT 'Dice: Sales for Product 101 and 103 in West and East'; --2+ dimensions filtering 

SELECT * FROM sales_sample

WHERE Product_Id IN(101,103) AND Region IN('South', 'West') AND [Date] IN ('2025-02-10', '2025-04-10');

GO


