--10 Clientes + Ingreso

Select c.CustomerID,CompanyName,SUM(od.UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od
join Orders o on od.OrderID = o.OrderID
join Customers c on o.CustomerID = c.CustomerID
group by c.CustomerID,CompanyName
Order by Monto DESC
LIMIT 10;

--10 Clientes con + pedidos

Select c.CustomerID,CompanyName, Count(o.OrderID) as "Cantidad" from Customers c
join Orders o on o.CustomerID = c.CustomerID
group by c.CustomerID,CompanyName
Order by Cantidad DESC
LIMIT 10;


--Valor promedio de pedido de c/cliente

With Montos as (Select o.CustomerID,o.OrderID, SUM(od.UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od
join Orders o on od.OrderID = o.OrderID
join Customers c on o.CustomerID = c.CustomerID
group by c.CustomerID,o.OrderID)

Select CustomerID,AVG (Monto) from Montos group by CustomerID ;

--Clasificacion de clientes segun días de ultima compra

With clientes_fecha as (Select CustomerID, max(OrderDate) as ultima_fecha from Orders
group by CustomerID), dias_ultima_compra as (Select CustomerID,ultima_fecha,
julianday((Select max(OrderDate) from Orders))- julianday(ultima_fecha) as dias from clientes_fecha)
Select CustomerID,ultima_fecha,dias,
CASE
WHEN dias >= 100 then 'Inactivo'
when dias >= 40 then 'En seguimiento'
else 'Activo' end as "Recencia clientes"
from dias_ultima_compra;

--Clientes que generan el 80% Ventas

With Ingresos_clientes as (Select c.CustomerID,CompanyName,SUM(od.UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od
join Orders o on od.OrderID = o.OrderID
join Customers c on o.CustomerID = c.CustomerID
group by c.CustomerID,CompanyName), Acumulados as
(Select CustomerID,CompanyName,Monto,
Monto/SUM(Monto) OVER()* 100 AS Porcentaje_Individual,
Sum(Monto) Over(Order by Monto DESC Rows between unbounded preceding and current row) as Acumulado,
SUM(Monto) OVER (ORDER BY Monto DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)/
SUM(Monto) OVER()* 100 AS Porcentaje_Acumulado
from Ingresos_clientes)
Select CustomerID,CompanyName,Monto,Acumulado,Porcentaje_Acumulado from Acumulados
where Porcentaje_Acumulado - Porcentaje_Individual < 80;
