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

JAWAB : 
