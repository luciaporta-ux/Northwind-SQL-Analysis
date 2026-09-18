--Cant pedidos por empleado

Select e.EmployeeID, FirstName, count(o.OrderID) as Cantidad from Employees e 
left join Orders o on e.EmployeeID = o.EmployeeID
group by e.EmployeeID,FirstName;

--Ingresos por empleado

Select e.EmployeeID,FirstName,SUM(od.UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od
join Orders o on od.OrderID = o.OrderID
join Employees e on e.EmployeeID = o.EmployeeID
group by e.EmployeeID,FirstName;

--Ingreso Promedio por Empleado

WITH montos_pedidos AS (SELECT o.EmployeeID,o.OrderID,SUM(od.UnitPrice * od.Quantity * (1 - od.Discount)) AS monto_pedido
FROM Orders AS o JOIN "Order Details" AS od ON od.OrderID = o.OrderID GROUP BY o.EmployeeID,o.OrderID)
SELECT e.EmployeeID,e.FirstName,e.LastName,AVG(mp.monto_pedido) AS ticket_promedio FROM Employees AS e
JOIN montos_pedidos AS mp ON mp.EmployeeID = e.EmployeeID
GROUP BY e.EmployeeID,e.FirstName,e.LastName;
