# SQL Skills Demonstrated

This document maps the repository's queries to the analytical SQL techniques demonstrated in the portfolio.

| Skill | Where it appears | Purpose |
| --- | --- | --- |
| Schema discovery | `01_exploracion.sql` | Inspect tables, columns, foreign keys, row counts, and date coverage. |
| Data-quality checks | `02_calidad_datos.sql` | Identify nulls, duplicates, broken relationships, invalid numerical values, and inconsistent dates. |
| KPI calculations | `03_metricas_principales.sql` | Calculate net sales, gross sales, discounts, and sales per order. |
| Common table expressions | `04_analisis_ventas.sql`, `06_analisis_clientes.sql`, `10_analisis_avanzado.sql` | Make multi-step analytical logic readable and reusable. |
| Multi-table joins | Most analytical scripts | Connect orders, order details, products, customers, categories, and employees at the appropriate grain. |
| Time intelligence | `04_analisis_ventas.sql` | Analyze monthly and yearly sales using `strftime()` and prior-period comparisons. |
| Window functions | `04_analisis_ventas.sql`, `06_analisis_clientes.sql`, `10_analisis_avanzado.sql` | Compare periods, calculate cumulative values, rank records, and compute moving averages. |
| Customer segmentation | `06_analisis_clientes.sql` | Classify customers by days since their most recent order. |
| Pareto analysis | `06_analisis_clientes.sql` | Identify customers that make up the first 80% of cumulative revenue. |
| Ranking within groups | `10_analisis_avanzado.sql` | Find top products within category and top customers within country. |
| Conditional logic | `02_calidad_datos.sql`, `06_analisis_clientes.sql`, `09_descuentos.sql` | Apply business rules with `CASE`. |

## Query Design Principles Used

- **Explicit analytical grain:** sales calculations begin at the `Order Details` line level and join to `Orders` only when customer, employee, or date context is required.
- **Historical transaction values:** sales use `UnitPrice`, `Quantity`, and `Discount` from the order detail rather than a current catalog price.
- **Readable intermediate logic:** CTEs label intermediate datasets such as sales by month, sales by customer, or order-level revenue before the final calculation.
- **Defensive validation:** data-quality scripts use `LEFT JOIN` and `IS NULL` checks to surface possible orphan records.

## Portfolio Interpretation

The repository is intended to show SQL reasoning, not only query syntax: questions are organized by business topic, calculations are named through comments and aliases, and advanced techniques are used where they solve an analytical need.
