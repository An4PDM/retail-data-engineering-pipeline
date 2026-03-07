CREATE TABLE staging.users (
    id_user INT PRIMARY KEY,
    email VARCHAR(255),
    username VARCHAR(50),
    password VARCHAR(255),
    firstname VARCHAR(100),
    lastname VARCHAR(100),
    phone VARCHAR(20),
    city VARCHAR(100),
    street VARCHAR(100),
    number INT,
    zipcode VARCHAR(20),
    lat NUMERIC(10,6),
    long NUMERIC(10,6)
);


CREATE TABLE staging.products (
    id_product INT PRIMARY KEY,
    title VARCHAR(255),
    price NUMERIC(10,2),
    description TEXT,
    category VARCHAR(100),
    image TEXT,
    rating_rate NUMERIC(3,2),
    rating_count INT
);



CREATE TABLE staging.carts (
    id_cart INT PRIMARY KEY,
    id_user INT,
    cart_date TIMESTAMP
);



CREATE TABLE staging.cart_products (
    id_cart INT,
    id_product INT,
    quantity INT,
    PRIMARY KEY (id_cart, id_product)
);