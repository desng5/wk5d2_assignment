CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100),
    age INTEGER
);


CREATE TABLE film(
    film_id SERIAL PRIMARY KEY,
    film_title VARCHAR(50),
    duration INTEGER,
    showtime DATE,
    genre VARCHAR(25),
    rating VARCHAR(20)
);


CREATE TABLE employee (
    emp_id SERIAL PRIMARY KEY,
    f_name VARCHAR(50),
    l_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(20),
    schedule VARCHAR(10)
);


CREATE TABLE room(
    room_id SERIAL PRIMARY KEY,
    capacity INTEGER,
    RPX BOOLEAN,
    doors INTEGER,
    film_id INTEGER,
    emp_id INTEGER,
    FOREIGN KEY (film_id)
        REFERENCES film(film_id),
    FOREIGN KEY (emp_id)
        REFERENCES employee(emp_id)
);


CREATE TABLE concession(
    concession_id SERIAL PRIMARY KEY,
    snacks VARCHAR(30),
    quantity INTEGER,
    snack_cost INTEGER,
    customer_id INTEGER,
    emp_id INTEGER,
    FOREIGN KEY (customer_id)
    	REFERENCES customer(customer_id),
    FOREIGN KEY (emp_id)
        REFERENCES employee(emp_id)
);


CREATE TABLE ticket(
    ticket_id SERIAL PRIMARY KEY,
    ticket_cost INTEGER,
    quantity INTEGER,
    showtime DATE,
    customer_id INTEGER,
    film_id INTEGER,
    FOREIGN KEY (film_id)
        REFERENCES film(film_id),
    FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id)
);


CREATE TABLE customer_concession (
    transaction_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    concession_id INTEGER,
    FOREIGN KEY (customer_id)
        REFERENCES customer(customer_id),
    FOREIGN KEY (concession_id)
        REFERENCES concession(concession_id)
);

SELECT *
FROM customer;

ALTER TABLE customer
RENAME COLUMN customer_id TO patreon_id;

ALTER TABLE customer_concession 
RENAME COLUMN transaction_id TO sale_id;

ALTER TABLE concession 
ADD COLUMN drink VARCHAR(15);

ALTER TABLE ticket RENAME COLUMN ticket_cost TO price;