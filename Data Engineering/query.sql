
CREATE TABLE salaries (
    emp_no int  NOT NULL,
    salary int  NOT NULL
);

CREATE TABLE dept_emp (
    emp_no int  NOT NULL,
    dept_no char(4)  NOT NULL
);

CREATE TABLE dept_manager (
    dept_no char(4)  NOT NULL,
    emp_no int  NOT NULL
);

CREATE TABLE titles (
    title_id char(5)  NOT NULL,
    title varchar(20)  NOT NULL,
    primary key (title_id)
);

CREATE TABLE employees (
    emp_no int  NOT NULL,
    emp_title char(5)  NOT NULL,
    birth_date date  NOT NULL,
    first_name varchar(20)  NOT NULL,
    last_name varchar(20)  NOT NULL,
    sex char(1)  NOT NULL,
    hire_date date  NOT NULL,
    PRIMARY KEY (emp_no)
);

CREATE TABLE departments (
    dept_no char(4)  NOT NULL,
    dept_name varchar(20)  NOT NULL,
    primary key (dept_no)
 );

ALTER TABLE dept_emp ADD CONSTRAINT fk_departments_dept_emp FOREIGN KEY(dept_no) REFERENCES departments(dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_departments_dept_mgr FOREIGN KEY (dept_no) REFERENCES departments (dept_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_employees_dept_emp FOREIGN KEY(emp_no) REFERENCES employees (emp_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_employees_dept_mgr FOREIGN KEY(emp_no) REFERENCES employees (emp_no);

ALTER TABLE salaries ADD CONSTRAINT fk_employees_salaries FOREIGN KEY(emp_no) REFERENCES employees (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_titles FOREIGN KEY(emp_title) REFERENCES titles (title_id);


-- import order:  departments, titles, employees, dept_emp, dept_manager, salaries