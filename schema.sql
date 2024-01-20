-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE, CREATE INDEX, CREATE VIEW, etc. statements that compose it
CREATE DATABASE IF NOT EXISTS supermarket;

USE supermarket;

CREATE TABLE IF NOT EXISTS aisles(
id INT(11),
aisle VARCHAR(100) NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS departments(
id INT(11),
department VARCHAR(30) NOT NULL,
PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS product(
id INT(11),
name VARCHAR(200) NOT NULL,
aisle_id INT(11) NOT NULL,
department_id INT(11) NOT NULL,

PRIMARY KEY(id),

FOREIGN KEY(aisle_id)
	REFERENCES aisles(id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
    
FOREIGN KEY(department_id)
	REFERENCES departments(id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS orders(
id INT(11),
user_id INT(11) NOT NULL,
eval_set VARCHAR(10) NOT NULL,
order_number INT(11) NOT NULL,
order_dow INT(11),
order_hour_of_day INT(11),
days_since_prior_order INT(11),
PRIMARY KEY(id)
);

CREATE TABLE IF NOT EXISTS order_product(
order_id INT(11) NOT NULL,
product_id INT(11) NOT NULL,
add_to_cart_order INT(11) NOT NULL,
reordered INT(11) NOT NULL,

FOREIGN KEY(order_id)
	REFERENCES orders(id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE,
    
FOREIGN KEY(product_id)
	REFERENCES product(id)
    ON DELETE NO ACTION
    ON UPDATE CASCADE
);

###########################  DML ############################

## Importing the Data

LOAD DATA LOCAL INFILE '/aisles.csv' INTO TABLE aisles
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/departments.csv' INTO TABLE departments
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;


LOAD DATA LOCAL INFILE '/orders_small_version.csv' INTO TABLE orders
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/products.csv' INTO TABLE product
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;

LOAD DATA LOCAL INFILE '/order_products.csv' INTO TABLE order_product
FIELDS TERMINATED BY ',' LINES TERMINATED BY '\n' IGNORE 1 LINES;
