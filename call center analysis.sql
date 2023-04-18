create database project;
use project;
create table calls (
ID CHAR(50),
cust_name char(100),
sentiment char(30),
csat_score char(10),
call_timestamp char(10),
reason char(20),
city char(50),
state char(40),
channel char(30),
response_time char(30),
call_duration_minutes int,
call_center char(50)
);
select * from calls;

-- ------------------------------------------
-- --------cleaning data---------------------
-- ------------------------------------------

SET SQL_SAFE_UPDATES = 0;
update calls set call_timestamp = str_to_date(call_timestamp, "%m/%d/%Y");
update calls set csat_score = NULL where csat_score = 0;
set sql_safe_updates = 1;
select * from calls limit 10;

-- ------------------------------------------	
-- ---------Exploring data-------------------
-- ------------------------------------------

select count(*) as rows_num from calls;
select count(*) as columns_num from information_schema.columns where table_name = "calls";
select distinct sentiment from calls;
select distinct reason from calls;
select distinct channel from calls;
select distinct response_time from calls;
select distinct call_center from calls;

select sentiment , count(*), round((count(*)/(select count(*) from calls))* 100, 1) as pct 
from calls group by 1 order by 3 desc;

select reason, count(*), round((count(*)/(select count(*) from calls)) * 100 , 1) as pct
from calls group by 1 order by 3 desc;


select channel, count(*), round((count(*)/(select count(*) from calls)) * 100, 1)as pct
from calls group by 1 order by 3 desc;

select response_time, count(*), round((count(*)/(select count(*) from calls)) * 100,1) as pct
from calls group by 1 order by 3 desc;

select call_center, count(*), round((count(*)/(select count(*) from calls)) * 100,1) as pct
from calls group by 1 order by 3 desc;

select state , count(*) from calls group by 1 order by 2 desc; 

-- Aggregations

SELECT MIN(csat_score) AS min_score, MAX(csat_score) AS max_score, ROUND(AVG(csat_score),1) AS avg_score
FROM calls WHERE csat_score != 0; 

SELECT MIN(call_timestamp) AS earliest_date, MAX(call_timestamp) AS most_recent FROM calls;

SELECT MIN(call_duration_minutes) AS min_call_duration, MAX(call_duration_minutes) AS max_call_duration, AVG(call_duration_minutes) AS avg_call_duration FROM calls;

SELECT call_center, response_time, COUNT(*) AS count
FROM calls GROUP BY 1,2 ORDER BY 1,3 DESC;

SELECT call_center, AVG(call_duration_minutes) FROM calls GROUP BY 1 ORDER BY 2 DESC;

SELECT channel, AVG(call_duration_minutes) FROM calls GROUP BY 1 ORDER BY 2 DESC;

SELECT state, COUNT(*) FROM calls GROUP BY 1 ORDER BY 2 DESC;

SELECT state, reason, COUNT(*) FROM calls GROUP BY 1,2 ORDER BY 1,2,3 DESC;

SELECT state, sentiment , COUNT(*) FROM calls GROUP BY 1,2 ORDER BY 1,3 DESC;

SELECT state, AVG(csat_score) as avg_csat_score FROM calls WHERE csat_score != 0 GROUP BY 1 ORDER BY 2 DESC;

SELECT sentiment, AVG(call_duration_minutes) FROM calls GROUP BY 1 ORDER BY 2 DESC;



