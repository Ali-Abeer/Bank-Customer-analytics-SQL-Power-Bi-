CREATE DATABASE bank_analysis;
USE bank_analysis;

DROP TABLE IF EXISTS bank_customers;

CREATE TABLE bank_customers (
    customer_id INT PRIMARY KEY,
    credit_score INT,
    country VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    tenure INT,
    balance DECIMAL(15,2),
    products_number INT,
    credit_card TINYINT,
    active_member TINYINT,
    estimated_salary DECIMAL(15,2),
    churn TINYINT
);

SELECT * FROM bank_customers LIMIT 10;

SELECT SUM(Balance) AS Total_Bank_Balance
FROM bank_customers;

SELECT 
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers
FROM bank_customers;

SELECT 
    country,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers,
    ROUND(SUM(churn)*100.0/COUNT(*),2) AS churn_rate
FROM bank_customers
GROUP BY country;

SELECT 
    CASE 
        WHEN age < 30 THEN 'Young'
        WHEN age BETWEEN 30 AND 50 THEN 'Middle Age'
        ELSE 'Senior'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers
FROM bank_customers
GROUP BY age_group;

SELECT 
    active_member,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers
FROM bank_customers
GROUP BY active_member;

SELECT 
    gender,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers
FROM bank_customers
GROUP BY gender;

SELECT 
    CASE 
        WHEN balance = 0 THEN 'Zero Balance'
        WHEN balance BETWEEN 1 AND 50000 THEN 'Low Balance'
        WHEN balance BETWEEN 50001 AND 150000 THEN 'Medium Balance'
        ELSE 'High Balance'
    END AS balance_group,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers
FROM bank_customers
GROUP BY balance_group;

CREATE VIEW country_churn_view AS
SELECT 
    country,
    COUNT(*) AS total_customers,
    SUM(churn) AS churned_customers
FROM bank_customers
GROUP BY country;











