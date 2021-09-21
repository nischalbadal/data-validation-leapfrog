create table employee(
    client_employee_id VARCHAR(200) PRIMARY KEY ,
    department_id VARCHAR(200) NOT NULL,
    first_name VARCHAR(200) NOT NULL,
    last_name VARCHAR(200) NOT NULL,
    manager_emp_id VARCHAR(200),
    salary FLOAT NOT NULL,
    hire_date DATE NOT NULL,
    term_date DATE,
    term_reason VARCHAR(500),
    dob DATE NOT NULL,
    fte FLOAT NOT NULL,
    fte_status VARCHAR(250) NOT NULL,
    weekly_hours FLOAT NOT NULL,
    role VARCHAR(200) NOT NULL,
    is_active BOOLEAN default TRUE
);

