# Northwind SQL Analysis | SQLite

![SQLite](https://img.shields.io/badge/SQLite-Relational%20Database-003B57?logo=sqlite&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Data%20Analysis-4479A1)
![DB Browser](https://img.shields.io/badge/DB%20Browser%20for%20SQLite-Compatible-4A90E2)
![Status](https://img.shields.io/badge/Status-Completed-2E7D32)

An end-to-end **SQL analytics portfolio project** built with SQLite and the Northwind sample dataset. The project analyzes sales, products, customers, geography, employees, and discounts through a structured collection of SQL scripts.

It was designed to demonstrate practical, intermediate SQL skills: relational exploration, data-quality checks, multi-table joins, common table expressions (CTEs), aggregations, window functions, ranking, segmentation, and time-series analysis.

## Project Overview

The Northwind dataset represents a wholesale business that manages customers, orders, order details, products, suppliers, employees, shippers, and territories. This project turns that relational database into a set of reproducible business analyses.

### Business Questions

- What is the overall sales performance and average order value?
- How do sales and order volumes evolve over time?
- Which products and categories contribute the most sales and units?
- Which customers generate the most value, and which accounts are inactive?
- How does performance vary by country and employee?
- How are discounts distributed across transactions?
- Which product leads each category, and which customer leads each country?

## Dataset and Database Validation

The repository includes a ready-to-open SQLite database at [`data/northwind.db`](data/northwind.db).

| Validation item | Verified result |
| --- | --- |
| Database format | SQLite 3.x |
| File size | 24.7 MB |
| Integrity check | `ok` |
| Foreign-key check | No violations returned |
| Business tables | 13 |
| Analytical views | 18 |
| Customers | 93 |
| Orders | 16,282 |
| Order-detail rows | 609,283 |
| Products | 77 |
| Employees | 9 |

> The data is a Northwind-based practice dataset. It is included so the SQL scripts can be explored directly in DB Browser for SQLite. See [`data/README.md`](data/README.md) for use and provenance notes.

## Project Structure

```text
Northwind-SQL-Analysis/
├── data/
│   ├── northwind.db                 # Ready-to-open SQLite database
│   └── README.md                    # Data notes and validation results
├── db-browser/
│   └── README.md                    # DB Browser for SQLite setup guide
├── docs/
│   └── sql-skills-demonstrated.md   # SQL concepts mapped to scripts
├── sql/
│   ├── 01_exploracion.sql
│   ├── 02_calidad_datos.sql
│   ├── 03_metricas_principales.sql
│   ├── 04_analisis_ventas.sql
│   ├── 05_productos_y_categorias.sql
│   ├── 06_analisis_clientes.sql
│   ├── 07_analisis_geografico.sql
│   ├── 08_analisis_empleados.sql
│   ├── 09_analisis_descuentos.sql
│   └── 10_analisis_avanzado.sql
├── LICENSE
└── README.md
```

## How to Open the Project in DB Browser for SQLite

1. Download this repository as a ZIP file or clone it with Git.
2. Install [DB Browser for SQLite](https://sqlitebrowser.org/), if necessary.
3. Open DB Browser and select **Open Database**.
4. Choose [`data/northwind.db`](data/northwind.db).
5. Open the **Execute SQL** tab.
6. Open a script from the [`sql/`](sql) folder in your preferred editor or copy its contents into the SQL editor.
7. Run the statements in order, beginning with `01_exploracion.sql`.

The original local `.sqbpro` file is intentionally not included. It stores a machine-specific DB Browser session and an absolute path, rather than the database itself. Publishing the `.db` file and portable `.sql` scripts makes the project reproducible on any computer.

For a more detailed walkthrough, see [`db-browser/README.md`](db-browser/README.md).

## SQL Analysis Workflow

The scripts are ordered from foundational checks to advanced analysis.

| Script | Focus | SQL skills demonstrated |
| --- | --- | --- |
| `01_exploracion.sql` | Database inventory, schema exploration, row counts, date coverage | `sqlite_master`, `PRAGMA`, `COUNT`, `MIN`, `MAX` |
| `02_calidad_datos.sql` | Null checks, duplicates, orphan records, invalid amounts, date checks | `CASE`, `LEFT JOIN`, `HAVING`, validation queries |
| `03_metricas_principales.sql` | Net sales, gross sales, total discount, sales by order | `SUM`, `GROUP BY`, arithmetic calculations |
| `04_analisis_ventas.sql` | Sales trends and month-over-month / year-over-year comparison | CTEs, `strftime`, `LAG`, window functions |
| `05_productos_y_categorias.sql` | Product, unit, category, and price analysis | Multi-table `JOIN`, percentages, aggregation |
| `06_analisis_clientes.sql` | Customer rankings, order value, recency, Pareto analysis | CTEs, `CASE`, `julianday`, cumulative windows |
| `07_analisis_geografico.sql` | Sales, orders, and customers by country | `JOIN`, grouped KPIs, country comparison |
| `08_analisis_empleados.sql` | Employee orders, sales, and average ticket | `LEFT JOIN`, CTEs, employee-level aggregation |
| `09_analisis_descuentos.sql` | Discount metrics and discount bands | `AVG`, `SUM`, `CASE` |
| `10_analisis_avanzado.sql` | Rankings and rolling calculations | `DENSE_RANK`, `ROW_NUMBER`, moving average |

## Highlights of the Analysis

### Data Quality

The quality script checks for:

- Nulls in critical order and order-detail fields
- Duplicate customer keys
- Orders without a related customer
- Order details without a valid order or product
- Non-positive prices or quantities
- Invalid discount values
- Inconsistent shipping dates
- Products without a category or supplier

### Sales and Time Intelligence

The sales scripts calculate net sales using:

```sql
UnitPrice * Quantity * (1 - Discount)
```

They then use CTEs and `LAG()` to compare current sales with the previous month and previous year.

### Customer Insights

The customer analysis includes:

- Top customers by net sales
- Customers with the most orders
- Average order value by customer
- Recency classification: Active, Follow-up, and Inactive
- Pareto-style cumulative sales analysis to identify the customers responsible for the first 80% of revenue

### Advanced SQL

The final script applies window functions to:

- Find the top-selling product within each category using `DENSE_RANK()`
- Find the top customer in each country using `ROW_NUMBER()`
- Rank products by sales
- Calculate a three-month moving average of monthly sales

## Important Technical Notes

- Table names containing spaces, such as `Order Details`, are quoted with double quotes as required by SQLite.
- Time-based analysis uses `strftime()` because dates are stored in SQLite-compatible text format.
- The project uses the sales transaction price stored in `Order Details` to calculate historical sales.
- The included scripts are read-only analytical queries; they do not insert, update, or delete data.
- The database integrity and foreign-key checks were executed successfully before publication.
- During this repository preparation, the environment blocked automatic execution of every script as a batch. The scripts were preserved as authored and documented according to their SQL structure; users should execute them locally in DB Browser for SQLite before relying on a specific business result.

## Portfolio Skills Demonstrated

- SQLite and DB Browser for SQLite
- Relational database exploration
- Data-quality validation
- Multi-table joins and correct analytical grain
- Aggregations and KPI calculations
- Common table expressions (CTEs)
- Window functions: `LAG`, `DENSE_RANK`, `ROW_NUMBER`, `SUM OVER`, `AVG OVER`
- Time-series analysis
- Customer segmentation and Pareto analysis
- Business-oriented SQL documentation
- Reproducible project organization for GitHub

## License and Data Usage

The SQL scripts and documentation are released under the [MIT License](LICENSE). The database is included as a practice dataset only; it is not presented as proprietary data or as a real company's performance. See [`data/README.md`](data/README.md) before reusing or redistributing the database.

## Author

**Lucía Porta**

GitHub: [@luciaporta-ux](https://github.com/luciaporta-ux)

---

*Portfolio project developed to demonstrate practical SQL and data-analysis skills.*
