# OCD Healthcare Data Analysis

This project explores an Obsessive-Compulsive Disorder (OCD) dataset.  
It covers the full data workflow — from raw Excel import, to SQL data cleaning and exploratory analysis, and finally to a Power BI dashboard for visualization.  

---

##  Project Structure
- **sql/**
  - `ocd_database.sql` → SQL scripts for creating tables, cleaning data, and running analysis queries.  
- **powerbi/**
  - `Ocd Report.pbix` → Power BI dashboard file.  
- **images/**
  - `Ocd Analysis.png` → Screenshot of the final Power BI dashboard.  

---

##  Workflow
1. **Data Import**  
   - Original dataset provided in Excel format.  
   - Imported into PostgreSQL database.  

2. **Data Cleaning (SQL)**  
   - Removed duplicates  
   - Standardized text values (e.g., gender, marital status)  
   - Converted data types (dates, numeric scores)  
   - Applied constraints and validation  

3. **Exploratory Analysis (SQL)**  
   - Distribution by gender and ethnicity  
   - Most common obsession and compulsion types  
   - Trends in OCD diagnosis over time  
   - Average Y-BOCS scores by groups  

4. **Data Visualization (Power BI)**  
   - Bar charts for top obsession/compulsion types  
   - Line chart for patient intake over time  
   - Donut chart for gender distribution  
   - KPI cards for total patients & average scores  



##  Dashboard Preview
![OCD Dashboard]<img width="709" height="315" alt="Ocd Analysis" src="https://github.com/user-attachments/assets/1479737f-7b81-44b5-98a4-303c7bfc1bc2" />



##  Tools Used
- **PostgreSQL** → database storage, cleaning, and analysis  
- **SQL** → queries, transformations, and metrics  
- **Power BI** → interactive dashboard and visualization  
- **Excel** → original data source  

---

## How to Use
1. Clone/download this repo.  
2. Run the SQL scripts in PostgreSQL to create and clean the dataset.  
3. Open the `.pbix` file in **Power BI Desktop** to view the dashboard.  

---

##  Author
 **Khadijah Ilyas**    


##  License
This project is open-source under the MIT License.
