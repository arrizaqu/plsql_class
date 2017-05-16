# DATA COLLECTION PLSQL
## TABLE ASSOCIATIVE ARRAY
## EXAMPLE 1 -- single row: 
	* CODE : 
		SET SERVEROUTPUT ON;
		DECLARE
		 TYPE v_data_type IS TABLE OF hr.employees.first_name%TYPE;
		 v_data v_data_type;
		BEGIN
		  v_data := v_data_type('masyda', 'agung', 'rahmat');  
		  FOR i IN 1..v_data.count() LOOP
			dbms_output.put_line('name : ' || v_data(i));
		  END LOOP;
		END;
		/

## EXAPLE 2 : 
	* CODE : 
		SET SERVEROUTPUT ON;
		DECLARE
		 TYPE v_data_type IS TABLE OF hr.employees%ROWTYPE INDEX BY PLS_INTEGER;
		 v_data v_data_type;
		BEGIN
		  -- null;
		  SELECT * INTO v_data(1) FROM employees where employee_id = 103;
		  dbms_output.put_line('name : ' || v_data(1).first_name );
		END;
		/
		
## EXAMPLE 3 -- multiple row : 
	* CODE : 
		set serveroutput on;
		DECLARE 
		  TYPE v_data_type IS TABLE OF hr.employees%ROWTYPE INDEX BY PLS_INTEGER;
		  v_data v_data_type;
		  v_data2 v_data_type;
		BEGIN
		  SELECT * BULK COLLECT INTO v_data FROM employees;
		  FOR i IN 1..v_data.count() LOOP 
			dbms_output.put_line(i ||', full name : ' || v_data(i).first_name || ' ' || v_data(i).last_name || ', commission pct : '|| v_data(i).COMMISSION_PCT);  
		  END LOOP;
		END;
		/

## VARRAY ARRAY 
	* EXAMPLE : 
		SET SERVEROUTPUT ON;
		DECLARE
		  TYPE v_data_type IS VARRAY(5) OF HR.EMPLOYEES.FIRST_NAME%TYPE;
		  v_data v_data_type;
		BEGIN 
		  v_data := v_data_type('aku', 'kepingin', 'belajar');
		  FOR i IN 1..v_data.count() LOOP
			<<OUTERLOOP>>
			  dbms_output.put_line('loop ' || i || ', ' || v_data(i));
		  END LOOP OUTERLOOP;
		END;
		/
		
## EXPLISIT CURSOR
## EXAMPLE 1 -- single row: 
		DECLARE
		  CURSOR cur_data IS
			SELECT 
			  employee_id,
			  first_name,
			  last_name
			FROM EMPLOYEES WHERE EMPLOYEE_ID = 100;
		  v_name hr.employees.employee_id%TYPE;
		  v_first_name hr.employees.first_name%TYPE;
		  v_last_name hr.employees.last_name%TYPE;
		BEGIN
		  OPEN cur_data;
		  FETCH cur_data INTO v_name, v_first_name, v_last_name;
			dbms_output.put_line('name : ' || v_name);
			dbms_output.put_line('nama depan : '|| v_first_name);
			dbms_output.put_line('nama belakang : '|| v_last_name);
		END;
		/

## EXAMPLE 2 -- MULTIPLE RECORD
	* CODE : 
		SET SERVEROUTPUT ON;
		DECLARE
		  CURSOR cur_data IS
			SELECT first_name, salary, hire_date FROM EMPLOYEES;
		  v_name hr.employees.first_name%TYPE;
		  v_salary hr.employees.salary%TYPE;
		  v_hire_date hr.employees.hire_date%TYPE;
		BEGIN
		  OPEN cur_data;
		  lOOP
			FETCH cur_data INTO v_name, v_salary, v_hire_date; 
			EXIT WHEN cur_data%NOTFOUND;
			DBMS_OUTPUT.PUT_LINE('name : ' || v_name);
			DBMS_OUTPUT.PUT_LINE('salary : ' || v_salary);
			DBMS_OUTPUT.PUT_LINE('hire_date : ' || v_hire_date);
		  END LOOP;
		  CLOSE cur_data;
		END;
		/
		
## CURSOR AND RECORD DEFINITION WITH %ROWTYPE
	* CODE : 
		SET SERVEROUTPUT ON;
		DECLARE
		  CURSOR cur_data IS
			SELECT first_name, salary, hire_date  FROM EMPLOYEES;
			v_row_data cur_data%ROWTYPE; 
		BEGIN
		  OPEN cur_data;
		  lOOP
			FETCH cur_data INTO v_row_data;
			EXIT WHEN cur_data%NOTFOUND;
			  DBMS_OUTPUT.PUT_LINE('name : ' || v_row_data.first_name);
			  DBMS_OUTPUT.PUT_LINE('salary : ' || v_row_data.salary);
			  DBMS_OUTPUT.PUT_LINE('hire_date : ' || v_row_data.hire_date);
		  END LOOP;
		  CLOSE cur_data;
		END;
		/