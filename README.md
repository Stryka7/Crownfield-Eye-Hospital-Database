# Crownfield Eye Hospital Database

## 1. Project Overview

The Crownfield Eye Hospital Database is a relational database management system developed using MySQL/MariaDB. It is designed to manage hospital information, including patients, clinicians, clinics, appointments, diagnoses, medicines, prescriptions and follow-up plans.

The database aims to improve data organisation, maintain data integrity and support efficient hospital operations.

## 2. Database Tables

The database consists of 10 tables:

1. Patients
2. Clinicians
3. Clinics
4. Appointments
5. Diagnoses
6. Medicines
7. Prescriptions
8. PrescriptionMedicines
9. FollowUpPlans
10. AppointmentStatusAudit

## 3. Database Relationships

The database uses primary keys and foreign keys to establish relationships between related tables.

The main relationships include:

- Patients to Appointments (one-to-many).
- Clinicians to Appointments (one-to-many).
- Clinics to Appointments (one-to-many).
- Appointments to Diagnoses (one-to-many).
- Appointments to Prescriptions (one-to-many).
- Appointments to FollowUpPlans (one-to-many).
- Prescriptions to PrescriptionMedicines (one-to-many).
- Medicines to PrescriptionMedicines (one-to-many).

The AppointmentStatusAudit table records changes to appointment statuses.

## 4. SQL Features Implemented

The project demonstrates six important SQL features:

- Aggregate queries using GROUP BY and HAVING.
- INNER JOIN across multiple tables.
- LEFT JOIN to identify patients without appointments.
- Subqueries to retrieve records based on conditions.
- Stored procedures using input parameters.
- Triggers to automatically record appointment status changes.

## 5. Security and Data Protection

Database security is demonstrated through role-based access control for:

- Administrator
- Doctor
- Receptionist
- Patient

The project also demonstrates SHA2-256 hashing and database transaction management.

## 6. Transaction Management

Transactions are demonstrated using START TRANSACTION, ROLLBACK and COMMIT concepts to illustrate how database changes can be controlled.

## 7. Repository Contents

| File | Description |
|---|---|
| 01_schema.sql | Database table creation and relationships |
| 02_individual_queries_sql.sql | SQL queries and joins |
| 03_procedure_and_trigger.sql | Stored procedure and trigger |
| 04_security_and_transaction.sql | Security and transaction demonstrations |
| README.md | Project documentation |
| Crownfield_Eye_Hospital_ERD.png | Entity Relationship Diagram |

## 8. Technologies Used

- MySQL Workbench 8.0
- MariaDB 10.4.32
- XAMPP
- SQL
- GitHub

## 9. How to Use

1. Install and configure MySQL/MariaDB.
2. Create a database named `crownfieldeyehospital`.
3. Open the SQL scripts in MySQL Workbench.
4. Run the schema script first on a fresh database.
5. Run the remaining scripts in the appropriate order.
6. Review the queries, stored procedure, trigger and security demonstrations.

**Important:** The schema script is intended for a fresh database. Do not run it directly against an existing database containing these tables.

## 10. Conclusion

This project demonstrates the design and implementation of a relational hospital database using SQL. It applies database relationships, querying techniques, stored procedures, triggers and security concepts to a practical healthcare scenario
