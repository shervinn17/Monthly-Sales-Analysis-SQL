# Monthly Sales Analysis Using SQL

This project provides a series of SQL scripts to analyze monthly sales performance based on a dataset containing order-level sales data.

## 📄 SQL Script: `Monthly-Sales-Analysis-SQL.sql`

This file contains SQL queries that can be executed in **MySQL (version < 8.0 compatible)** to perform various monthly sales analyses.

### 📊 Included Analyses:

1. **Monthly Revenue and Order Volume**
   - Calculates total revenue and distinct order count per month.

2. **Monthly Revenue, Order Volume, and Average Order Value**
   - Adds Average Order Value (AOV) as `Revenue / Order Count`.

3. **Monthly Revenue Growth**
   - Compares monthly revenue with the previous month to compute growth (%).
   - Implemented using a self-join for compatibility with MySQL < 8.

4. **Filtered View by Year**
   - Extracts monthly metrics for a specific year (e.g., 2019).

5. **Top 5 Months by Revenue**
   - Identifies the highest revenue-generating months across all data.

### ⚙️ Requirements

- MySQL Workbench (any version, including pre-8.0).
- A table named `sales_table` with the following fields:
  - `Order ID`
  - `Order Date`
  - `Sales`

### 🧪 Usage

1. Import or load your dataset into a MySQL database.
2. Make sure your table is named `sales_table` and column names match.
3. Open and run the SQL queries in MySQL Workbench.
4. Optionally adjust date filtering or sorting based on your needs.

---

### 📂 Files

- `Monthly-Sales-Analysis-SQL.sql` — SQL script with all queries.
- `Year & Month Data` - Output File
- `README.md` — This file.
