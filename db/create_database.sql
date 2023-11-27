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
    price INT
);

CREATE TABLE cs_product_media (
    product_id INT,
    seqnum INT,
    media_id INT,
    PRIMARY KEY (product_id, seqnum, media_id)
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

CREATE TABLE admin_users (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);


ALTER TABLE cs_product_media
ADD FOREIGN KEY (media_id) REFERENCES media(id);

ALTER TABLE cs_product_media
ADD FOREIGN KEY (product_id) REFERENCES cs_product(id);

ALTER TABLE cs_category_prd
ADD FOREIGN KEY (category_id) REFERENCES cs_category(id);

ALTER TABLE cs_category_prd
ADD FOREIGN KEY (product_id) REFERENCES cs_product(id);

ALTER TABLE cs_prod_attribute
ADD FOREIGN KEY (product_id) REFERENCES cs_product(id);

ALTER TABLE cs_prod_attribute
ADD FOREIGN KEY (attribute_id) REFERENCES cs_attribute(id);