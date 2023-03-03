--Create employees table
create table employees (
	emp_no VARCHAR PRIMARY KEY NOT NULL,
	emp_title_id VARCHAR NOT NULL,
	birth_date VARCHAR NOT NULL,
	first_name VARCHAR(35) NOT NULL,
	last_name VARCHAR(35) NOT NULL,
	gender VARCHAR(5)NOT NULL,
	hire_date VARCHAR NOT NULL
);

-- Create departments table
create table departments (
	dept_no VARCHAR(8) primary key NOT NULL,
	dept_name VARCHAR(40) NOT NULL
);

-- Create titles table
CREATE TABLE "titles" (
    "title_id" VARCHAR   NOT NULL,
    "title" VARCHAR(30)   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     ),
    CONSTRAINT "uc_titles_title" UNIQUE (
        "title"
    )
);

-- Create department employee table
create table dept_emp (
	emp_no VARCHAR NOT NULL,
	dept_no VARCHAR(8) NOT NULL,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

-- Create salaries table
create table salaries (
	emp_no VARCHAR NOT NULL,
	salary VARCHAR NOT NULL,
    foreign key (emp_no) references employees (emp_no)
);

-- Create Department manager table
create table dept_manager (
	dept_no VARCHAR(8) NOT NULL,
	emp_no VARCHAR NOT NULL,
    foreign key (emp_no) references employees (emp_no),
    foreign key (dept_no) references departments (dept_no)
);

