SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET DEFINE ON;
--1. Implicit Cursors:
--a) What is an implicit cursor in PL/SQL? Explain its purpose and characteristics.
--Implicit cursor in pl/sql is a work area which is created automatically while the execution. It gives us the access to the result of the query.
--b) Write a PL/SQL block that uses an implicit cursor to fetch and display the names of all employees from the "employees" table.
--DECLARE
--BEGIN
--  FOR EMP IN
--  (SELECT FIRST_NAME,
--    LAST_NAME,
--    PHONE_NUMBER,
--    EMAIL,
--    HIRE_DATE,
--    SALARY,
--    JOB_ID,
--    DEPARTMENT_ID,
--    MANAGER_ID
--  FROM EMPLOYEES
--  )
--  LOOP
--    DBMS_OUTPUT.PUT_LINE('First Name: ' || EMP.FIRST_NAME);
--    DBMS_OUTPUT.PUT_LINE('last name: ' || EMP.LAST_NAME);
--    DBMS_OUTPUT.PUT_LINE('Phone numer: ' || EMP.PHONE_NUMBER);
--    DBMS_OUTPUT.PUT_LINE('Email: ' || EMP.EMAIL);
--    DBMS_OUTPUT.PUT_LINE('Hire_date: ' || EMP.HIRE_DATE);
--    DBMS_OUTPUT.PUT_LINE('Salary: ' || EMP.SALARY);
--    DBMS_OUTPUT.PUT_LINE('JOB_ID: ' || EMP.JOB_ID);
--    DBMS_OUTPUT.PUT_LINE('DEPARTMENT_ID: ' || EMP.DEPARTMENT_ID);
--    DBMS_OUTPUT.PUT_LINE('MANAGER_ID: ' || EMP.MANAGER_ID);
--  END LOOP;
--END;
--/
--2. Write a PL/SQL block to retrieve and display the details of an employee with a specific ID. Prompt the user to enter the employee ID as input.
--DECLARE
--  V_EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE := 101;
--  V_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
--  V_LAST_NAME EMPLOYEES.LAST_NAME%TYPE;
--  V_PHONE_NO EMPLOYEES.PHONE_NUMBER%TYPE;
--  V_EMAIL EMPLOYEES.EMAIL%TYPE;
--  V_HIRE_DATE EMPLOYEES.HIRE_DATE%TYPE;
--  V_SALARY EMPLOYEES.SALARY%TYPE;
--  V_JOB_ID EMPLOYEES.JOB_ID%TYPE;
--  V_DEPT_ID EMPLOYEES.DEPARTMENT_ID%TYPE;
--  V_MANAGER_ID EMPLOYEES.MANAGER_ID%TYPE;
--BEGIN
--  V_EMP_ID := '&ENTER_EMP_ID';
--  SELECT FIRST_NAME,
--    LAST_NAME,
--    PHONE_NUMBER,
--    EMAIL,
--    HIRE_DATE,
--    SALARY,
--    JOB_ID,
--    DEPARTMENT_ID,
--    MANAGER_ID
--  INTO V_FIRST_NAME,
--    V_LAST_NAME,
--    V_PHONE_NO,
--    V_EMAIL,
--    V_HIRE_DATE,
--    V_SALARY,
--    V_JOB_ID,
--    V_DEPT_ID,
--    V_manager_ID
--  FROM EMPLOYEES
--  WHERE EMPLOYEE_ID=V_EMP_ID;
--  DBMS_OUTPUT.PUT_LINE('First Name: ' || V_FIRST_NAME);
--  DBMS_OUTPUT.PUT_LINE('last name: ' || V_LAST_NAME);
--  DBMS_OUTPUT.PUT_LINE('Phone numer: ' || V_PHONE_NO);
--  DBMS_OUTPUT.PUT_LINE('Email: ' || V_EMAIL);
--  DBMS_OUTPUT.PUT_LINE('Hire_date: ' || V_hire_date);
--  DBMS_OUTPUT.PUT_LINE('Salary: ' || V_SALARY);
--  DBMS_OUTPUT.PUT_LINE('JOB_ID: ' || V_JOB_ID);
--  DBMS_OUTPUT.PUT_LINE('DEPARTMENT_ID: ' || V_DEPT_ID);
--  DBMS_OUTPUT.PUT_LINE('MANAGER_ID: ' || V_MANAGER_ID);
--END;
--3. Write a PL/SQL block that inserts a new department record into the "departments" table. Prompt the user to enter the department name and location as input.
--DECLARE
--  V_DEPT_ID DEPARTMENTS.DEPARTMENT_ID%TYPE;
--  V_DEPT_NAME DEPARTMENTS.DEPARTMENT_NAME%TYPE;
--  V_LOC_ID DEPARTMENTS.LOCATION_ID%TYPE;
--BEGIN
--  V_DEPT_NAME := '&ENTER_DEPT_NAME';
--  V_LOC_ID    := '&ENTER_LOC_ID';
--  V_DEPT_ID   := '&ENTER_DEPT_ID';
--  INSERT
--  INTO DEPARTMENTS
--    (
--      DEPARTMENT_ID,
--      DEPARTMENT_NAME,
--      LOCATION_ID
--    )
--    VALUES
--    (
--      V_DEPT_ID,
--      V_DEPT_NAME,
--      V_LOC_ID
--    );
--END;
--/
--4. Write a PL/SQL block to handle the NO_DATA_FOUND exception while fetching an employee's details based on a given employee ID. Display a custom message when the exception occurs.
--DECLARE
--  V_EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
--  V_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
--  V_LAST_NAME EMPLOYEES.LAST_NAME%TYPE;
--  V_SALARY EMPLOYEES.SALARY%TYPE;
--BEGIN
--  V_EMP_ID := '&ENTER_EMP_ID';
--  SELECT FIRST_NAME,
--    LAST_NAME,
--    SALARY
--  INTO V_FIRST_NAME,
--    V_LAST_NAME,
--    V_SALARY
--  FROM EMPLOYEES
--  WHERE EMPLOYEE_ID=V_EMP_ID;
--  DBMS_OUTPUT.PUT_LINE('First Name: ' || V_FIRST_NAME);
--  DBMS_OUTPUT.PUT_LINE('last name: ' || V_LAST_NAME);
--  DBMS_OUTPUT.PUT_LINE('Salary: ' || V_SALARY);
--EXCEPTION
--   WHEN NO_DATA_FOUND THEN
--      DBMS_OUTPUT.PUT_LINE('No employees found for the given employee ID.');
--   WHEN OTHERS THEN
--      DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
--END;
--/
--5. Transaction Management:
--a) Write a PL/SQL block that transfers an employee from one department to another. Update the "departments" table and the "employees" table to reflect the change. Ensure that both updates are treated as a single transaction and are committed only if both succeed.
--b) Create a stored procedure that allows updating an employee's job title and salary simultaneously. If the job title is updated successfully, but the salary update fails, the procedure should roll back the job title change.
--DECLARE
--  V_EMPLOYEE_ID EMPLOYEES.EMPLOYEE_ID%TYPE := 100;
--  V_OLD_DEPARTMENT_ID EMPLOYEES.DEPARTMENT_ID%TYPE;
--  V_NEW_DEPARTMENT_ID DEPARTMENTS.DEPARTMENT_ID%TYPE := 10;
--  EX_DEPARTMENT_NOT_FOUND EXCEPTION;
--  EX_EMPLOYEE_NOT_FOUND   EXCEPTION;
--BEGIN
--  SELECT DEPARTMENT_ID
--  INTO V_OLD_DEPARTMENT_ID
--  FROM EMPLOYEES
--  WHERE EMPLOYEE_ID = V_EMPLOYEE_ID;
--  SELECT DEPARTMENT_ID
--  INTO V_NEW_DEPARTMENT_ID
--  FROM DEPARTMENTS
--  WHERE DEPARTMENT_ID = V_NEW_DEPARTMENT_ID;
--  UPDATE EMPLOYEES
--  SET DEPARTMENT_ID = V_NEW_DEPARTMENT_ID
--  WHERE EMPLOYEE_ID = V_EMPLOYEE_ID;
--  COMMIT;
--EXCEPTION
--WHEN NO_DATA_FOUND THEN
--  IF SQL%ROWCOUNT = 0 THEN
--    RAISE EX_EMPLOYEE_NOT_FOUND;
--  ELSE
--    RAISE EX_DEPARTMENT_NOT_FOUND;
--  END IF;
--WHEN EX_DEPARTMENT_NOT_FOUND THEN
--  DBMS_OUTPUT.PUT_LINE('Error: New department does not exist.');
--  ROLLBACK;
--WHEN EX_EMPLOYEE_NOT_FOUND THEN
--  DBMS_OUTPUT.PUT_LINE('Error: Employee not found.');
--  ROLLBACK;
--WHEN OTHERS THEN
--  DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
--  ROLLBACK;
--END;
--/
--6. Write a PL/SQL block to retrieve the employee details (employee_id, first_name, last_name, and salary) from the "employees" table for a given department ID (prompt user). If no employees are found, display "No employees found for the given department."
--DECLARE
--  V_DEPT_ID EMPLOYEES.DEPARTMENT_ID%TYPE;
--  V_EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
--  V_FIRST_NAME EMPLOYEES.FIRST_NAME%TYPE;
--  V_LAST_NAME EMPLOYEES.LAST_NAME%TYPE;
--  V_SALARY EMPLOYEES.SALARY%TYPE;
--  V_EMP_COUNT NUMBER:=0;
--  CURSOR EMP
--  IS
--    SELECT EMPLOYEE_ID,
--      FIRST_NAME,
--      LAST_NAME,
--      SALARY
--    FROM EMPLOYEES
--    WHERE DEPARTMENT_ID = V_DEPT_ID;
--
--BEGIN
--  V_DEPT_ID := '&ENTER_DEPT_ID';
--  OPEN EMP;
--    LOOP
--    FETCH EMP INTO V_EMP_ID, V_FIRST_NAME, V_LAST_NAME, V_SALARY;
--    EXIT WHEN EMP%NOTFOUND;
--    V_EMP_COUNT := V_EMP_COUNT+1;
--      DBMS_OUTPUT.PUT_LINE('EMP_ID: ' || V_EMP_ID);
--      DBMS_OUTPUT.PUT_LINE('FIRST_NAME: ' || V_FIRST_NAME);
--      DBMS_OUTPUT.PUT_LINE('LAST_NAME: ' || V_LAST_NAME);
--      DBMS_OUTPUT.PUT_LINE('SALARY: ' || V_SALARY);
--    END LOOP;
--  CLOSE EMP;
--  IF V_EMP_COUNT = 0 THEN
--  DBMS_OUTPUT.PUT_LINE('NO EMPLOYEES FOUND FOR THE GIVEN DEPARTMENT.');
--  END IF;
--EXCEPTION
--WHEN OTHERS THEN
--  DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
--END;
--/
--7. Create a PL/SQL block that increases the salary of all employees in the "sales" department by 10%. Display the affected employee IDs and their updated salaries.
--DECLARE
--  V_SAL_MULT EMPLOYEES.SALARY%TYPE := 1.1;
--BEGIN
--  UPDATE EMPLOYEES
--  SET SALARY          = SALARY*V_SAL_MULT
--  WHERE DEPARTMENT_ID =
--    (SELECT DEPARTMENT_ID FROM DEPARTMENTS WHERE DEPARTMENT_NAME = 'Shipping'
--    );
--END;
--FOR employee IN
--(SELECT employee
--)
--/
--8. Write a PL/SQL block that deletes all employees who have a salary less than 3000 and hire date older than 5 years. Display the count of deleted employees.
--VARIABLE COUNT_ROWS_DELETED NUMBER;
--DECLARE
--  V_EMP_ID EMPLOYEES.EMPLOYEE_ID%TYPE;
--BEGIN
--  DELETE
--  FROM EMPLOYEES
--  WHERE SALARY                            < 3000
--  AND ROUND((SYSDATE - HIRE_DATE)/365, 1) > 5;
--  :COUNT_ROWS_DELETED                    := SQL%ROWCOUNT;
--END;
--/
--PRINT COUNT_ROWS_DELETED
--9. Write a PL/SQL block to insert a new record into the "employees" table.
--DECLARE
--BEGIN
--  INSERT
--  INTO EMPLOYEES
--    (
--      EMPLOYEE_ID,
--      FIRST_NAME,
--      LAST_NAME,
--      EMAIL,
--      HIRE_DATE,
--      JOB_ID,
--      SALARY
--    )
--    VALUES
--    (
--      175,
--      'NIMISH',
--      'TOSHNIWAL',
--      'NTOSHNIWAL',
--      SYSDATE,
--      9,
--      10000
--    );
--END;
--/