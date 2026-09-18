--Nulos en tabla Orders

SELECT
    SUM(CASE WHEN OrderID IS NULL THEN 1 ELSE 0 END) AS null_order_id,
    SUM(CASE WHEN CustomerID IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
    SUM(CASE WHEN OrderDate IS NULL THEN 1 ELSE 0 END) AS null_order_date
FROM Orders;

--Nulos en tabla Order Details

SELECT
    SUM(CASE WHEN OrderID IS NULL THEN 1 ELSE 0 END) AS null_order_id,
    SUM(CASE WHEN ProductID IS NULL THEN 1 ELSE 0 END) AS null_product_id,
    SUM(CASE WHEN UnitPrice IS NULL THEN 1 ELSE 0 END) AS null_unit_price,
    SUM(CASE WHEN Quantity IS NULL THEN 1 ELSE 0 END) AS null_quantity,
    SUM(CASE WHEN Discount IS NULL THEN 1 ELSE 0 END) AS null_discount
FROM "Order Details";

--Compruebo si existen claves primarias duplicadas en Clientes

Select CustomerID, Count(*) as Cantidad
from Customers
group by CustomerID
having Count(*) > 1;

--Compruebo que no existan pedidos sin cliente asociado

Select o.CustomerID from Orders o left join Customers c
on o.CustomerID = c.CustomerID
where c.CustomerID IS NULL;

--Compruebo si existen detalles de pedidos sin OrderID
Select os.OrderID from "Order Details" os
left join Orders o
on os.OrderID = o.OrderID
where o.OrderID IS NULL;

--Compruebo si existen productos en Order Details que no estan en Products

Select os.ProductID from "Order Details" os
left join Products p
on os.ProductID= p.ProductID
where p.ProductID IS NULL;

--Compruebo si existen precios o cantidades menores o iguales a 0

Select UnitPrice,Quantity from "Order Details"
where UnitPrice <= 0 or Quantity <= 0;

--Selecciono maximos y minimos precios, cantidades y descuentos

Select min(UnitPrice),max(UnitPrice),min(Quantity),max(Quantity),min(Discount),max(Discount)
from "Order Details";

--Selecciono valores de Categorias y Territorios diferentes

Select distinct CategoryName from Categories;
Select distinct RegionID from Territories;

--Ingresos por linea de pedido

Select  OrderID,ProductID,UnitPrice,Quantity,Discount,
UnitPrice*Quantity*(1-Discount) as "Ingreso"
from "Order Details" ;

--Deteccion de fechas inconsistentes (Envio anterior al Pedido)

Select OrderID, OrderDate, ShippedDate from Orders
where ShippedDate < OrderDate;

--Pedidos enviados despues de la fecha requerida

Select OrderID from Orders where ShippedDate > RequiredDate;

--Descuentos fuera del rango (0-1)

Select OrderID from "Order Details" where Discount < 0 or Discount > 1;

--Paises nulos o vacios

Select Country from Customers where Country is NULL or Country = '';

--Productos sin categoria o proveedor

Select ProductID,ProductName,CategoryID,SupplierID from Products
where CategoryID IS NULL or SupplierID is NULL;
