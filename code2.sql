-- i) Highest total expenditure

SELECT CITY, TOTAL
FROM (SELECT CITY, TOTAL, DENSE_RANK()OVER(ORDER BY TOTAL DESC) AS "RANK"
 FROM(select city, sum(amount) AS "TOTAL" FROM credit_cards GROUP BY CITY))
 WHERE RANK=1 ;
 
 -- ii) Lowest total expenditurecredit_cards
 
 SELECT CITY, TOTAL
FROM (SELECT  CITY, TOTAL, DENSE_RANK()OVER(ORDER BY TOTAL) AS "RANK"
 FROM(select city, sum(amount) AS "TOTAL" FROM credit_cards GROUP BY CITY))
 WHERE RANK=1 ;
 
 -- iii)  Highest average expenditure
 
 SELECT CITY, AVERAGE 
 FROM (SELECT CITY, AVERAGE, DENSE_RANK()OVER(ORDER BY AVERAGE desc) AS "RANK"
 FROM(select city, AVG(amount) AS "AVERAGE" FROM credit_cards GROUP BY CITY))
 WHERE RANK=1 ;
 
 --iv) Lowest average expenditure	
 
 SELECT CITY, AVERAGE 
 FROM (SELECT CITY, AVERAGE, DENSE_RANK()OVER(ORDER BY AVERAGE) AS "RANK"
 FROM(select city, AVG(amount) AS "AVERAGE" FROM credit_cards GROUP BY CITY))
 WHERE RANK=1 ;