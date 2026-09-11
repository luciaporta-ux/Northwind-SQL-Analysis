--Paises con mayor Ingreso

Select Country, SUM(od.UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od
join Orders o on od.OrderID= o.OrderID
join Customers c on c.CustomerID = o.CustomerID
group by Country
Order by Monto DESC
LIMIT 10;

--Valor Promedio de Pedido por Paises

With Montos as (Select Country,o.OrderID, SUM(od.UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od
join Orders o on od.OrderID = o.OrderID
join Customers c on o.CustomerID = c.CustomerID
group by Country,o.OrderID)
Select Country,AVG (Monto) from Montos
group by Country ;

--Clientes en cada Pais

Select Country, Count(CustomerID) as Cant_clientes
from Customers group by Country;
