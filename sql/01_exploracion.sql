--Tablas disponibles

Select name from sqlite_master
WHERE type = 'table'
ORDER BY name;
PRAGMA table_info(Customers);
PRAGMA table_info(Orders);
PRAGMA table_info("Order Details");
PRAGMA table_info(Products);
PRAGMA table_info(Categories);

--Cantidad de filas en tablas principales

SELECT COUNT(*) AS total_customers FROM Customers;
SELECT COUNT(*) AS total_orders FROM Orders;
SELECT COUNT(*) AS total_order_details FROM "Order Details";
SELECT COUNT(*) AS total_products FROM Products;
SELECT COUNT(*) AS total_categories FROM Categories;

--Claves foraneas de tablas principales

PRAGMA foreign_key_list(Customers);
PRAGMA foreign_key_list(Orders);
PRAGMA foreign_key_list("Order Details");
PRAGMA foreign_key_list(Products);
PRAGMA foreign_key_list(Categories);

--Primeras 10 filas tablas principales

SELECT * from Customers LIMIT 10;
SELECT * from Orders LIMIT 10;
SELECT * from "Order Details" LIMIT 10;
SELECT * from Products LIMIT 10;

--Periodo abarcado de la base de datos

SELECT
    MIN(OrderDate) AS primera_fecha,
    MAX(OrderDate) AS ultima_fecha
FROM Orders;
