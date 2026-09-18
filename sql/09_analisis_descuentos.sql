--Descuento Promedio

Select AVG(Discount) from "Order Details";

--Tramos de descuentos

WITH detalle_descuentos AS (SELECT OrderID,CASE
WHEN Discount >= 0.25 THEN 'Descuento alto'
WHEN Discount >= 0.15 THEN 'Descuento intermedio'
WHEN Discount > 0 THEN 'Descuento mínimo'
ELSE 'Sin descuento'
END AS tramo_descuento,
UnitPrice * Quantity AS ingreso_bruto,
UnitPrice * Quantity * Discount AS importe_descuento,
UnitPrice * Quantity * (1 - Discount) AS ingreso_neto
FROM "Order Details")
SELECT tramo_descuento, 
COUNT(*) AS lineas_de_pedido,
COUNT(DISTINCT OrderID) AS pedidos_con_ese_tramo,
ROUND(SUM(ingreso_bruto), 2) AS ingreso_bruto,
ROUND(SUM(importe_descuento), 2) AS descuento_total,
ROUND(SUM(ingreso_neto), 2) AS ingreso_neto,
ROUND(SUM(importe_descuento) * 100.0 / NULLIF(SUM(ingreso_bruto), 0),2) AS porcentaje_descuento_efectivo
FROM detalle_descuentos
GROUP BY tramo_descuento
Order by tramo_descuento DESC
