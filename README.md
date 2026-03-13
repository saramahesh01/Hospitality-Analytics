Optimizing Hospitality: Data-Driven Insights into India’s Hotel Economy
Overview

This project analyzes the Indian hospitality market using data analytics techniques to uncover insights about hotel pricing, customer satisfaction, and regional market trends.

The project demonstrates an end-to-end data analytics workflow including data collection, cleaning, exploratory data analysis (EDA), SQL analysis, and dashboard visualization.

The objective is to help hospitality stakeholders make data-driven decisions related to pricing strategies, service quality, and regional market opportunities.

Dataset

The dataset contains hotel information collected from multiple Indian cities.

Dataset Highlights

Total Hotels: 6,555

Reviews Analyzed: 11+ Million

Cities Covered: Bengaluru, New Delhi, Mumbai, Chennai, Hyderabad, Kolkata, Pune, Ahmedabad

Key Columns:

Hotel_Name

City

Price

Rating

Reviews

Rating_status

The dataset was cleaned and transformed to ensure accurate analysis and reporting.

Tools & Technologies

This project uses multiple tools commonly used by data analysts:

Python

Pandas

NumPy

Matplotlib / Seaborn

SQL Server

Data querying

Business analysis

Power BI

Dashboard creation

Interactive visualizations

Microsoft Excel

Data inspection

PowerPoint

Business presentation

GitHub

Version control and project documentation

Project Workflow
1. Data Collection

Hotel data was collected using Python web scraping techniques from online booking platforms.

2. Data Cleaning & Preparation

Using Python:

Removed duplicates

Standardized column names

Converted price and review columns to numeric values

Created a new feature Rating_status to categorize hotels based on ratings.

3. Exploratory Data Analysis (EDA)

EDA was performed in Python to understand:

Price distribution

Rating patterns

Review trends

Market differences between cities

4. SQL Data Analysis

The cleaned dataset was loaded into SQL Server where multiple business queries were performed, including:

Market share by city

Average price by city

Average rating by city

Best value hotels (high rating + low price)

Worst value hotels (high price + low rating)

Most reviewed hotels

Price segmentation (Budget / Mid-range / Luxury)

5. Data Visualization

An interactive Power BI dashboard was built to visualize key insights.

Dashboard

The Power BI report contains two main pages:

1. National Hospitality Overview

Total hotels KPI

Market distribution by city

Price segmentation

Rating health across the market

2. Tier-1 City Analysis

City-level drill-down

Price vs Rating analysis

Review volume insights

Best and worst value hotels per city

Key Insights

Some important findings from the analysis:

Top 3 cities (Bengaluru, Delhi, Mumbai) control over 50% of hotel inventory.

Around 30% of hotels have no rating, representing a significant digital engagement gap.

Some low-priced hotels maintain very high ratings, showing strong value for money.

Certain luxury hotels have high prices but low ratings, indicating service quality issues.

Business Recommendations

Based on the analysis:

Encourage hotels with no ratings to collect customer reviews to improve booking confidence.

Improve service quality in cities with lower average ratings such as Mumbai and Chennai.

Mid-range hotels should aim for the “best value” segment by maintaining high ratings with competitive pricing.

How to Run the Project
1. Clone the Repository
git clone https://github.com/yourusername/hospitality-analytics.git
2. Python Analysis

Run the Jupyter Notebook to perform:

Data cleaning

EDA

Feature engineering

3. SQL Analysis

Execute the SQL scripts in SQL Server to generate analytical queries and insights.

4. Power BI Dashboard

Open the .pbix file in Power BI Desktop to explore the interactive dashboard.

Project Structure
Hospitality-Analytics
│
├── Data
├── Python
│   └── python_code.ipynb
├── SQL
│   └── sql_queries.sql
├── PowerBI
│   └── Hospitality Analytics Dashboard.pbix
├── Reports
│   ├── Project_Report.docx
│   └── Presentation.pptx
└── README.md

Author

Sara Mahesh
Aspiring Data Analyst skilled in Python, SQL, Excel, and Power BI.
