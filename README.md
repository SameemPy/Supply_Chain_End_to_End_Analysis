# 📦 Supply Chain Logistics & Fulfillment Analytics

## 📋 Project Overview
An end-to-end data analytics project simulating a complete supply chain pipeline. This project analyzes operational bottlenecks, multi-carrier transit efficiency, inventory health, and supplier defect rates using **PostgreSQL** for backend data modeling and **Power BI** for interactive front-end visualization.

---

## 🛠️ Tech Stack & Tools
* **Database & Querying:** PostgreSQL (Relational schema design, CTEs, multi-table joins, subqueries)[cite: 5, 6].
* **Data Visualization & BI:** Power BI, DAX Measures, Custom Theme Styling[cite: 4, 7].
* **Core Metrics Tracked:** Defect Rate (%), Average Transit Times (Days), Order Fulfillments, and Shipping Carrier Performance.

---

## 🗄️ 1. Database Schema & SQL Analysis (PostgreSQL)
Three relational tables (`Inventory_Data`, `Logistics_Data`, `Supplier_Data`) were constructed to model warehouse stock and carrier flows[cite: 5]. Complex queries were written to isolate critical supply chain constraints[cite: 5, 6]:
* **Identifying Low Stock vs. Slow Manufacturers:** Using multi-table joins to cross-reference stock levels against supplier lead times[cite: 5].
* **High-Defect Supplier Tracking:** Utilizing aggregate functions and subqueries to isolate high-defect vendors handling fast-moving inventory[cite: 6].
* **Inventory Shortage Bottlenecks:** Employing **Common Table Expressions (CTEs / `WITH` clauses)** to map logistics routes (Rail, Sea, Air, Road) handling critical stock shortages[cite: 6].

<img width="990" height="704" alt="SQL SS1" src="https://github.com/user-attachments/assets/3770fe70-2da3-4828-9ace-46663c90ffd2" />
<img width="929" height="655" alt="SQL SS2" src="https://github.com/user-attachments/assets/534f5909-62d8-4814-b710-e0ce13f16c8f" />
<img width="798" height="647" alt="SQL SS3" src="https://github.com/user-attachments/assets/b36d47f3-b483-4382-815e-d995a7ca2fa5" />

---

## 📊 2. Power BI Dashboard
The interactive Power BI dashboard features dynamic KPI cards and multi-variable slicers (`Product_Type`, `Supplier_Name`, `Shipping_Carriers`)[cite: 7].

### 📸 Dashboard Preview
<img width="1130" height="641" alt="BI Dashboard ScreenShot" src="https://github.com/user-attachments/assets/a7f697a1-f404-4aee-85b0-d8a2c9b9591a" />


* **Key Performance Indicators (KPIs):** Displays real-time calculations for overall **Defect Rates (1.92%)** and **Average Transit Times (7 Days)**[cite: 7].
* **Visual Breakdown:** Evaluates carrier distribution and transportation mode timelines to highlight fulfillment delays[cite: 7].

---

## 🚀 Key Business Insights
* **Carrier Efficiency:** Isolated transit delays across different carriers to identify optimization paths[cite: 7].
* **Supplier Risk:** Highlighted discrepancies between manufacturing lead times and stock order quantities[cite: 5].
