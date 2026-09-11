--10 productos con mayor Ingreso

Select p.ProductName, SUM(od.UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od
join Products p on od.ProductID = p.ProductID
group by p.ProductName,p.ProductID
Order by Monto DESC
LIMIT 10;


--10 productos con unidades + vendidas

Select p.ProductName, SUM(Quantity) as "Cantidad" from "Order Details" od
join Products p on od.ProductID = p.ProductID
group by p.ProductName,p.ProductID
Order by Cantidad DESC
LIMIT 10;

--5 categorias con mayor Ingreso
Select c.CategoryName, SUM(od.UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od
join Products p on od.ProductID = p.ProductID
join Categories c on p.CategoryID = c.CategoryID
group by c.CategoryName,c.CategoryID
Order by Monto DESC
LIMIT 5;

--% del Ingreso que representa cada Categoria

With Montos_Categorias as (Select c.CategoryName, SUM(od.UnitPrice*Quantity*(1-Discount)) as "Monto" from "Order Details" od
join Products p on od.ProductID = p.ProductID
join Categories c on p.CategoryID = c.CategoryID
group by c.CategoryName)
Select CategoryName, Monto, Monto/Sum(Monto) OVER () * 100 as Porcentaje from Montos_Categorias;

--Precio Promedio de Productos de c/Categoria

Select CategoryName, AVG(UnitPrice) as Promedio from
Products p
join Categories c on p.CategoryID = c.CategoryID
group by CategoryName;
