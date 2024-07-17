-- Table to store information about companies
CREATE TABLE companies (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT,
    email VARCHAR(255),
    phone VARCHAR(20)
);

-- Table to store information about vendors
CREATE TABLE vendors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT,
    email VARCHAR(255),
    phone VARCHAR(20)
);

-- Table to store information about banks
CREATE TABLE banks (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    address TEXT,
    swift_code VARCHAR(11),
    phone VARCHAR(20)
);

-- Table to store transactions
CREATE TABLE transactions (
    id SERIAL PRIMARY KEY,
    company_id INT NOT NULL,
    vendor_id INT,
    bank_id INT,
    amount NUMERIC(10, 2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    transaction_date TIMESTAMP NOT NULL,
    description TEXT,
    FOREIGN KEY (company_id) REFERENCES companies(id),
    FOREIGN KEY (vendor_id) REFERENCES vendors(id),
    FOREIGN KEY (bank_id) REFERENCES banks(id)
);

-- Indexes to improve performance on common queries
CREATE INDEX idx_transactions_company_id ON transactions(company_id);
CREATE INDEX idx_transactions_vendor_id ON transactions(vendor_id);
CREATE INDEX idx_transactions_bank_id ON transactions(bank_id);

-- Sample data insertion (Optional, for testing)
INSERT INTO companies (name, address, email, phone) VALUES
('Company A', '1234 Elm St, Springfield, IL', 'companya@example.com', '555-1234'),
('Company B', '5678 Oak St, Springfield, IL', 'companyb@example.com', '555-5678');

INSERT INTO vendors (name, address, email, phone) VALUES
('Vendor A', '9101 Pine St, Springfield, IL', 'vendora@example.com', '555-9101'),
('Vendor B', '1121 Maple St, Springfield, IL', 'vendorb@example.com', '555-1121');

INSERT INTO banks (name, address, swift_code, phone) VALUES
('Bank A', '1357 Birch St, Springfield, IL', 'BKAAA123', '555-1357'),
('Bank B', '2468 Cedar St, Springfield, IL', 'BKBBB456', '555-2468');
