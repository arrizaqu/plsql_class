# Tugas

1. 	buat field bonus untuk menampilkan data employees
	menggunakan FUNCTION atau PROCEDURE. #BEBAS
## Description 
	SELECT 
	  FIRST_NAME AS "nama depan", 
	  LAST_NAME as "nama belakang", 
	  SALARY as "gaji",
	  SALARY * 3 as "bonus"
	FROM EMPLOYEES;
	
## Solution 
	* FUNCTION in SQL : 
		SELECT 
			FIRST_NAME AS "nama depan", 
			LAST_NAME as "nama belakang", 
			SALARY as "gaji", get_bonus_fun(salary) as bonus
		FROM EMPLOYEES;

	* Function Script : 
		-- create function 
		CREATE OR REPLACE FUNCTION get_bonus_fun(
		  p_salary hr.employees.salary%TYPE
		) RETURN NUMBER
		IS
		  bonus number;
		BEGIN
		  bonus := p_salary * 3;
		  RETURN bonus;
		END get_bonus_fun;
  
 
 
  
## PROSES INPUT 58 RETURN D MENGGUNAKAN "SWITCH"
	* LOGIC : 
  		 ( > 80 A )
		 ( > 70 B ) 
		 ( > 60 C ) 
		 ( > 30 D ) 
		 ( <= 30 E )
		 
	* BUAT : 
		1. FUNCTION && CALL
		2. PROCEDURE && CALL

## SOLUTION 
	* PROCEDURE :
	- SCRIPT : 
		create or replace PROCEDURE get_grade_prc(
		  p_vals IN NUMBER, p_out OUT varchar2
		)
		IS
		  p_val NUMBER := p_vals;
		BEGIN 
		  case 
			when p_val > 80 then p_out := 'A';
			when p_val > 70 then p_out := 'B';
			when p_val > 60 then p_out := 'C';
			when p_val > 30 then p_out := 'D';
			when p_val <= 30 then p_out := 'E';
			 else p_out := 'Tidak ada dalam grade'; 
		  end case;
		END get_grade_prc;
		/
		
		-- CALL PROCEDURE 
		set serveroutput on;
		declare 
		v_data varchar2(100);
		begin 
		  get_grade_prc(66, v_data);
		  DBMS_OUTPUT.PUT_LINE('RESULT : ' || v_data);
		end;
		/

## TUGAS Buat Function 
	* lOGIC : dari 1 2 3 4 5 => 1 3 6 10 15 
	
## Solution
	* Script : 
		create or replace function get_rs(
		  p_number number
		) return number is
		v_temp number := 0;
		begin
		  for i in 1..p_number loop
			v_temp := v_temp + i;
		  end loop;
		  return v_temp;
		end;
		/
		set serveroutput on;
		execute dbms_output.put_line(get_rs(5));

## %ROWTYPE 
	set serveroutput on;
	DECLARE
	  v_data hr.employees%ROWTYPE;
	BEGIN
	  select * into v_data from employees 
						  where employee_id = 103;
	  dbms_output.put_line('full name : ' || v_data.first_name 
									  || ' ' || v_data.last_name);
	END;
	/