# Open the Project with DB Browser for SQLite

## Why the Database File Is Included

The repository includes `../data/northwind.db`, so the project can be opened directly in **DB Browser for SQLite**. This is more portable than committing a `.sqbpro` project file because `.sqbpro` files commonly save machine-specific absolute paths and local window settings.

## Setup

1. Download or clone this repository.
2. Open **DB Browser for SQLite**.
3. Select **Open Database**.
4. Navigate to the repository folder and choose `data/northwind.db`.
5. Use the **Database Structure** tab to inspect tables and views.
6. Select **Execute SQL**.
7. Open a script from `sql/` in an editor, copy the desired query into DB Browser, and run it.

## Recommended Script Order

1. `01_exploracion.sql` — understand the schema, tables, row counts, and date range.
2. `02_calidad_datos.sql` — review data-quality checks.
3. `03_metricas_principales.sql` — calculate core KPIs.
4. `04_analisis_ventas.sql` through `10_analisis_avanzado.sql` — explore business areas and advanced SQL techniques.

## DB Browser Tips

- Execute one statement or one logical block at a time to inspect results clearly.
- Keep the database read-only while analyzing it; the repository scripts are designed for analysis only.
- Use **File → Export** only when you need to save a result set for a visualization or external tool.
- If you make personal query tabs or custom layouts, save a separate local `.sqbpro` file. Do not commit it unless you remove absolute paths and confirm it adds useful, portable value.
