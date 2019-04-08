Node.js & MySQL

Overview

In this activity, you'll be creating an Amazon-like storefront with the MySQL skills you learned this unit. The app will take in orders from customers and deplete stock from the store's inventory. As a bonus task, you can program your app to track product sales across your store's departments and then provide a summary of the highest-grossing departments in the store.

Make sure you save and require the MySQL and Inquirer npm packages in your homework files--your app will need them for data input and storage.


mysql> SELECT department_id, departments.department_name, over_head_costs, SUM(product_sales) AS product_sales,
    ->         SUM(product_sales) - over_head_costs AS total_profit
    ->         FROM departments
    ->         INNER JOIN products
    ->         ON departments.department_name = products.department_name
    ->         GROUP BY department_id;
+---------------+-----------------+-----------------+---------------+--------------+
| department_id | department_name | over_head_costs | product_sales | total_profit |
+---------------+-----------------+-----------------+---------------+--------------+
|             1 | Cosmetics       |         2300.00 |       1100.00 |     -1200.00 |
|             2 | Kitchen         |         4000.00 |       2000.00 |     -2000.00 |
|             3 | Baby            |        10000.00 |       5000.00 |     -5000.00 |
|             4 | Pharmacy        |         5000.00 |       1000.00 |     -4000.00 |
|             5 | Food            |         1000.00 |      17680.00 |     16680.00 |
|             6 | Smoke           |         1000.00 |       8000.00 |      7000.00 |
+---------------+-----------------+-----------------+---------------+--------------+
6 rows in set (0.01 sec)

mysql> 