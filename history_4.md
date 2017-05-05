# %ROWTYPE

## Tugas 1 : 
	* buat table employees definition dengan nama "retired_emps"
	- field : 
		* employee_id
		* job_id
		* hire_date
		* salary
		* department_id
		
	- buat procedure "history_emps_prc" 
		dengan input paramter no_emp_id, example := 100
	- ambil data "employees" berdasarkan no_emp_id
	- Insert ke table "retired_emps"
	
## jawab 2 : 
	drop table retired_emps;
	create table retired_emps as select * from employees where 1 =0 ;

	DECLARE
	  v_employee_number NUMBER := 100;
	  v_emp_rec hr.employees%ROWTYPE;
	BEGIN 
	  select * into v_emp_rec from employees where employee_id = v_employee_number;
	  insert into retired_emps (employee_id, job_id, hire_date, salary, department_id)
		values
		(v_emp_rec.employee_id, v_emp_rec.job_id, v_emp_rec.hire_date, v_emp_rec.salary, v_emp_rec.department_id );
	END;
	/
	
## Tugas 2 :
	custome definition procedure "history_emps_prc" 
	dengan proses insert menggunakan %ROWTYPE variable.
  
## Tugas 3 : 
	custome definition procedure "history_emps_prc" dengan proses update 
	* update field "hire_date" dibuat dengan tanggal sekarang.
	* contoh :
		* Select = source.
		* source : 
			employee_id first_name hire_date 		salary
				1			aldi	21-Jun-2016			5000
		* target : 
			employee_id first_name hire_date 	salary 
				1 			aldi	5-Mei-2017	8000