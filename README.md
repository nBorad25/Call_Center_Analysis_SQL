**Call Center Analysis SQL Project**

**Overview**

This project analyzes a call center dataset using SQL to uncover insights into customer interactions, operational efficiency, and service quality. The dataset contains over 32,900 records of customer calls, including details like customer ID, name, sentiment, CSAT score, call timestamp, reason, location, channel, response time, call duration, and call center location. The SQL script (call_center_analysis.sql) performs data cleaning, exploratory data analysis (EDA), and aggregations to answer key business questions.

**Objectives**





Data Cleaning: Standardize data formats (e.g., convert call_timestamp to DATE) and handle invalid entries (e.g., set zero CSAT scores to NULL).



Exploratory Data Analysis: Examine distributions of sentiments, call reasons, channels, response times, and call centers.



Aggregations: Compute metrics like minimum, maximum, and average CSAT scores, call durations, and call counts by state, reason, and sentiment to identify trends and operational insights.

**Dataset Description**

The dataset includes the following columns:





ID: Unique call identifier (CHAR(50)).



cust_name: Customer name (CHAR(100)).



sentiment: Sentiment of the interaction (e.g., Positive, Negative, Very Positive, Very Negative) (CHAR(30)).



csat_score: Customer satisfaction score (1-10, or 0/NULL for missing) (CHAR(10)).



call_timestamp: Date of the call (initially CHAR(10), formatted as MM/DD/YYYY).



reason: Reason for the call (e.g., Billing, Service Outage, Payments) (CHAR(20)).



city: Customer's city (CHAR(50)).



state: Customer's state (CHAR(40)).



channel: Communication channel (e.g., Call-Center, Chatbot, Email, Web) (CHAR(30)).



response_time: Response time relative to SLA (e.g., Within SLA, Below SLA, Above SLA) (CHAR(30)).



call_duration_minutes: Call duration in minutes (INT).



call_center: Call center location (e.g., Los Angeles/CA, Chicago/IL) (CHAR(50)).

**Prerequisites**





Database: MySQL



Tools: MySQL Workbench or any SQL client.



Dataset: Download the Call Center CSV from the provided link and import it into the database.

**Setup Instructions**





Create Database and Table: Run the following SQL to set up the database and table:

CREATE DATABASE project;
USE project;
CREATE TABLE calls (
    ID CHAR(50),
    cust_name CHAR(100),
    sentiment CHAR(30),
    csat_score CHAR(10),
    call_timestamp CHAR(10),
    reason CHAR(20),
    city CHAR(50),
    state CHAR(40),
    channel CHAR(30),
    response_time CHAR(30),
    call_duration_minutes INT,
    call_center CHAR(50)
);



Import Data: Load the CSV file into the calls table. For MySQL, use:

LOAD DATA INFILE '/path/to/Call+Center.csv'
INTO TABLE calls
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;



Run the Analysis: Execute the provided SQL script (call_center_analysis.sql) to clean the data and perform the analysis.

**Data Cleaning**

The script includes the following cleaning steps:





Timestamp Conversion: Converts call_timestamp from MM/DD/YYYY to DATE format using:

UPDATE calls SET call_timestamp = STR_TO_DATE(call_timestamp, '%m/%d/%Y');



CSAT Score Handling: Sets csat_score values of 0 to NULL:

UPDATE calls SET csat_score = NULL WHERE csat_score = 0;

**Analysis Overview**

The script performs the following analyses:





Basic Exploration:





Counts total rows and columns.



Lists unique values for sentiment, reason, channel, response_time, and call_center.



Calculates percentage distributions for:





Sentiment (e.g., Positive: ~40%, Negative: ~20%).



Reason (e.g., Billing: ~71%, Service Outage: ~14%).



Channel (e.g., Call-Center: ~32.3%, Chatbot: ~25%).



Response Time (e.g., Within SLA: ~62%, Below SLA: ~25%).



Call Center (e.g., Los Angeles/CA: ~25%, Chicago/IL: ~25%).



Aggregations:





CSAT Scores: Computes min, max, and average CSAT scores (excluding zeros).



Call Dates: Identifies the earliest and most recent call dates.



Call Duration: Calculates min, max, and average call durations.



Call Center Performance: Analyzes response time counts and average call durations by call center.



Channel Analysis: Computes average call durations by channel.



State Analysis: Counts calls by state, reasons, and sentiments; calculates average CSAT scores by state.



Sentiment Analysis: Computes average call durations by sentiment.

**Key Insights**





Billing Dominates: ~71% of calls are billing-related, indicating a need for improved billing processes or self-service options.



SLA Performance: ~62% of calls meet SLA, but ~25% are below SLA, suggesting response time improvements are needed.



Call Duration: Channels like Call-Center have longer average durations (~25 minutes), while Chatbot calls are shorter.



Regional Trends: States like Texas and California have high call volumes, with varying sentiment and CSAT scores.



Sentiment Impact: Negative sentiment calls tend to have longer durations, indicating complex issues.

**How to Run**





Clone the repository.



Set up the database and table as described.



Import the dataset into the calls table.



Execute the SQL script (call_center_analysis.sql) in your SQL client.



Review query results to derive insights or modify queries for additional analysis.



**Source**





Dataset: https://data.world/markbradbourne/rwfd-real-world-fake-data/workspace/file?filename=Call+Center.csv
