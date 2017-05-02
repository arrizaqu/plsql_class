SELECT * FROM EMPLOYEES;
SELECT * FROM DEPARTMENTS;

-- HELLO WORLD
DBMS_OUTPUT.PUT_LINE('PLSQL BLOCK HELLO WORLD');

-- 1. PLSQL BLOCK 
SET SERVEROUTPUT ON;
BEGIN
  -- ACTION
  DBMS_OUTPUT.PUT_LINE('PLSQL BLOCK HELLO WORLD');  
END;
/

-- EXECUTE COMMAND
SET SERVEROUTPUT ON;
EXECUTE DBMS_OUTPUT.PUT_LINE('PLSQL BLOCK HELLO WORLD');

-- PROCEDURE 
CREATE OR REPLACE PROCEDURE xsis_procedure
IS -- AS
BEGIN
  -- proses 1
  UPDATE hr.employees
  SET first_name = 'STEVEN SECOND'
  WHERE employee_id = 100;
  UPDATE hr.employees
  SET first_names = 'STEVEN SECOND'
  WHERE employee_id = 100;
  UPDATE hr.employees
  SET first_name = 'STEVEN SECOND'
  WHERE employee_id = 100;
 
  -- proses 2 
  -- proses 3
  DBMS_OUTPUT.PUT_LINE('data updated!!');
END xsis_procedure;

select * from employees where employee_id 
              in (100, 101,102);


-- CALLING xsis_procedure
set serveroutput on;
execute xsis_procedure;

-- variable 
variable angka NUMBER;
execute :angka := 5;
print angka; 

-- PARAMETER MODE IN
CREATE OR REPLACE PROCEDURE xsis_send(
  p_user IN VARCHAR2, 
  p_val NUMBER)
IS
BEGIN
  DBMS_OUTPUT.PUT_LINE('USER : ' || p_user 
                    || ', salary : ' || p_val);
END xsis_send;

-- position
set serveroutput on;
execute xsis_send('jaya', 5000);

-- name parameter
set serveroutput on;
execute xsis_send(p_val => 5000, p_user => 'jaya');

-- PARAMETER MODE IN
CREATE OR REPLACE PROCEDURE xsis_send(
  p_user IN VARCHAR2, 
  p_val NUMBER)
IS
BEGIN
  DBMS_OUTPUT.PUT_LINE('USER : ' || p_user 
                    || ', salary : ' || p_val);
END xsis_send;

-- MODE OUT 
SELECT MAX(SALARY) FROM EMPLOYEES;

CREATE OR REPLACE PROCEDURE get_max(
  p_id IN NUMBER,
  p_max OUT NUMBER
)
IS
BEGIN
  SELECT max(salary) INTO p_max 
      FROM EMPLOYEES WHERE employee_id = p_id ;
END get_max;

-- host variable
variable resultSet2 NUMBER;
execute :resultSet2 := 0 ;
print resultSet2;
execute get_max(p_max => :resultSet2, p_id => 103);
print resultSet2;

-- via psql block / procedure
SET SERVEROUTPUT ON;
CREATE OR REPLACE PROCEDURE get_data(p_id IN NUMBER) 
AS
  v_result NUMBER;
BEGIN
  get_max(p_max => v_result, p_id => p_id);
  DBMS_OUTPUT.PUT_LINE('HASIL : ' || v_result);
end get_data;


SET SERVEROUTPUT ON;
execute get_data(103);

-- CREATE IN OUT MODE 
CREATE OR REPLACE PROCEDURE get_min(p_value IN OUT NUMBER)
IS
BEGIN
  SELECT MIN(SALARY) INTO p_value FROM EMPLOYEES 
              WHERE employee_id = p_value;
  p_value := p_value + 40000;
END get_min;

set serveroutput on;
DECLARE 
  v_res NUMBER := 103;
BEGIN
  DBMS_OUTPUT.PUT_LINE('input : ' || v_res);
  get_min(v_res);
  DBMS_OUTPUT.PUT_LINE('output : ' || v_res);
END;
/
