--- creating ocd_table

CREATE TABLE ocd_table (
    Patient_ID INT,
    Age INT, 
    Gender VARCHAR(45),
    Ethnicity VARCHAR(45),
    Marital_Status VARCHAR(45), 
    Education_Level VARCHAR(45), 
    OCD_Diagnosis_Date DATE, 
    Duration_of_Symptoms_per_month INT, 
    Previous_Diagnoses VARCHAR(65), 
    Family_History_of_OCD VARCHAR(65), 
    Obsession_Type VARCHAR(65), 
    Compulsion_Type VARCHAR(75), 
    Y_BOCS_Score_Obsessions INT, 
    Y_BOCS_Score_Compulsions INT, 
    Depression_Diagnosis VARCHAR(65), 
    Anxiety_Diagnosis VARCHAR(45), 
    Medications VARCHAR(100)   
);

SELECT * 
FROM ocd_table;

--- referencing the table
CREATE TABLE ocd_table1 (LIKE ocd_table INCLUDING ALL);

--inserting data into ocd_table1
INSERT INTO ocd_table1
SELECT * FROM ocd_table;

----cleaning ocd_table
SELECT * FROM ocd_table;

CREATE TABLE cleaned_ocd_table AS
WITH cleaned_table AS(
SELECT DISTINCT patient_ID,
	age,
	TRIM(gender) AS gender,
	TRIM(Ethnicity) as Ethnicity,
	Trim(Marital_status) AS Marital_status,
	Trim(education_level) AS education_level ,
	ocd_diagnosis_date,
	duration_of_symptoms_per_month,
	previous_diagnoses,
	family_history_of_ocd,
	Trim(obsession_type) AS obsession_type,
	TRIM(compulsion_type) AS compulsion_type,
	Y_BOCS_score_obsessions,
	Y_BOCS_score_compulsions,
	depression_diagnosis,
	anxiety_diagnosis,
	medications
	FROM ocd_table),
	Ranked AS(
	SELECT *,
	ROW_NUMBER() OVER(
	PARTITION BY  	age, gender, Ethnicity, Marital_status, education_level, ocd_diagnosis_date, 
					duration_of_symptoms_per_month, previous_diagnoses, family_history_of_ocd,
					obsession_type, compulsion_type, Y_BOCS_score_obsessions, Y_BOCS_score_compulsions,
					depression_diagnosis, anxiety_diagnosis, medications
					ORDER BY patient_ID
					) AS row_num
	FROM cleaned_table
	)
	SELECT *
	FROM ranked
	WHERE row_num = 1;

 SELECT * FROM cleaned_ocd_table;

 SELECT DISTINCT Ethnicity
 FROM cleaned_ocd_table;

SELECT DISTINCT Education_level
 FROM cleaned_ocd_table;
 
SELECT DISTINCT compulsion_type
 FROM cleaned_ocd_table;	

---1. Count M & F with obsessions ---avg score

SELECT gender,
	COUNT (patient_id)as patient_count,
	ROUND(AVG(y_bocs_score_obsessions),2) avg_score_obsessions
FROM cleaned_ocd_table
GROUP BY gender
ORDER BY patient_count;

---2. Per percentage M vs F with obsession ocd
Create TABLE gender_percentage AS
with data as(
SELECT gender,
	COUNT (patient_id) as patient_count,
	ROUND(AVG(y_bocs_score_obsessions), 2) as avg_score_obsessions
FROM cleaned_ocd_table
GROUP BY 1
ORDER BY 2
)
SELECT
	ROUND((SUM(CASE WHEN Gender = 'Female' THEN patient_count ELSE 0 END) *100)/
						SUM(patient_count),2) AS pct_female,
	ROUND((SUM(CASE WHEN Gender = 'Male' THEN patient_count ELSE 0 END) * 100)/
						SUM(patient_count),2) AS pct_male
FROM data;
SELECT * FROM gender_percentage;

---3. Count of patient and avg obsession score by ethnicity 
SELECT Ethnicity,
		COUNT(patient_id),
		ROUND(AVG(y_bocs_score_obsessions),2) AS avg_obs
FROM cleaned_ocd_table
GROUP BY 1
ORDER BY 2

---4. Number of people diagnonised ocd Month
SELECT 
	DATE_TRUNC( 'month', ocd_diagnosis_date) AS months,
	COUNT(patient_id) AS patient_count
FROM cleaned_ocd_table
GROUP BY 1
ORDER BY 1 ASC;

----5. Most common obsession type and their obsession score
SELECT 
		obsession_type,
		COUNT(patient_id) AS patient_count,
		ROUND(AVG(y_bocs_score_obsessions),2) AS avg_obs
FROM cleaned_ocd_table
GROUP BY obsession_type
ORDER BY patient_count;

---6. What is the most compulsion type and their avg compulsion score
SELECT
	compulsion_type,
	COUNT(patient_id) AS patient_count,
	ROUND(AVG(y_bocs_score_compulsions),2) AS avg_cps
FROM cleaned_ocd_table
GROUP BY 1
ORDER BY 2;



	 


	
