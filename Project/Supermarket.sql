-- Create table --
CREATE TABLE transactions(
  transaction_id INT PRIMARY KEY,
  transaction_date DATETIME,
  staff_id INT,
  menu_id TEXT,
  quantity INT,
  total_price REAL
);

CREATE TABLE staff(
  staff_id INT PRIMARY KEY,
  staff_name TEXT,
  staff_position TEXT
);

CREATE TABLE menus(
  menu_id TEXT PRIMARY KEY,
  menu_name TEXT,
  price REAL,
  category TEXT
);


-- insert data into table --
INSERT INTO menus (menu_id, menu_name, price, category)
  VALUES 
  ('D01', 'Americano', 1.0, 'Drink'),
  ('D02', 'Latte', 1.5, 'Drink'),
  ('D03', 'Cappuccino', 2.0, 'Drink'),
  ('D04', 'Cold Brew', 3.0, 'Drink'),
  ('D05', 'Mocha', 2.5, 'Drink'),
  ('D06', 'Espresso', 1.5, 'Drink'),
  ('C01', 'Red Velvet', 3.0, 'Dessert'),
  ('C02', 'Coconut cake', 3.5, 'Dessert'),
  ('C03', 'Chocolate cake', 3.5, 'Dessert'),
  ('C04', 'Crossiant', 2.0, 'Dessert');

INSERT INTO staff (staff_id, staff_name, staff_position)
  VALUES
  (1, 'James', 'Manager'),
  (2, 'Jane', 'Cashier'),
  (3, 'Jack', 'Waiter'),
  (4, 'Joy', 'Waiter');

INSERT INTO transactions (transaction_id, transaction_date, staff_id, menu_id, quantity, total_price)
  VALUES
  (10001, '2022-06-01 10:00:59', 3, 'D01', 1, 1.0),
  (10002, '2022-06-01 10:00:59', 3, 'C01', 1, 3.0),
  (10003, '2022-06-01 11:30:00', 1, 'D04', 2, 6.0),
  (10004, '2022-06-01 11:30:00', 1, 'C02', 1, 3.5),
  (10005, '2022-06-01 11:30:00', 1, 'C03', 1, 3.5),
  (10006, '2022-06-01 12:00:00', 2, 'D05', 1, 2.5),
  (10007, '2022-06-01 13:00:00', 4, 'D03', 1, 2.0),
  (10008, '2022-06-01 13:00:00', 4, 'C04', 2, 4.0),
  (10009, '2022-06-01 14:00:00', 1, 'D01', 1, 1.0),
  (10010, '2022-06-01 16:05:55', 3, 'D02', 2, 3.0);


-- make output be table --
.mode table
.head on

SELECT * FROM transactions;
SELECT * FROM staff;
SELECT * FROM menus;

/* Write SQL query at least 3 queries
- with clause
- subquery
-aggregate function & group by */

-- 1. Find 3 staff who did highest amount sale --
SELECT 
  sta.staff_name AS top_3,
  sta.staff_position AS position,
  SUM(tran.total_price) AS total_sale
FROM transactions AS tran
JOIN staff AS sta ON tran.staff_id = sta.staff_id
GROUP BY sta.staff_name
ORDER BY Total_sale DESC
LIMIT 3;

-- 2. Find the top 3 most popular menu --
SELECT 
  M.menu_name AS top_3,
  SUM(tran.quantity) AS total_quantity,
  SUM(tran.total_price) AS total_sale
FROM menus AS M
JOIN transactions AS tran
ON M.menu_id = tran.menu_id
GROUP BY M.menu_name
ORDER BY total_sale DESC
LIMIT 3;

-- 3.find the highest price of menu
SELECT * FROM menus 
WHERE price = (SELECT MAX(price) FROM menus);
