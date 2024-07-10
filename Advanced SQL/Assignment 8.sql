--1. Create a stored procedure named "GET_EMPLOYEES" that returns all employee details from the "employees" table.

CREATE OR REPLACE PROCEDURE GET_EMPLOYEES(EMP_CURSOR OUT SYS_REFCURSOR)
IS 
BEGIN
OPEN EMP_CURSOR FOR
SELECT * FROM EMPLOYEES;
END;

DECLARE
TYPE EMP_CURSOR IS REF CURSOR;
BEGIN
  GET_EMPLOYEES(:EMP_CURSOR);
END;

--2. Modify the "GET_EMPLOYEES" stored procedure to accept an input parameter "department_id" 
--   and return only the employees who belong to that department.
--3. Create a stored procedure named "GET_EMPLOYEES_IN_DEPT" that accepts a department ID as an input parameter. 
--   Use a cursor to fetch all employee names and salaries for the given department and display the results.
--4. Create a new object type "employee_type" with attributes for "employee_id," "first_name," "last_name," and "salary."
--   Create a nested table type "employee_table" using the "employee_type" object type.
--   Write a stored procedure named "INSERT_EMPLOYEES" that accepts an array of employee records (employee_table) as input 
--   and inserts them into the "employees" table.
--   The procedure should handle the situation when the provided department ID does not exist in the "DEPARTMENTS" table. 
--   In such cases, it should raise a custom exception and display an appropriate error message.
--5. CREATE A STORED PROCEDURE NAMED "UPDATE_SALARY_BATCH" THAT TAKES AN ARRAY OF EMPLOYEE IDS AND A PERCENTAGE INCREASE AS INPUTS. 
--   The procedure should update the salaries of the employees whose IDs are in the input array with the given percentage increase.