create table sales(
    id INT PRIMARY KEY,
    transaction_id INT NOT NULL,
    bill_no INT NOT NULL,
    bill_date TIMESTAMP,
    bill_location VARCHAR(250) NOT NULL,
    customer_id INT NOT NULL references customer(customer_id),
    product_id INT NOT NULL references product(product_id),
    quantity FLOAT NOT NULL,
    uom VARCHAR(100) NOT NULL,
    price NUMERIC(7,4) NOT NULL,
    gross_price NUMERIC(7,4) NOT NULL,
    tax_pc FLOAT NOT NULL default 0,
    tax_amt NUMERIC(7,4) NOT NULL,
    discount_pc FLOAT NOT NULL default 0,
    discount_amt NUMERIC(7,4) NOT NULL,
    net_bill_amt NUMERIC(7,4) NOT NULL,
    created_by VARCHAR(250) NOT NULL,
    created_date TIMESTAMP NOT NULL ,
    updated_by VARCHAR(250),
    updated_date TIMESTAMP
);

