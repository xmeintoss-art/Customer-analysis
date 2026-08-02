# Customer Shopping Behavior Analysis

An end-to-end retail analytics project analyzing customer shopping behavior using **Python**, **SQL Server**, and **Power BI** — covering data cleaning, feature engineering, SQL-based business analysis, and an interactive 5-page dashboard.

## 🛠️ Tools Used

`Python (pandas)` · `SQL Server` · `SQLAlchemy` · `Power BI` · `DAX` · `Power Query`

## 📊 Dashboard Preview

The Power BI dashboard includes 5 pages: **Overview**, **Demographics**, **Products & Category**, **Purchase Behavior**, and **Discounts & Promotions**.

Key metrics: 3,900 customers | $233.08K total revenue | $59.76 avg purchase | 3.75 avg rating | 97.87% repeat customer rate

## 🗂️ Dataset

- 3,900 rows × 18 columns
- Fields: Customer ID, Age, Gender, Item Purchased, Category, Purchase Amount, Location, Size, Color, Season, Review Rating, Subscription Status, Shipping Type, Discount Applied, Promo Code Used, Previous Purchases, Payment Method, Frequency of Purchases

## 🧹 Data Cleaning & Feature Engineering (Python / pandas)

- Imputed missing `Review Rating` values using category-wise median
- Standardized column names (lowercase, snake_case) and renamed ambiguous fields
- Engineered `age_group` (Young Adult / Adult / Middle-aged / Senior) via quartile binning on age
- Engineered `purchase_frequency_days` by mapping purchase frequency labels (Weekly, Monthly, Quarterly, etc.) to numeric day intervals
- Dropped redundant `promo_code_used` column
- Loaded the cleaned DataFrame into SQL Server using SQLAlchemy + pyodbc

## 🗃️ SQL Analysis

10 business questions answered with SQL, including:
1. Total revenue by gender
2. Customers who spent above average despite receiving a discount
3. Top 5 products by average review rating
4. Standard vs Express shipping — average purchase amount comparison
5. Subscribed vs non-subscribed customer spending comparison
6. Top 5 products by discount usage rate
7. Customer segmentation: New / Returning / Loyal (based on previous purchases)
8. Top 3 products per category (using `ROW_NUMBER()` window function)
9. Relationship between repeat purchases and subscription status
10. Revenue contribution by age group

Full queries: [`customer_project_sql.sql`]([./customer_project_sql.sql])

## 📈 Power BI Dashboard

| Page | Key Insights |
|---|---|
| **Overview** | Gender split (68% M / 32% F), category revenue (Clothing 44.7%), seasonal customer trends |
| **Demographics** | Avg age 44, 27% subscribed, gender vs category preference, location-wise counts |
| **Products** | 25 unique items, size/color distribution, top 10 items by purchase count |
| **Purchase Behavior** | 97.87% repeat customers, payment method split, shipping type vs category |
| **Discounts & Promotions** | 42.65% of revenue from discounted orders, promo usage by season |


## 📁 Files

- `customer_shopping_behavior.csv` — raw dataset
- `customerbehaviour.ipynb` — data cleaning & feature engineering notebook
- `customer_project_sql.sql` — SQL analysis queries
- Dashboard screenshots
<img width="1236" height="738" alt="Overview" src="https://github.com/user-attachments/assets/a7fcfd7e-c593-4894-88d3-34c1384a3ec8" />
<img width="1301" height="732" alt="Demographic" src="https://github.com/user-attachments/assets/9390cd2d-a806-46d8-adab-8235ff01312d" />
<img width="1302" height="736" alt="Products and Category" src="https://github.com/user-attachments/assets/0c223a50-2fcd-4d21-bec0-8ca9fd4c42de" />



## How to Run

### Prerequisites
Make sure you have the following installed:
- Python 3.8+
- SQL Server (with SQL Server Management Studio or any SQL client)
- Power BI Desktop (free) — to open the `.pbix` file

---

### Step 1: Clone the Repository
```bash
git clone https://github.com/OMACP/Customer_Behaviour_Analysis-.git
cd Customer_Behaviour_Analysis-
```

---

### Step 2: Install Python Dependencies
```bash
pip install pandas numpy sqlalchemy pyodbc
```

---

### Step 3: Run the Python Cleaning Script
Open and run `customerbehaviour.ipynb` in VS Code or Jupyter Notebook:
```bash
jupyter notebook customerbehaviour.ipynb
```
This notebook:
- Loads the raw `customer_shopping_behavior.csv` (3,900 records, 18 attributes)
- Handles missing values via category-wise median imputation
- Engineers new features (age group via quartile binning, purchase frequency)
- Outputs a cleaned dataset ready for SQL loading

> Note: Update the file path inside the notebook if your CSV is stored
> in a different location on your machine.

---

### Step 4: Set Up SQL Server Database
1. Open SQL Server Management Studio (SSMS) or your preferred SQL client
2. Create a new database:
```sql
CREATE DATABASE customer_behavior;
USE customer_behavior;
```
3. Import the cleaned CSV into a table named `customer`:
   - Right-click database → Tasks → Import Flat File
   - Browse to your cleaned CSV → follow the prompts
   - Name the table `customer`

---

### Step 5: Run the SQL Analysis Queries
Open `customer_project_sql.sql` in your SQL client and run the queries.

The script covers 10 business insight queries:
1. Total revenue by gender
2. Discounted customers spending above average
3. Top 5 products by average review rating
4. Average purchase amount by shipping type (Standard vs Express)
5. Subscribed vs non-subscribed customer spending comparison
6. Top 5 products by discount rate
7. Customer segmentation — New / Returning / Loyal (CTE + CASE)
8. Top 3 products per category (ROW_NUMBER + PARTITION BY)
9. Repeat buyers vs subscription status
10. Revenue contribution by age group

---

### Step 6: Open the Power BI Dashboard
1. Download and install [Power BI Desktop](https://powerbi.microsoft.com/desktop)
2. Open `Customer_behaviorial_analysis.pbix` directly in Power BI Desktop
3. If prompted to refresh data, update the data source path to point
   to your local cleaned CSV file:
   - Home → Transform Data → Data Source Settings → Change Source

The dashboard contains 5 pages:
- Overview
- Demographics
- Products
- Purchase Behavior
- Discounts & Promotions

---

### Key Findings
- **$233K total revenue** across 3,900 customers
- **97.87% repeat customer rate** across all segments
- **Clothing drove 44.7% of revenue** despite only 32% female customers
- **42.65% of revenue came from discounted orders** — highlighting
  heavy discount dependency across the customer base
