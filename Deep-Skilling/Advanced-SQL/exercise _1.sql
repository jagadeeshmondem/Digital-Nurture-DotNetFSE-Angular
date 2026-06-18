create database dotnet;
use  dotnet;
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(50),
    Category VARCHAR(30),
    Price DECIMAL(10,2)
);
INSERT INTO Products VALUES
(1, 'iPhone 15', 'Electronics', 80000),
(2, 'Samsung S24', 'Electronics', 75000),
(3, 'OnePlus 12', 'Electronics', 65000),
(4, 'Pixel 8', 'Electronics', 65000),
(5, 'Boat Earbuds', 'Electronics', 3000),

(6, 'Sofa', 'Furniture', 50000),
(7, 'Dining Table', 'Furniture', 45000),
(8, 'Bed', 'Furniture', 45000),
(9, 'Chair', 'Furniture', 10000),
(10, 'Cupboard', 'Furniture', 30000),

(11, 'Nike Shoes', 'Fashion', 7000),
(12, 'Adidas Shoes', 'Fashion', 7000),
(13, 'Puma Shoes', 'Fashion', 6000),
(14, 'Levis Jeans', 'Fashion', 4000),
(15, 'T-Shirt', 'Fashion', 1500);
select * from products;
-- Row Number
SELECT
    ProductName,
    Category,
    Price,
    ROW_NUMBER() OVER(
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS RowNum
FROM Products;

-- Rank

SELECT
    ProductName,
    Category,
    Price,
    RANK() OVER(
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS RankNo
FROM Products;

-- Dense rank

SELECT
    ProductName,
    Category,
    Price,
    DENSE_RANK() OVER(
        PARTITION BY Category
        ORDER BY Price DESC
    ) AS DenseRankNo
FROM Products;

-- top 3 using rank

SELECT *
FROM (
    SELECT
        ProductName,
        Category,
        Price,
        RANK() OVER(
            PARTITION BY Category
            ORDER BY Price DESC
        ) AS RankNo
    FROM Products
) T
WHERE RankNo <= 3;

