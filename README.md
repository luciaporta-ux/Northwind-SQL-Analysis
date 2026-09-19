# Northwind SQL Analysis

Proyecto personal de análisis de datos realizado con **SQL y SQLite** usando la base de práctica Northwind.

El objetivo fue practicar consultas SQL sobre un modelo con clientes, pedidos, productos, categorías y empleados. Organicé las consultas por tema para poder explorar la base paso a paso y responder preguntas sobre ventas, clientes y productos.

## Herramientas

- SQL
- SQLite
- DB Browser for SQLite

## Qué se analiza

- Estructura y exploración de la base
- Calidad básica de los datos
- Métricas de ventas y pedidos
- Evolución de ventas en el tiempo
- Productos y categorías
- Clientes y análisis Pareto
- Ventas por país
- Desempeño de empleados
- Descuentos
- Rankings y promedio móvil

## Consultas incluidas

| Archivo | Tema |
| --- | --- |
| `01_exploracion.sql` | Tablas, columnas, cantidad de registros y fechas disponibles |
| `02_calidad_datos.sql` | Nulos, duplicados y controles básicos |
| `03_metricas_principales.sql` | Pedidos, ventas, descuentos y ticket promedio |
| `04_analisis_ventas.sql` | Ventas por período y comparaciones intermensuales e interanuales |
| `05_productos_y_categorias.sql` | Productos, categorías, precios y unidades vendidas |
| `06_analisis_clientes.sql` | Clientes, recencia y análisis Pareto |
| `07_analisis_geografico.sql` | Ventas y pedidos por país |
| `08_analisis_empleados.sql` | Pedidos y ventas por empleado |
| `09_analisis_descuentos.sql` | Uso e impacto de descuentos |
| `10_analisis_avanzado.sql` | Rankings por grupo y promedio móvil |

## Cómo usarlo

1. Descargá el repositorio como ZIP o clonalo.
2. Abrí **DB Browser for SQLite**.
3. Elegí **Open Database** y seleccioná `data/northwind.db`.
4. Abrí la pestaña **Execute SQL**.
5. Copiá y ejecutá las consultas desde la carpeta `sql/`.

Recomiendo empezar por `01_exploracion.sql` y seguir el orden numérico.

> Las consultas son de solo lectura: no modifican la base de datos.

## SQL que practiqué

- `SELECT`, `WHERE`, `GROUP BY`, `HAVING` y `ORDER BY`
- `DISTINCT`, `LIMIT` y `COUNT(DISTINCT ...)`
- `JOIN` y `LEFT JOIN` entre varias tablas
- Subconsultas y `CTEs`
- Agregaciones: `SUM`, `AVG`, `COUNT`, `MIN` y `MAX`
- `CASE` para clasificar datos
- Funciones de ventana: `LAG`, `DENSE_RANK`, `ROW_NUMBER`, `SUM() OVER()` y `AVG() OVER()`
- `PARTITION BY` y marcos de ventana con `ROWS BETWEEN`
- Rankings, acumulados, análisis `Pareto` y promedio móvil
- Cálculos de ventas con precio, cantidad y descuento
- Cálculo de porcentajes y manejo de división por cero con `NULLIF()`
- Análisis temporal con `strftime()` y `julianday()`
- Validación de calidad de datos: nulos, duplicados, valores inválidos y registros sin relación
- Exploración de estructura en SQLite con `PRAGMA`

## Sobre los datos

Northwind es una base de ejemplo utilizada con fines educativos. Los resultados no representan una empresa real ni deben interpretarse como información comercial real.

---

**Lucía Porta**
[GitHub](https://github.com/luciaporta-ux)
