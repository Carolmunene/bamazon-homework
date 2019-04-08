DROP DATABASE IF EXISTS bamazon_db;
CREATE DATABASE bamazon_db;

USE bamazon_db;
 /* id (unique id for each product)

   * product_name (Name of product)

   * department_name

   * price (cost to customer)

   * stock_quantity (how much of the product is available in stores)
   */
CREATE TABLE products (
    product_id INT(11) AUTO_INCREMENT NOT NULL, 
    product_name VARCHAR(255) NOT NULL,
    department_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT(11) NOT NULL,
    product_sales DECIMAL(10,2) DEFAULT 0,
    PRIMARY KEY(product_id)
);

CREATE TABLE departments (
  department_id INT AUTO_INCREMENT NOT NULL,
  department_name VARCHAR(100) NULL,
  over_head_costs DECIMAL(10,2) NULL,
  PRIMARY KEY (department_id)
);

INSERT INTO departments (department_name, over_head_costs)
VALUES ('Cosmetics', 2300), ('Kitchen', 4000), ('Baby', 10000), ('Pharmacy', 5000), ('Food', 1000), ("Smoke", 1000), 
       ('Clothes', 1300);
    
INSERT INTO products (product_name, department_name, price, stock_quantity, product_sales)
VALUES  ('Bar soap','household', 1.50, 500, 1200),
        ('Shampoo','Cosmetics', 6.50, 600, 1100),
        ('Cup','Kitchen', 1.25, 1000, 2000),
        ('Diapers','Baby', 10.25, 1000, 5000),
        ('Cough Syrup','Pharmacy', 8.25, 400, 1000),
        ('Tropicana Orange Juice','Food', 3.29, 700, 2500),
        ('Cigarrettes','Smoke', 11.25, 1000, 8000),
        ('Yogurt','Food', 1.25, 700, 1100),
        ('Milk','Food', 3.50, 600, 1480),
        ('Cookies','Food', 2.50, 500, 12600);
        -- ('Jacket','Clothes', 19.99, 700, 6000);

        
        SELECT department_id, departments.department_name, over_head_costs, SUM(product_sales) AS product_sales,
        SUM(product_sales) - over_head_costs AS total_profit
        FROM departments
        INNER JOIN products
        ON departments.department_name = products.department_name
        GROUP BY department_id;
/*mysql> SELECT department_id, departments.department_name, over_head_costs, SUM(product_sales) AS product_sales,
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
*/

