--Producto + vendido dentro de cada categorias

With Datos as (Select CategoryName, ProductName, sum(Quantity) as Cantidad from "Order Details" od
join Products p on od.ProductID = p.ProductID
join Categories c on p.CategoryID = c.CategoryID
group by CategoryName,ProductName), Ranking_productos as (
Select CategoryName, ProductName, Cantidad, Dense_Rank() over (Partition By CategoryName Order by Cantidad DESC) as Puntuacion
from Datos)
Select * from Ranking_productos where Puntuacion = 1;

--Cliente con + Ingreso de cada pais


With Paises_Clientes as (Select c.CustomerID,c.Country,c.ContactName,SUM(od.UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od
join Orders o on od.OrderID= o.OrderID
join Customers c on c.CustomerID = o.CustomerID
group by c.Country,c.ContactName,c.CustomerID), Ranking_clientes as (Select CustomerID,Country,ContactName,Monto, Row_number() over (Partition by Country order by Monto DESC) as Puntuacion from Paises_Clientes)
Select * from Ranking_clientes where Puntuacion = 1;

-- % del Revenue por Cliente

With Montos as (Select o.CustomerID,SUM(od.UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od
join Orders o on od.OrderID = o.OrderID
join Customers c on o.CustomerID = c.CustomerID
group by c.CustomerID)
Select CustomerID, Monto, Monto*100/Sum(Monto) over() as Porcentaje from Montos;

--Ranking Productos

With Productos_montos as (Select ProductName, SUM(od.UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od
join Products p on od.ProductID = p.ProductID
group by ProductName)
Select ProductName,Monto,Row_number() over(Order by Monto DESC) as Ranking from Productos_montos;

--Evolucion Ventas por Categoria a lo largo del tiempo

With Montos_Categorias as (Select strftime('%Y-%m',OrderDate) as Mes_año, c.CategoryName, SUM(od.UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od
join Products p on od.ProductID = p.ProductID
join Categories c on p.CategoryID = c.CategoryID
join Orders o on o.OrderID = od.OrderID
group by Mes_año, c.CategoryName)
Select Mes_año,CategoryName,Monto from Montos_Categorias order by CategoryName,Mes_año;

--Promedio Movil de 3 meses

With Ingresos as (Select strftime('%Y-%m',OrderDate) as "Mes_Año", SUM(UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od
join orders o on od.OrderID = o.OrderID
group by strftime('%Y-%m',OrderDate) )
Select Mes_Año,Monto, AVG(Monto) over (Order by Mes_Año rows between 2 preceding and current row) as Promedio_Movil_3_Meses
from Ingresos;
