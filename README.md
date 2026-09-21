# Hotel Booking Analysis

## 📌 Project Overview

This project analyzes historical hotel booking data to understand booking performance, cancellation behavior, revenue exposure, customer patterns, and operational trends.

The project follows an end-to-end data analytics workflow using **Python, SQL/MySQL, and Power BI**.

The main objective is to transform raw hotel booking data into meaningful business insights and actionable recommendations for stakeholders.

---

## 🎯 Business Objectives

- Analyze overall hotel booking performance
- Measure booking cancellation rates
- Identify patterns associated with cancellations
- Analyze estimated revenue and revenue at risk
- Compare City Hotel and Resort Hotel performance
- Analyze customer types and booking channels
- Understand booking trends over time
- Analyze lead time, room types, countries, and special requests
- Develop an interactive Power BI dashboard
- Provide business insights and recommendations

---

## 📊 Dataset

The project uses the **Hotel Booking Demand Dataset** containing historical hotel reservation information.

### Dataset Summary

- Raw Records: **119,390**
- Raw Columns: **32**
- Cleaned Records: **86,635**
- Cleaned Columns: **41**

The dataset contains information about:

- Hotel
- Booking status
- Lead time
- Arrival date
- Number of guests
- Stay duration
- Market segment
- Distribution channel
- Deposit type
- Customer type
- Room type
- ADR
- Special requests
- Country
- Reservation status

---

## 🛠️ Technologies Used

| Technology | Purpose |
|---|---|
| Python | Data cleaning, feature engineering, EDA & ML |
| Pandas | Data manipulation |
| NumPy | Numerical analysis |
| Matplotlib | Visualization |
| Scikit-learn | Machine learning |
| MySQL | SQL analysis and validation |
| Power Query | Data transformation |
| Power BI | Interactive dashboard |
| DAX | KPI and measure calculations |
| GitHub | Project documentation |

---
🐍 Python Analysis

Python was used for data preparation, exploratory analysis, feature engineering, and cancellation prediction.

Data Cleaning
Handled missing values
Removed invalid records
Removed duplicate records
Handled extreme ADR values
Validated guest and stay information
Feature Engineering

Created the following analytical features:

arrival_date_month_num
arrival_date
total_nights
total_guests
lead_time_bucket
estimated_revenue
revenue_at_risk
cancellation_status
has_deposit
Revenue Calculation
Estimated Revenue = ADR × Total Nights

Revenue associated with canceled bookings was captured as:

Revenue at Risk = Estimated Revenue for Canceled Bookings
📈 Exploratory Data Analysis

EDA was performed to analyze:

Overall cancellation rate
Cancellation by market segment
Cancellation by lead-time bucket
Monthly cancellation trends
Revenue at risk by hotel
Hotel booking performance
Customer behavior
Booking channel performance
🤖 Machine Learning

Classification models were used to analyze booking cancellation behavior.

Models
Logistic Regression
Random Forest Classifier
Target Variable
is_canceled
Evaluation Metrics
Accuracy
Precision
Recall
F1 Score
ROC-AUC
Confusion Matrix

Random Forest feature importance was also analyzed to identify influential booking characteristics.

🗄️ SQL / MySQL Analysis

MySQL was used for data validation and business analysis.

SQL Activities
Database creation
Table creation
Data import
Data validation
NULL checking
Duplicate checking
Aggregations
GROUP BY
ORDER BY
CASE statements
Window functions
DENSE_RANK
Business Analysis

SQL was used to analyze:

Total bookings
Canceled bookings
Cancellation rate
Average ADR
Average lead time
Average stay duration
Estimated revenue
Revenue at risk
Hotel performance
Market segments
Customer types
Deposit types
Distribution channels
Room types
Booking countries
Special requests
Repeat vs new guests

💡 Business Insights

1. Cancellation Exposure
The overall cancellation rate is 27.69%, representing approximately 24K canceled bookings.

2. Lead-Time Pattern
Longer lead-time bookings show higher observed cancellation rates in the dashboard.
The rate increases from approximately 8% for 0–7 day bookings to approximately 37% for 90+ day bookings.

3. Hotel Performance
City Hotel has the larger booking volume and estimated revenue.
It also has the larger revenue-at-risk exposure.

4. Revenue Exposure
The dashboard shows:
34.28M estimated revenue
11.41M revenue at risk

5. Customer Mix
Transient customers represent the largest customer-type booking group.
Repeat guests represent approximately 3.63% of bookings.

6. Booking Channel
TA/TO is the dominant distribution channel by booking volume.

7. Booking Trend
The monthly booking trend reaches its highest level around August, at approximately 11K bookings.

🎯 Business Recommendations

1. Monitor Cancellation Risk
Track cancellation rate and revenue at risk as regular management KPIs.

2. Monitor Long Lead-Time Bookings
Since longer lead-time bookings show higher observed cancellation rates, consider:
Confirmation reminders
Customer communication
Cancellation monitoring
Appropriate booking policies

3. Monitor City Hotel Separately
City Hotel has higher booking volume and higher revenue exposure, so its performance should be monitored independently.

4. Review TA/TO Channel Performance
Monitor:
Booking volume
Cancellation rate
Revenue contribution
Revenue at risk

5. Improve Customer Retention
With repeat guests representing approximately 3.63% of bookings, the business can explore:
Loyalty initiatives
Repeat-booking offers
Customer engagement
Personalized promotions

6. Monitor Revenue at Risk
Revenue at risk should be monitored alongside:
Estimated revenue
ADR
Cancellation rate
Booking volume

7. Validate High-Risk Categories
High observed cancellation rates in individual categories should be investigated using booking volume and operational context before changing business policies.

📌 Recommended Management KPIs
Total Bookings
Cancellation Rate
Canceled Bookings
Estimated Revenue
Revenue at Risk
Average ADR
Average Lead Time
Average Stay Duration
Repeat Guest Rate
Bookings by Distribution Channel
Hotel-level Cancellation Rate

🏆 Project Outcome

This project delivers an end-to-end hotel booking analytics solution combining:

Python → SQL → Power BI → Business Insights

The final solution provides a cleaned analytical dataset, structured SQL analysis, machine learning analysis, and an interactive Power BI dashboard that helps stakeholders understand booking performance, cancellation exposure, revenue risk, customer behavior, and operational trends.

👨‍💻 Skills Demonstrated
Python
Pandas
NumPy
Matplotlib
Scikit-learn
Data Cleaning
Feature Engineering
Exploratory Data Analysis
SQL
MySQL
Data Validation
Business Analysis
Power Query
DAX
Power BI
Dashboard Development
Data Visualization
Business Insights
Business Recommendations
