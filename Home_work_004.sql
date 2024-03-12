-- 1.Вывести данные о товарах (проекция: названиетовара, цена, названиекатегории, название компании поставщика)

SELECT ProductName, Price, CategoryName, SupplierName
FROM Products
JOIN Categories ON Products.CategoryID = Categories.CategoryID
JOIN Suppliers ON Products.SupplierID = Suppliers.SupplierID;

-- 2. Вывести заказы клиентов не из France  (номерзаказа, имяклиента, страна_клиента)

SELECT OrderID, CustomerName, Country
FROM Orders
JOIN Customers ON Orders.CustomerID = Customers.CustomerID
WHERE
NOT Customers.Country = 'France'

-- 3. Вывести название и стоимость в USD одного самого дорогого проданного товара

SELECT ProductName, MAX(Price) AS MaxPrice
FROM Products;

-- 4. Вывести список стран, которые поставляют морепродукты

SELECT DISTINCT Country
FROM Suppliers
WHERE ProductType = 'Seafood';

-- 5. Вывести два самых дорогих товара из категории Beverages из USA
SELECT ProductName, Price
FROM Products
WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Beverages')
AND SupplierID IN (SELECT SupplierID FROM Suppliers WHERE Country = 'USA')
ORDER BY Price DESC
LIMIT 2;



