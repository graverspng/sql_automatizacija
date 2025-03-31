USE pet_shop;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    id INT PRIMARY KEY,
    position VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    CONSTRAINT fk_employees_clients FOREIGN KEY (id) REFERENCES clients(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
