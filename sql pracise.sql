create table hospital_name(Hospital_Name varchar(250),Location varchar(250),Department varchar(250),
Doctors_Count int,Patients_Count int,Admission_Date date,Discharge_Date date,Medical_Expenses decimal
)
copy hospital_name from 'D:\Hospital_Data (1).csv'csv header
select * from hospital_name
--1 Write an SQL query to find the total number of patients across all hospitals
select sum(patients_count)as total_no_of_patients from hospital_name
--2 Retrieve the average count of doctors available in each hospital.
select  distinct hospital_name,round(avg(doctors_count),0)as avg_no_of_doctors from hospital_name
group by 1
--3. Top 3 Departments with the Highest Number of Patients
select distinct department,patients_count from hospital_name
order by patients_count desc
limit 3
--4. Hospital with the Maximum Medical Expenses
select hospital_name,medical_expenses from hospital_name
order by medical_expenses desc
limit 1
--5 Calculate the average medical expenses per day for each hospital.
select distinct hospital_name,round(avg(medical_expenses),2)as avg_expense_perday from hospital_name
group by 1
--6.Find the patient with the longest stay by calculating the difference between
--Discharge Date and Admission Date
select hospital_name,department,
discharge_date-admission_date as no_of_days_patient from hospital_name
order by no_of_days_patient desc limit 1
--7.Count the total number of patients treated in each city
select distinct location,sum(patients_count)as total_no_of_patients from hospital_name
group by 1
--8.Calculate the average number of days patients spend in each department
select distinct department,round(avg(discharge_date-admission_date),0)as avg_no_of_days_stay from hospital_name
group by 1
--9 Find the department with the least number of patients.
select department,patients_count from hospital_name
order by patients_count limit 1
--10.Group the data by month and calculate the total medical expenses for each month.
SELECT 
    DATE_TRUNC('month', admission_date) AS month,
    SUM(medical_expenses) AS total_medical_expenses
FROM hospital_name
GROUP BY DATE_TRUNC('month', admission_date)
ORDER BY month


