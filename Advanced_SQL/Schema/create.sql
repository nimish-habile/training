CREATE TABLE regions (
    region_id NUMBER PRIMARY KEY,
    region_name VARCHAR2(25) DEFAULT NULL
);

CREATE TABLE countries (
    country_id CHAR(2) PRIMARY KEY,
    country_name VARCHAR2(40) DEFAULT NULL,
    region_id NUMBER NOT NULL,
    CONSTRAINT fk_region FOREIGN KEY (region_id) REFERENCES regions (region_id) ON DELETE CASCADE
);

CREATE TABLE locations (
    location_id NUMBER PRIMARY KEY,
    street_address VARCHAR2(40) DEFAULT NULL,
    postal_code VARCHAR2(12) DEFAULT NULL,
    city VARCHAR2(30) NOT NULL,
    state_province VARCHAR2(25) DEFAULT NULL,
    country_id CHAR(2) NOT NULL,
    CONSTRAINT fk_country FOREIGN KEY (country_id) REFERENCES countries (country_id) ON DELETE CASCADE
);

CREATE TABLE jobs (
    job_id NUMBER PRIMARY KEY,
    job_title VARCHAR2(35) NOT NULL,
    min_salary NUMBER(8, 2) DEFAULT NULL,
    max_salary NUMBER(8, 2) DEFAULT NULL
);

CREATE TABLE departments (
    department_id NUMBER PRIMARY KEY,
    department_name VARCHAR2(30) NOT NULL,
    location_id NUMBER DEFAULT NULL,
    CONSTRAINT fk_location FOREIGN KEY (location_id) REFERENCES locations (location_id) ON DELETE CASCADE
);

CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(20) DEFAULT NULL,
    last_name VARCHAR2(25) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    phone_number VARCHAR2(20) DEFAULT NULL,
    hire_date DATE NOT NULL,
    job_id NUMBER NOT NULL,
    salary NUMBER(8, 2) NOT NULL,
    manager_id NUMBER DEFAULT NULL,
    department_id NUMBER DEFAULT NULL,
    CONSTRAINT fk_job FOREIGN KEY (job_id) REFERENCES jobs (job_id) ON DELETE CASCADE,
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES departments (department_id) ON DELETE CASCADE,
    CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employees (employee_id)
);

CREATE TABLE dependents (
    dependent_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50) NOT NULL,
    last_name VARCHAR2(50) NOT NULL,
    relationship VARCHAR2(25) NOT NULL,
    employee_id NUMBER NOT NULL,
    CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES employees (employee_id) ON DELETE CASCADE
);
