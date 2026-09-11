# Data Notes

## Included Database

`northwind.db` is a SQLite database included to make this portfolio project directly reproducible in DB Browser for SQLite or another SQLite-compatible client.

## Verified Technical Properties

- File type: SQLite 3.x database
- File size: 24.7 MB
- `PRAGMA integrity_check`: `ok`
- `PRAGMA foreign_key_check`: no violations returned
- Business tables: 13
- Views: 18
- Customers: 93
- Orders: 16,282
- Order details: 609,283
- Products: 77
- Employees: 9

## Usage

Open the file directly from DB Browser for SQLite:

```text
File → Open Database → data/northwind.db
```

Then run the scripts in the repository's `sql/` folder.

## Provenance and Responsible Use

This is a Northwind-based practice dataset used exclusively for educational and portfolio purposes. It does not represent a real company's confidential or operational data.

The SQL scripts and repository documentation are covered by the repository's MIT License. The database itself may be subject to separate source terms; do not redistribute it outside this educational project without confirming those terms.
