CREATE DATABASE coursework_dig5127;

USE coursework_dig5127;

CREATE TABLE cs_category (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
description TEXT
);

CREATE TABLE cs_product (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
description TEXT,
media INT,
price_info INT
);

CREATE TABLE cs_category_prd (
category_id INT,
seqnum INT,
product_id INT,
PRIMARY KEY (category_id, seqnum, product_id)
);

CREATE TABLE cs_attribute (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
description TEXT,
value TEXT
);

CREATE TABLE cs_prod_attribute (
product_id INT,
seqnum INT,
attribute_id INT,
PRIMARY KEY (product_id, seqnum, attribute_id)
);

CREATE TABLE media (
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(50),
type INT,
path VARCHAR(255)
);

CREATE TABLE price_info (
id INT PRIMARY KEY AUTO_INCREMENT,
ref VARCHAR(255),
price DECIMAL(9, 2),
tax DECIMAL(9, 2)
);

ALTER TABLE cs_product
ADD FOREIGN KEY (media) REFERENCES media(id);

ALTER TABLE cs_product
ADD FOREIGN KEY (price_info) REFERENCES price_info(id);

ALTER TABLE cs_category_prd
ADD FOREIGN KEY (category_id) REFERENCES cs_category(id);

ALTER TABLE cs_category_prd
ADD FOREIGN KEY (product_id) REFERENCES cs_product(id);

ALTER TABLE cs_prod_attribute
ADD FOREIGN KEY (product_id) REFERENCES cs_product(id);

ALTER TABLE cs_prod_attribute
ADD FOREIGN KEY (attribute_id) REFERENCES cs_attribute(id);
