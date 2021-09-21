create table product(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(250) NOT NULL,
    description VARCHAR(250) NOT NULL,
    price NUMERIC(7,4) NOT NULL,
    mrp FLOAT NOT NULL,
    pieces_per_case FLOAT NOT NULL,
    weight_per_case FLOAT NOT NULL,
    uom VARCHAR(100) NOT NULL,
    brand VARCHAR(250) NOT NULL,
    category VARCHAR(250) NOT NULL,
    tax_percent FLOAT NOT NULL,
    active CHAR NOT NULL,
    created_by VARCHAR(250) NOT NULL,
    created_date TIMESTAMP NOT NULL,
    updated_by VARCHAR(250),
    updated_date TIMESTAMP
);

