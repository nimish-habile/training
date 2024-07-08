SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET DEFINE ON;
--1. Explicit Cursor:
--a) Create an explicit cursor named "employee_cursor" to retrieve the details of employees from the "employees" table.
--b) Open the cursor and fetch the first three records from the cursor.
--c) Display the employee ID, first name, last name, and hire date for each of the fetched records.
--d) Close the cursor.
--DECLARE
--  V_EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
--  V_EMP_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
--  V_EMP_LAST_NAME EMPLOYEES.LAST_NAME%TYPE;
--  V_HIRE_DATE EMPLOYEES.HIRE_DATE%TYPE;
--  CURSOR EMPLOYEE_CURSOR
--  IS
--    SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, HIRE_DATE FROM EMPLOYEES;
--BEGIN
--  OPEN EMPLOYEE_CURSOR;
--  LOOP
--    FETCH EMPLOYEE_CURSOR
--    INTO V_EMP_ID,
--      V_EMP_FIRST_NAME,
--      V_EMP_LAST_NAME,
--      V_HIRE_DATE;
--    EXIT
--  WHEN EMPLOYEE_CURSOR%ROWCOUNT>3;
--    DBMS_OUTPUT.PUT_LINE(V_EMP_ID || ' ' || V_EMP_FIRST_NAME || ' ' || V_EMP_LAST_NAME || ' ' || V_HIRE_DATE);
--  END LOOP;
--  CLOSE EMPLOYEE_CURSOR;
--END;
--2. Cursor FOR LOOP:
--a) Write a PL/SQL block using a cursor FOR LOOP to display the names and salaries of all employees in the "employees" table.
--b) Ensure that the employees' names are displayed in uppercase and their salaries are increased by 10% before displaying them.
--DECLARE
--  V_EMP_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
--  V_EMP_SAL EMPLOYEES.SALARY%TYPE;
--  CURSOR EMPLOYEE_CURSOR
--  IS
--    SELECT FIRST_NAME, SALARY FROM EMPLOYEES;
--BEGIN
--  FOR EMP_REC IN EMPLOYEE_CURSOR LOOP
--    DBMS_OUTPUT.PUT_LINE(UPPER(EMP_REC.FIRST_NAME) || ' ' || (EMP_REC.SALARY)*1.1);
--  END LOOP;
--END;
--3. Explicit Cursor:
--a) Create an explicit cursor named "department_cursor" to retrieve department details from the "departments" table.
--b) Open the cursor and fetch the department name and manager ID for each department.
--c) Display the department name and manager ID for each record.
--d) Close the cursor.
--DECLARE
--  V_DEPT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
--  V_MANAGER_ID EMPLOYEES.MANAGER_ID%TYPE;
--  CURSOR DEPARTMENT_CURSOR
--  IS
--    SELECT E.MANAGER_ID,
--      D.DEPARTMENT_NAME
--    FROM DEPARTMENTS D
--    JOIN EMPLOYEES E
--    ON D.DEPARTMENT_ID = E.DEPARTMENT_ID;
--BEGIN
--  OPEN DEPARTMENT_CURSOR;
--  LOOP
--    FETCH DEPARTMENT_CURSOR INTO V_MANAGER_ID, V_DEPT_NAME;
--    EXIT WHEN DEPARTMENT_CURSOR%NOTFOUND;
--    DBMS_OUTPUT.PUT_LINE(V_DEPT_NAME || ' ' || V_MANAGER_ID);
--  END LOOP;
--  CLOSE DEPARTMENT_CURSOR;
--END;
--4. Cursor FOR LOOP with Nested Cursor:
--a) Create an explicit cursor named "department_cursor" to retrieve department IDs and names from the "departments" table.
--b) Use a cursor FOR LOOP to loop through each department record.
--c) For each department, create a nested cursor named "employee_cursor" to retrieve the names of employees who work in that department from the "employees" table.
--d) Use another cursor FOR LOOP to display the names of employees in each department.

--DECLARE
--V_DEPT_ID DEPARTMENTS.DEPARTMENT_ID%TYPE;
--V_DEPT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
--CURSOR DEPARTMENT_CURSOR IS
--SELECT DEPARTMENT_ID, DEPARTMENT_NAME FROM DEPARTMENTS;
--BEGIN
--  OPEN DEPARTMENT_CURSOR;
--  LOOP
--    FETCH DEPARTMENT_CURSOR INTO V_DEPT_ID, V_DEPT_NAME;
--    EXIT WHEN DEPARTMENT_CURSOR%NOTFOUND;
--    DECLARE
--      V_EMP_NAME EMPLOYEES.FIRST_NAME%TYPE;
--      CURSOR EMPLOYEE_CURSOR IS
--      SELECT FIRST_NAME FROM EMPLOYEES WHERE EMPLOYEES.DEPARTMENT_ID = V_DEPT_ID;
--    BEGIN
--    OPEN EMPLOYEE_CURSOR;
--    LOOP
--      FETCH EMPLOYEE_CURSOR INTO V_EMP_NAME;
--      EXIT WHEN EMPLOYEE_CURSOR%NOTFOUND;
--      DBMS_OUTPUT.PUT_LINE(V_EMP_NAME || ' ' || V_DEPT_NAME);
--    END LOOP;
--    CLOSE EMPLOYEE_CURSOR;
--    END;
--  END LOOP;
--  CLOSE DEPARTMENT_CURSOR;
--END;