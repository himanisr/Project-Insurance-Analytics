-- Total Policy ----------------
SELECT COUNT(*) AS total_policies
FROM `policy details(policy data)`;

-- Total Custsomers ---------------
SELECT COUNT(DISTINCT `Customer Id`) AS total_customers
FROM `policy details(policy data)`;

-- Age Bucket Wise Policy Count--
SELECT
  CASE
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    WHEN Age BETWEEN 46 AND 60 THEN '46-60'
    ELSE '60+'
  END AS age_bucket,
  COUNT(*) AS policy_count
FROM `customer information(policy data)` ci
JOIN `policy details(policy data)` pd 
  ON pd.`customer Id` = ci.`customer Id`
GROUP BY age_bucket;

-- Gender Wise Policy Count-----------
SELECT ci.gender, COUNT(*) AS policy_count
FROM `policy details(policy data)` pd
JOIN `customer information(policy data)` ci ON pd.`customer Id` = ci.`customer Id`
GROUP BY ci.gender;

-- -Policy Type Wise Policy Count ------
SELECT `Policy Type`, COUNT(*) AS policy_count
FROM `policy details(policy data)`
GROUP BY `Policy Type`;

-- Policy Expire This Year
SELECT COUNT(*) AS expiring_this_year
FROM `policy details(policy data)`
WHERE YEAR(`Policy End Date`) = YEAR(CURDATE());

-- Premium Growth Rate ---
SELECT 
  CONCAT(YEAR(`Policy Start Date`)) AS year,
  Round(SUM(`Premium Amount`),2) AS total_premium
FROM `policy details(policy data)`
GROUP BY year
ORDER BY year;

-- Claim Status Wise Policy Count
SELECT `Claim Status`, COUNT(DISTINCT `Policy Id`) AS policy_count
FROM `claims(policy data)`
GROUP BY `Claim Status`;

-- Payment Status Wise Policy Count
SELECT `Payment Status`, COUNT(DISTINCT `Policy Id`) AS policy_count
FROM `payment history(policy data)`
GROUP BY `Payment Status`;

-- Total Claim Amount
SELECT
SUM(`Claim Amount`) as total_claim_amount
FROM `claims(policy data)`;

