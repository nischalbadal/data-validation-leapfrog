create table customer(
    customer_id INT PRIMARY KEY,
    username VARCHAR(250) UNIQUE NOT NULL,
    first_name VARCHAR(250) NOT NULL,
    last_name VARCHAR(250) NOT NULL,
    country VARCHAR(250) NOT NULL,
    town VARCHAR(250) NOT NULL,
    is_active BOOLEAN default true
);

