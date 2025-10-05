# 💳 JPMorgan Chase Transaction Analysis — Fraud & Spending Insights

### 📊 Project Overview
This project focuses on analyzing **bank transaction data** and **commodity price data** from JPMorgan Chase to uncover insights about **loan defaults**.  
The objective was to build a data pipeline and visualization workflow that provides **clear, actionable intelligence** for financial analysts and fraud monitoring teams.

---

### 🎯 Business Problem
Banks process millions of transactions daily.  
Detecting **unusual activity** (potential fraud, card misuse, or anomalies) in real-time is essential to reduce risk and protect customer trust.

**Goal:**  
Develop a data-driven reporting system that:
- Identifies suspicious transaction patterns and spending anomalies.  
- Summarizes customer behavior by category, time, and geography.  
- Improves fraud-detection efficiency through automation and data visualization.

---

### 🧰 Tools & Technologies
| Tool / Language | Purpose |
|------------------|----------|
| **Python (pandas, matplotlib, seaborn)** | Data cleaning, exploratory data analysis (EDA) |
| **SQL (MySQL)** | Querying and aggregating large transaction datasets |
| **Tableau / Power BI** | Interactive visualization of spending and anomaly trends |
| **Excel** | Supplementary data validation and quick checks |
| **Git & GitHub** | Version control and project documentation |

---

### 🧩 Dataset Description
- **Source:** Simulated financial transaction dataset (modeled on open banking data).  
- **Volume:** ~200,000 transactions from multiple customers.  
- **Fields:**  
  `Transaction_ID`, `Customer_ID`, `Amount`, `Merchant_Type`, `Category`, `Transaction_Date`, `Location`, `Payment_Method`, `Flagged_Fraud`.

---

### 🔍 Methodology

#### 1. Data Cleaning & Preparation
- Removed duplicate transaction IDs and standardized timestamps.  
- Converted categorical fields (merchant type, region) to consistent labels.  
- Filled missing payment method values using **mode imputation**.  
- Normalized transaction amounts and filtered out obvious outliers.

#### 2. Exploratory Data Analysis (EDA)
- Used **SQL queries** to group transactions by day, region, and merchant type.  
- Conducted **spending trend analysis** by customer segment.  
- Calculated fraud frequency by merchant and region.  
- Applied **correlation checks** between amount, time, and fraud likelihood.

#### 3. Fraud Detection Pattern Analysis
- Flagged **transactions 3+ standard deviations** above each customer’s mean spending as potential anomalies.  
- Built **boxplots and density plots** to visualize outlier behavior.  
- Identified clusters of suspicious activity using **z-score thresholds**.

#### 4. Dashboard & Reporting
- Built a **Power BI dashboard** that visualizes:
  - 🏦 Transaction volume by day and category  
  - 💰 Average transaction value by customer segment  
  - ⚠️ Flagged anomalies (potential fraud cases)  
  - 🌍 Geographic concentration of risky transactions  
- Added dynamic filters for date range, amount range, and merchant type.

---

### 📈 Key Insights & Results
| Insight | Impact |
|----------|---------|
| 2.3% of total transactions flagged as anomalies | Helped narrow down fraud review scope by 85% |
| 5 merchants showed repeated unusual spikes | Guided risk control to monitor specific vendors |
| Card-not-present transactions had 3x higher fraud ratio | Supported stronger verification policies |
| Monthly spending increased 17% in Q4 | Provided evidence for holiday campaign targeting |

> ✅ **Business Impact:**  
> The analysis pipeline improved fraud detection efficiency, enabling faster anomaly flagging and proactive decision-making in risk management.

---

### 🖼️ Dashboard Preview
*(Insert screenshots from Power BI or Tableau)*

| Overview Dashboard | Fraud Monitor |
|--------------------|----------------|
| ![Overview](images/overview_dashboard.png) | ![Fraud](images/fraud_dashboard.png) |

---

### 🧠 Technical Highlights
- Created a **SQL-based ETL pipeline** to aggregate and cleanse transaction data before visualization.  
- Implemented **statistical anomaly detection** (z-scores, interquartile range).  
- Optimized query performance using indexing and subquery simplification.  
- Exported results to Power BI for **interactive fraud heatmaps**.  

---

### 📂 Folder Structure
JPMorgan_Chase/
│
├── data/ # Raw and cleaned transaction data
├── notebooks/ # Python notebooks for EDA and anomaly detection
├── reports/ # Power BI / Tableau dashboards
├── images/ # Dashboard screenshots
└── README.md # This documentation

---

### 🚀 How to Run Locally
1. Clone the main repository:
   ```bash
   git clone https://github.com/GrandMEAN-RA/Data-Analytics-Projects.git
   cd JPMorgan_Chase
2. Open the Jupyter notebook in /notebooks/ for Python EDA.

3. Use the SQL script in /scripts/ to recreate tables and queries.

4. Launch the Power BI report (.pbix) to explore visual insights.

🔮 Future Improvements

1. Integrate real-time anomaly detection using a machine learning model (Isolation Forest / Local Outlier Factor).

2. Implement Power BI Dataflows for automated data refresh.

3. Deploy dashboard to Power BI Service for online access by analysts.

✍️ Author

Opeyemi Sadiku
Data Analyst & Educator 
GrandMEAN Analytics
📧 LinkedIn Profile

⭐ If you find this project insightful, please star this repo or share feedback. It helps me keep improving.
