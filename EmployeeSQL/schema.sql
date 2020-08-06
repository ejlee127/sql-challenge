----- Create Tables -------------------------
CREATE TABLE "Departments" (
    "no"   VARCHAR(30)   NOT NULL,
    "name" VARCHAR(50)   NOT NULL,
    PRIMARY KEY ("no")
);
SELECT * FROM "Departments";

-------
CREATE TABLE "Titles" (
    "id" VARCHAR(30)   NOT NULL,
    "title" VARCHAR(50)   NOT NULL,
    PRIMARY KEY ("id")
);
SELECT * FROM "Titles";

----------
CREATE TABLE "Employees" (
    "no" INTEGER   NOT NULL,
    "title_id" VARCHAR(30)   NOT NULL,
    "birth_date" VARCHAR(30)   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(2)   NOT NULL,
    "hire_date" VARCHAR(30)   NOT NULL,
    PRIMARY KEY ("no"),
	FOREIGN KEY ("title_id") REFERENCES "Titles" ("id")
);
SELECT * FROM "Employees";

----------
CREATE TABLE "Salaries" (
    "employee_no" INTEGER   NOT NULL,
    "salary" INTEGER   NOT NULL,
	FOREIGN KEY("employee_no") REFERENCES "Employees"("no")
);
SELECT * FROM "Salaries";

----------
CREATE TABLE "Employees_Dept" (
    "employee_no" INTEGER   NOT NULL,
    "dept_no" VARCHAR(30)   NOT NULL,
	FOREIGN KEY("employee_no") REFERENCES "Employees" ("no"),
	FOREIGN KEY("dept_no") REFERENCES "Departments" ("no"),
	PRIMARY KEY (employee_no, dept_no)
);
SELECT * FROM "Employees_Dept";

----------
CREATE TABLE "Dept_Managers" (
    "dept_no" VARCHAR(30)   NOT NULL,
    "manager_no" INTEGER   NOT NULL,
	FOREIGN KEY ("dept_no") REFERENCES "Departments" ("no"),
	FOREIGN KEY ("manager_no") REFERENCES "Employees" ("no"),
	PRIMARY KEY ("dept_no", "manager_no")
);
SELECT * FROM "Dept_Managers";
