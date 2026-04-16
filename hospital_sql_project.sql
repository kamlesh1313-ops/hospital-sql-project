-- Hospital Data Analysis Project
-- Author: Kamlesh Mhaske

-- 1. Total Number of Patients
SELECT SUM(patients_count) AS total_patients
FROM hospital_data;

-- 2. Average Number of Doctors per Hospital
SELECT AVG(doctors_count) AS avg_doctors_per_hospital
FROM hospital_data;

-- 3. Top 3 Departments with the Highest Number of Patients
SELECT department, SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY department
ORDER BY total_patients DESC
LIMIT 3;

-- 4. Hospital with the Maximum Medical Expenses
SELECT hospital_name, medical_expenses
FROM hospital_data
ORDER BY medical_expenses DESC
LIMIT 1;

-- 5. Daily Average Medical Expenses
SELECT 
    hospital_name,
    medical_expenses,
    admission_date,
    discharge_date,
    (medical_expenses / (discharge_date - admission_date)) AS avg_expenses_per_day
FROM hospital_data;

-- 6. Longest Hospital Stay
SELECT 
    hospital_name,
    department,
    (discharge_date - admission_date) AS stay_length
FROM hospital_data
ORDER BY stay_length DESC
LIMIT 1;

-- 7. Total Patients Treated Per City
SELECT location AS city, SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY location
ORDER BY total_patients DESC;

-- 8. Average Length of Stay Per Department
SELECT department, AVG(discharge_date - admission_date) AS avg_stay_length
FROM hospital_data
GROUP BY department
ORDER BY avg_stay_length DESC;

-- 9. Department with the Lowest Number of Patients
SELECT department, SUM(patients_count) AS total_patients
FROM hospital_data
GROUP BY department
ORDER BY total_patients ASC
LIMIT 1;

-- 10. Monthly Medical Expenses Report
SELECT 
    DATE_TRUNC('month', admission_date) AS month,
    SUM(medical_expenses) AS total_expenses
FROM hospital_data
GROUP BY month
ORDER BY month;
