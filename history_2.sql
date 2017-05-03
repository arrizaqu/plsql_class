Tugas 
	1. Buat table "history_dept" menggunakan 
	   procedure 
	   * buat script create table 
	   * struktur table : 
			- history_dept_id (number)
			- department_name (varchar)
			- location_id (number)
			- manager_id  (number)
			- department_id (number)
		* call history_dept 
			
	2. Buat Procedure add_history
	   * Buat sequence untuk table add_history 
	   * action / execute : 
		 - setelah insert add_department berhasil 
		 - masukkan data yang sama ke add_history
- department_id(history_dept) = department_id(departments)  

JAWAB :

-- CREATE PROCEDURE TABLE HISTORY_DEPT
CREATE OR REPLACE PROCEDURE create_table_history
IS
create_table varchar(1000);
BEGIN
  create_table := 'CREATE TABLE HR.HISTORY_DEPT
  (
    history_dept_id NUMBER,
    department_name VARCHAR2(50),
    location_id NUMBERs,
    manager_id  NUMBER, department_id NUMBER
  )';
  EXECUTE IMMEDIATE create_table;  
END create_table_history;
/

 
-- CREATE PROCEDURE add_deparments
CREATE OR REPLACE PROCEDURE add_deparments(
  p_name IN varchar2,
  p_mgr IN varchar2,
  p_loc IN number
)
IS
v_gen_id NUMBER := departments_seq.NEXTVAL;
BEGIN 
  insert into departments(department_id, 
				department_name, manager_id, location_id)
  values 
  (v_gen_id, p_name, p_mgr, p_loc);
  DBMS_OUTPUT.PUT_LINE('SUCCESS ADD DEPARTMENT : ' || p_name);
  add_history_dept_prc(p_name,p_loc,p_mgr,v_gen_id);
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('ERROR adding department : '|| p_name);
END add_deparments;
/

-- CREATE PROCEDURE add_history_dept_prc
CREATE OR REPLACE PROCEDURE add_history_dept_prc(
  p_name hr.departments.DEPARTMENT_NAME%TYPE,
  p_loc hr.departments.LOCATION_ID%TYPE,
  p_mgr hr.departments.MANAGER_ID%TYPE,
  p_dept_id NUMBER
)
IS
BEGIN
  INSERT INTO history_dept 
    (HISTORY_DEPT_ID, DEPARTMENT_NAME, 
    LOCATION_ID, MANAGER_ID, DEPARTMENT_ID)
    values
    (departments_seq.NEXTVAL, 
					p_name, p_loc, p_mgr, p_dept_id);
END add_history_dept_prc;
/

-- CALLING PROCEDURE add_deparments AND EXECUTION

EXECUTE create_table_history;

BEGIN
  add_deparments('MEDIA', 100, 1800);
  -- add_deparments('Editing', 99, 1800); -- ERROR
  -- add_deparments('Advertising', 101, 1800);
END;
/

-- CHECK TABLE DEPARTMENT and HISTORY_DEPT
select * from departments where department_id = 
select * from history_dept;

-- CREATE FUNCTION 
-- PERBEDAAN ANTARA PROCEDURE DAN FUNCTION 
  * PROCEDURE => ACTION
  * FUNCTION => RETURN VALUE 
  
-- PLSQL BLOCK
    -- DECLARE
    -- BEGIN
    -- END
-- PROCEDURE 
    -- CREATE OR REPLACE PROCEDURE
    -- IS / AS
    -- BEGIN
    -- END
-- FUNCTION
    -- CREATE OR REPLACE FUNCTION
    -- RETURN DATAYPE 
    -- IS
    -- BEGIN
    -- RETURN
    -- END;

-- HELLO WORLD
CREATE OR REPLACE FUNCTION hallo_fun
RETURN VARCHAR2 IS
BEGIN
  RETURN 'HALLO WORLD FUNCTION PLSQL';
END;
/


SET SERVEROUTPUT ON;
EXECUTE DBMS_OUTPUT.PUT_LINE('TEXT : ' || hallo_fun);

-- HOST VARIABLE 
VARIABLE text VARCHAR2; 
execute :text := hallo_fun;
print textS;