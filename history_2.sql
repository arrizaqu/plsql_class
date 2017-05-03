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