--Ingreso por pedido

Select OrderID,
SUM(UnitPrice*Quantity*(1-Discount)) as "Ingreso"
from "Order Details"
group by OrderID;

--Ingreso total neto
Select SUM(UnitPrice*Quantity*(1-Discount)) as "Ingreso Total Neto"
from "Order Details";

--Ingreso Bruto

Select SUM(UnitPrice*Quantity) as "Ingreso Total Bruto"
from "Order Details";

--Descuento total
SELECT
    SUM(UnitPrice * Quantity * Discount) AS descuento_total
FROM "Order Details";
