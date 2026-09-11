
--Cantidad de pedidos

Select Count(*) as Cantidad_Pedidos from Orders;

--Cantidad de clientes que realizaron al menos 1 pedido

Select count(Distinct CustomerID) from Orders;

--Valor Promedio de pedidos

Select AVG(Ingreso) as Valor_Promedio from (Select OrderID,
SUM(UnitPrice*Quantity*(1-Discount)) as "Ingreso"
from "Order Details"
group by OrderID);

--Evolución del Revenue por año

With Ingresos as (Select strftime('%Y',OrderDate) as "Año", SUM(UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od join orders o on od.OrderID = o.OrderID
group by strftime('%Y',OrderDate) )
Select * from Ingresos;

--Cantidad pedidos por mes

Select Count(OrderID) as Cantidad, strftime('%Y-%m',OrderDate) as mes from
Orders
group by strftime('%Y-%m',OrderDate);

--Comparacion intermensual de ingresos

With Ingresos as (Select strftime('%Y-%m',OrderDate) as "Mes_Año", SUM(UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od
join orders o on od.OrderID = o.OrderID
group by strftime('%Y-%m',OrderDate) )
Select Mes_Año,Monto, LAG(Monto) OVER(Order by Mes_Año) as Monto_anterior, Monto -  LAG(Monto) OVER(Order by Mes_Año) as Diferencia,
(Monto-Lag(Monto) over(Order by Mes_Año))/Lag(Monto) over(Order by Mes_Año) * 100 as Diferencia_porcentual
from Ingresos;

--Comparacion interanual de ingresos
With ingresos as (Select strftime('%Y',OrderDate) as "Año", SUM(UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od
join orders o on od.OrderID = o.OrderID
group by strftime('%Y',OrderDate))
Select Año,Monto,Lag(Monto) over(Order by Año) as Monto_año_anterior, Monto-Lag(Monto) over(Order by Año) as Diferencia,
(Monto-Lag(Monto) over(Order by Año))/Lag(Monto) over(Order by Año) * 100 as Diferencia_porcentual from ingresos;
