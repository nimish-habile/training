SET SERVEROUTPUT ON;
SET VERIFY OFF;
SET DEFINE ON;
--1. Create a PL/SQL program that declares a nested table of integers, populates it with values (e.g., 10, 20, 30), and then displays the elements of the nested table.
--2. Create a PL/SQL program that declares a varray of characters with a fixed size of 5.
--Implement a loop to take input from the user for all five elements of the varray and then display the contents of the varray.
--
--3. Create a PL/SQL program that declares an associative array (index-by table) of student names and their respective scores in a test. Populate the array with at least five records and then display the student names along with their scores.
--DECLARE
--TYPE STUDENT_TABLE_TYPE
--IS
--  TABLE OF NUMBER(3) INDEX BY VARCHAR2(20);
--  STU_TABLE STUDENT_TABLE_TYPE;
--  V_CUR_NAME VARCHAR2(20);
--BEGIN
--  STU_TABLE('ALFRED') := 90;
--  STU_TABLE('FREEDON') := 45;
--  STU_TABLE('LLOYD') := 87;
--  STU_TABLE('DAVID') := 98;
--  STU_TABLE('JENNY') := 76;
--  V_CUR_NAME := STU_TABLE.FIRST;
--  WHILE V_CUR_NAME IS NOT NULL LOOP
--    DBMS_OUTPUT.PUT_LINE(V_CUR_NAME || ' ' || STU_TABLE(V_CUR_NAME));
--    V_CUR_NAME := STU_TABLE.NEXT(V_CUR_NAME);
--  END LOOP;
--END;
--4. Write a PL/SQL program that uses an associative array of question 3. Calculate the average of all the values of the scores in the array.

--DECLARE
--TYPE STUDENT_TABLE_TYPE
--IS
--  TABLE OF NUMBER(4) INDEX BY VARCHAR2(20);
--  STU_TABLE STUDENT_TABLE_TYPE;
--  V_CUR_NAME VARCHAR2(20);
--  V_SUM NUMBER(4) := 0;
--  V_COUNT NUMBER(4) :=0;
--BEGIN
--  STU_TABLE('ALFRED') := 90;
--  STU_TABLE('FREEDON') := 45;
--  STU_TABLE('LLOYD') := 87;
--  STU_TABLE('DAVID') := 98;
--  STU_TABLE('JENNY') := 76;
--  V_CUR_NAME := STU_TABLE.FIRST;
--  WHILE V_CUR_NAME IS NOT NULL LOOP
--    V_SUM := V_SUM + STU_TABLE(V_CUR_NAME);
--    V_COUNT := V_COUNT + 1;
--    V_CUR_NAME := STU_TABLE.NEXT(V_CUR_NAME);
--  END LOOP;
--  DBMS_OUTPUT.PUT_LINE(V_SUM/V_COUNT);
--END;

--5. Create a PL/SQL program that declares a nested table of timestamps.
--IMPLEMENT A LOOP TO POPULATE THE COLLECTION WITH TIMESTAMPS REPRESENTING DIFFERENT DATES AND TIMES,
--and then display the timestamps in chronological order.