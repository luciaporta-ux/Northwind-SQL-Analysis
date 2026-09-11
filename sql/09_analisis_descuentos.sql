--Descuento Promedio

Select AVG(Discount) from "Order Details";

--Importe Descontado Total

Select SUM(UnitPrice*Quantity*Discount) as "Descuento total"
from "Order Details";

--Tramos de descuentos

Select Discount, CASE
WHEN Discount >= 0.25 then 'Descuento Alto'
WHEN Discount >= 0.15 then 'Descuento Intermedio'
WHEN Discount > 0 then 'Descuento Minimo'
else 'Sin Descuento' end as "Tipo de Descuento"
from "Order Details";
