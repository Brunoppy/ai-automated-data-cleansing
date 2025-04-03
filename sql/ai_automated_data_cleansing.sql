-- AI-Driven Automated Data Cleansing SQL Project
-- Purpose: Store logs of dirty data, cleansing rules, and refined tables

CREATE DATABASE IF NOT EXISTS ai_data_cleansing;
USE ai_data_cleansing;

CREATE TABLE IF NOT EXISTS raw_data (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    source VARCHAR(255),
    data JSON,
    ingestion_timestamp DATETIME DEFAULT NOW()
);

CREATE TABLE IF NOT EXISTS cleansing_rules (
    rule_id BIGINT PRIMARY KEY AUTO_INCREMENT,
    rule_description TEXT,
    rule_sql TEXT
);

CREATE TABLE IF NOT EXISTS cleaned_data (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    original_id BIGINT,
    cleaned_data JSON,
    cleansing_timestamp DATETIME DEFAULT NOW(),
    FOREIGN KEY (original_id) REFERENCES raw_data(id)
);
