# EcoMarket Riwi S.A.S. - Relational Database System

## Project Description
This project focuses on the modernization of the data infrastructure for **EcoMarket Riwi S.A.S.**, a commercial distributor of fresh foods across various national cities. The historical operation relied heavily on a flat, unnormalized Excel spreadsheet, resulting in data redundancies, name inconsistencies, missing fields, and unreliable inventory tallies. 

This repository implements a highly structured, enterprise-grade relational database design developed up to the **Third Normal Form (3FN)**. It features absolute data integrity, performance metrics tracking, and relational consistency using strict SQL rules.

---

## Technologies & Database Engine
* **Database Engine:** PostgreSQL 16+
* **Modeling Tools:** pgAdmin 4 / dbdiagram.io
* **Query Language:** ANSI SQL-92 (DDL, DML)

---

## Normalization Process
The migration strategy successfully decoupled operational transactions from master metrics through three structured phases:

1. **First Normal Form (1FN):** Removed duplicate entries, forced cell data atomicity, and established `eco_order_id` as the primary key for transactional evaluation.
2. **Second Normal Form (2FN):** Eliminated partial functional dependencies. Isolated master catalogs such as Customers (`eco_client`), Cities (`eco_cities`), Products (`eco_products`), and Logistic Hubs (`eco_distribution_centers`) away from the order registry sheet.
3. **Third Normal Form (3FN):** Dissolved transitive attributes. Categories were fully extracted into an independent dictionary entity (`eco_categories`), mapping products via explicit constraint keys.

---

## Database Schema (Physical Model)
Every single table uses the specialized assignment rules dictated by the core project blueprint:
* **Language Format:** English fields and structural identifiers.
* **Table Descriptors:** Prefixed with `eco_` to avoid domain cluttering.

### Relational Tables Included:
* `eco_cities`: Master ledger of approved distribution destinations.
* `eco_categories`: Domain taxonomy dictionary for structural inventory.
* `eco_client`: Corporate master catalog of active fresh food buyers.
* `eco_distribution_centers`: Strategic operational warehousing entities.
* `eco_products`: Validated matrix of items featuring pricing constraints and active inventory stock.
* `eco_orders`: Main core transactional table utilizing foreign key relationships.

---

## Database Creation Instructions

Follow these chronological setup execution rules inside your PostgreSQL terminal or query tool:

## Data Loading Instructions

To execute data verification and confirm transactional flow compatibility without foreign key conflicts, you must load datasets sequentially using the relational blueprint order:

1. Open the file named `data_loading.sql`.
2. Execute the Master tables blocks first (`eco_cities`, `eco_categories`, `eco_client`, `eco_distribution_centers`).
3. Execute the dependent Catalog entities (`eco_products`).
4. Finally, process the core history block records (`eco_orders`).

---

## SQL Query Explanation
The analysis framework includes the 6 analytical business queries required by management, located in `business_queries.sql`:
* **Query 1 (Supply Chain):** Evaluates overall current product asset balances to trigger automated purchase orders.
* **Query 2 (Commercial Growth):** Totals historic transactional logs aggregated by market cities to locate volume nodes.
* **Query 3 (Financial Revenue):** Joins items against multi-tier categories to list overall gross sales totals.
* **Query 4 (Logistics Safety):** Triggers proactive restock signals by monitoring bottom-tier inventory availability.
* **Query 5 (CRM Dashboard):** Triggers grouping counts over orders to output top-tier purchasing customers.
* **Query 6 (Executive Summary):** Evaluates asset liquidity values resting across separate distribution center hubs.

![alt text](image-2.png)