use `supply chain data schema`;
show tables;
select * from brokerage limit 50;
select * from `customer information(policy data)` limit 50;
select * from `payment history(policy data)` limit 50;
select * from `policy details(policy data)` limit 50;
select * from opportunity limit 50;
select * from invoice limit 50;
-- Yearly Meeting Count ------------
SELECT 
  YEAR(meeting_date) AS year,
  COUNT(*) AS meeting_count
FROM meeting
GROUP BY YEAR(meeting_date);

-- No of Invoice by Account Executive --
SELECT 
  `Account Executive`,
  COUNT(*) AS invoice_count
FROM invoice
GROUP BY `Account Executive`;

-- Top 10 Open Opportunity ----
SELECT  
  opportunity_name,
  `Account Executive`,
  revenue_amount,
  stage
FROM opportunity
WHERE stage IN ('Propose Solution', 'Qualify Opportunity')
ORDER BY revenue_amount DESC
LIMIT 10;

-- No of meeting count by account executive----
SELECT 
  `Account Executive`,
  COUNT(*) AS meeting_count
FROM meeting
GROUP BY `Account Executive`;



