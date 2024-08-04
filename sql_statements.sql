CREATE TABLE categories1 (
	id SERIAL PRIMARY KEY,
	cat_name TEXT UNIQUE NOT NULL,
	cat_img TEXT NOT NULL,
	cat_desc TEXT,
	cat_slug TEXT NOT NULL
);

INSERT INTO categories1 (cat_name, cat_slug,cat_img)
VALUES ('Furniture','furniture','furn.png'), ('Hand Bags','hand bags','HandBag.png'),('Books','books','Books.png'), ('Tech','tech','Tech.png'),('Sneakers','sneakers','Sneakers.png'),('Travel','travel','Travel.png');

SELECT id, cat_name FROM categories1 WHERE cat_name LIKE '%n%';

CREATE TABLE products (
	id SERIAL PRIMARY KEY,
	prod_name TEXT UNIQUE NOT NULL,
	prod_img TEXT NOT NULL,
	prod_desc TEXT,
	prod_slug TEXT NOT NULL,
	prod_price DOUBLE PRECISION NOT NULL
);

INSERT into products (prod_name, prod_img, prod_slug, prod_price)
VALUES ('HomePod Mini','home-pod-mini.png','homepod-mini',239.00),
('Instax Mini 9', 'instax-mini-9.png','instax-mini-9',99.90),
('Base Camp Duffel M', 'base-camp-duffel.png','base-camp-duffel',159.85)

UPDATE products
SET prod_desc='Selfie mode and selfie mirror, Macro mode'
WHERE id=1;

UPDATE products
SET prod_desc='Table with air purifier, stained veneer/black'
WHERE id=2;

UPDATE products
SET prod_desc='Base camp medium size duffel bag'
WHERE id=3;

CREATE TABLE products_ratings(
	id SERIAL PRIMARY KEY,
	prod_id INTEGER UNIQUE NOT NULL,
	rating DOUBLE PRECISION NOT NULL DEFAULT 0,
	rating_count INTEGER NOT NULL DEFAULT 0,
	FOREIGN KEY (prod_id) REFERENCES products(id)
)

INSERT INTO products_ratings (prod_id) VALUES (1),(2),(3)

UPDATE products_ratings 
SET rating=4.5, rating_count=10
WHERE prod_id=2;

CREATE TABLE products_categories(
	id SERIAL PRIMARY KEY,
	prod_id INTEGER NOT NULL,
	cat_id INTEGER NOT NULL,
	FOREIGN KEY (prod_id) REFERENCES products(id),
	FOREIGN KEY (cat_id) REFERENCES categories1(id),
	UNIQUE(prod_id,cat_id)
)

INSERT INTO products_categories (prod_id,cat_id)
VALUES (1,4),(2,4),(3,6),(3,2)

INSERT INTO products (prod_name, prod_img, prod_desc, prod_slug,prod_price)
VALUES ('Tot e Medium', 'tot-e-medium.jpg', 'Canvas, full grain leather','tot-e-medium',3290.85)

SELECT * FROM products
INNER JOIN products_ratings ON products.id = products_ratings.prod_id

SELECT products_categories.prod_id, products_categories.cat_id, categories1.*, products.* FROM products_categories
LEFT JOIN categories1 ON products_categories.cat_id = categories1.id
RIGHT JOIN products ON products_categories.prod_id = products.id