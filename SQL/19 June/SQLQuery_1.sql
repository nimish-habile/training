-- SELECT * from Employees

-- SELECT *
-- FROM EMPLOYEES 
-- WHERE HIRE_DATE>= '2009-02-28'

-- SELECT LAST_NAME, DEPARTMENT_ID
-- FROM EMPLOYEES
-- WHERE EMPLOYEE_ID = 176

-- SELECT LAST_NAME, DEPARTMENT_ID
-- FROM EMPLOYEES
-- WHERE DEPARTMENT_ID IN (20, 50)
-- ORDER BY LAST_NAME

-- SELECT JOB_ID, HIRE_DATE
-- FROM EMPLOYEES
-- WHERE HIRE_DATE BETWEEN '1998-02-20' AND '1998-05-01'

-- SELECT JOB_ID, HIRE_DATE
-- FROM EMPLOYEES
-- WHERE YEAR(HIRE_DATE) = 1994;

-- SELECT LAST_NAME, JOB_ID
-- FROM EMPLOYEES 
-- WHERE MANAGER_ID IS NULL

-- SELECT LAST_NAME, SALARY
-- FROM EMPLOYEES
-- ORDER BY SALARY DESC

-- SELECT LAST_NAME 
-- FROM EMPLOYEES
-- WHERE LAST_NAME LIKE '__a%'

-- SELECT LAST_NAME
-- FROM EMPLOYEES
-- WHERE LAST_NAME LIKE '%a%' AND LAST_NAME LIKE '%e%'

-- SELECT LAST_NAME, JOB_ID, SALARY
-- FROM EMPLOYEES
-- WHERE SALARY NOT IN (25000, 35000, 70000)

-- SELECT GETDATE() AS Date

-- SELECT EMPLOYEE_ID, LAST_NAME, ROUND(SALARY*1.15, 0) 'New Salary'
-- FROM EMPLOYEES

-- SELECT UPPER(SUBSTRING(LAST_NAME,1,1)) + LOWER(SUBSTRING(LAST_NAME, 2, LEN(LAST_NAME))) AS NEW_LAST_NAME, LEN(LAST_NAME) Lengthoflastname
-- FROM EMPLOYEES
-- WHERE UPPER(SUBSTRING(LAST_NAME,1,1)) IN ('J', 'A', 'M')
-- ORDER BY LAST_NAME

-- DROP TABLE employees

SELECT CHAR(65) AS CodeToCharacter;
SELECT CHAR(97) AS CodeToCharacter;

SELECT CHARINDEX('t', 'Customer') AS MatchPosition;
SELECT CHARINDEX('OM', 'Customer') AS MatchPosition

SELECT CONCAT('W3Schools', '.com');
SELECT CONCAT('SQL', ' ', 'is ', 'fun!');

SELECT 'W3Schools' + '.com';
SELECT 'SQL' + ' is' + ' fun!';

SELECT CONCAT_WS('.', 'www', 'W3Schools', 'com');
SELECT CONCAT_WS('+', 'www', 'W3Schools', 'com');

SELECT DATALENGTH('W3Schools.com');
SELECT DATALENGTH('   W3Schools.com   ');
SELECT DATALENGTH('2017-08');

SELECT LEFT('SQL Tutorial', 3) AS ExtractString;
SELECT LEFT('SQL Tutorial', 100) AS ExtractString;

SELECT LEN('W3Schools.com');
SELECT LEN(' W3Schools.com         ');

SELECT LOWER('SQL Tutorial is FUN!');

SELECT LTRIM('     SQL Tutorial') AS LeftTrimmedString;
SELECT LTRIM('     SQL Tutorial                      ') AS LeftTrimmedString;

SELECT PATINDEX('%schools%', 'W3Schools.com');
SELECT PATINDEX('%s%com%', 'W3Schools.com');
SELECT PATINDEX('%[ol]%', 'W3Schools.com');
SELECT PATINDEX('%[z]%', 'W3Schools.com');

SELECT REPLACE('SQL Tutorial', 'T', 'M');
SELECT REPLACE('SQL Tutorial', 'SQL', 'HTML');
SELECT REPLACE('ABC ABC ABC', 'a', 'c');

SELECT REPLICATE('SQL Tutorial', 5);

SELECT REVERSE('SQL Tutorial');

SELECT RIGHT('SQL Tutorial', 3) AS ExtractString;

SELECT RTRIM('SQL Tutorial     ') AS RightTrimmedString;

SELECT SPACE(10);

SELECT STR(185);
SELECT STR(185.5);
SELECT STR(185.476, 6, 2);

SELECT STUFF('SQL Tutorial', 1, 3, 'HTML');
SELECT STUFF('SQL Tutorial!', 13, 1, ' is fun!');

SELECT SUBSTRING('SQL Tutorial', 1, 3) AS ExtractString;
SELECT SUBSTRING('SQL Tutorial', 1, 100) AS ExtractString;

SELECT TRANSLATE('Monday', 'Monday', 'Sunday');
SELECT TRANSLATE('Monday', 'M', 'S');

SELECT TRIM('     SQL Tutorial!     ') AS TrimmedString;
SELECT TRIM('#! ' FROM '    #SQL Tutorial!    ') AS TrimmedString;

SELECT UPPER('SQL Tutorial is FUN!');