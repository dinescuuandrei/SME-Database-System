# SME Enterprise Resource Planning (ERP) & Management System

## Project Overview
This repository contains a professional-grade relational database schema designed for a Small to Medium Enterprise (SME). The architecture is optimized for manufacturing and assembly businesses, providing a 360-degree view of operations—from Human Resources and Supply Chain to Sales and Market Intelligence.

The primary focus of this design was **data integrity** and **normalization**, ensuring that the system can scale as the business grows without data redundancy.

## Technical Architecture

### 1. Relational Integrity & Normalization
The database (firma_imm) follows 3NF (Third Normal Form) principles. It utilizes the **InnoDB** engine to support ACID compliance, ensuring that every transaction (like processing an order) is processed reliably.

### 2. Key Business Modules
* **Human Capital Management:** Uses a self-referential relationship in the `angajati` table (`sef_direct` -> `id_angajat`) to manage organizational hierarchies.
* **Inventory & Supply Chain:** Implements a strict classification of supplies using `ENUM` types to prevent data entry errors.
* **Sales Intelligence:** The `comenzi` table acts as the transactional bridge between CRM (`clienti`) and Production (`produse_finite`).
* **Competitive Analysis:** Includes a specialized module for tracking market share and competitor distribution, enabling data-driven decision-making.

### 3. Data Integrity Constraints
* **Cascading Deletes:** Implemented on critical relationships (e.g., `comenzi` linked to `clienti`) to maintain a clean database state.
* **Set Null Constraints:** Used for non-critical relations (like `sef_direct`) to ensure that removing a manager doesn't accidentally delete their entire team's records.

## Business Intelligence (Sample Queries)
The schema is designed to answer complex business questions. Below are examples of reports this database can generate:

**Top Performing Products by Sales:**
SELECT p.denumire, SUM(c.cantitate) AS total_sold
FROM produse_finite p
JOIN comenzi c ON p.id_produs = c.id_produs
GROUP BY p.id_produs
ORDER BY total_sold DESC;

**Employee Hierarchy & Cost Analysis:**
SELECT a.nume, a.functie, d.denumire, (a.salariu + a.sporuri) AS total_compensation
FROM angajati a
JOIN departamente d ON a.id_departament = d.id_departament;

## Technical Stack
* **RDBMS:** MySQL / MariaDB
* **Architecture:** Relational Schema Design
* **Integrity:** Foreign Key Constraints & Transactional Logic (InnoDB)
* **Environment:** phpMyAdmin / XAMPP

## Installation
1. Create a database named `firma_imm`.
2. Import `firma_imm.sql`.
3. The script will automatically generate all tables, relationships, and pre-populate the system with sample data for immediate testing.
