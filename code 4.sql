-- i) which  card used for more expenditure 

select "card type", sum(amount) as total 
from credit_cards 
GROUP by "card type" 
ORDER by total desc 
limit 1;

-- ii) it just an example to show CTE(commen table expression)  

with basic as (select substr(Date,instr(Date, '-')+1,6) as month, sum(amount) as total
from credit_cards 
GROUP by substr(Date,instr(Date, '-')+5,2), month)
SELECT * from basic;

-- iii) yearlywise month wise data on each exp type

select substr(date,instr(date,'-')+1,6) as month,"exp type", sum(amount) 
FROM credit_cards 
GROUP by month,"exp type" 
order by substr(date,instr(date,'-')+6,2), substr(date,instr(date,'-')+1,3);
  
 --iv) which year which month more expenditure done
 
select month, max(amount1) 
from (select substr(date,instr(date,'-')+1,6) as month,sum(amount) as amount1 
from credit_cards 
GROUP by substr(date,instr(date,'-')+1,6));  

-- v) which type of card most of the time females used 

select "card type", max(count1) as "number of times used" 
from (select "card type", count("card type") as count1 from credit_cards where gender='F'GROUP by "card type");

 -- vi) which type of expense most of the time females do           
select "exp type", max(count1) as "number of times used" 
from (select "exp type", count("exp type") as count1 from credit_cards where gender='F'GROUP by "exp type");

-- vii) which type of heightest expense done by male
SELECT "exp type", max(cost) 
from (select "exp type", sum(amount)as cost from credit_cards where gender='M' GROUP by "exp type");

-- viii) yearly wise expense percentage

select DAT,total,round((total*100.00)/sum(total) over(),2)as percentage from(
  select substr(date,INStr(date,'-')+5,2) as dat, sum(amount) as total 
  FROM credit_cards GROUP by substr(date,INStr(date,'-')+5,2)) as subtable;
  
-- ix) which type of expenditure done in which percentage
select "exp type", total, round((total*100.0)/sum(total) over(),2) Percentage 
from (select sum(amount) as total, "exp type" from credit_cards GROUP by "exp type")as expense;

 --x) how much spend by the male on each expense using gold card
 
select "card type", "exp type", gender, amount 
from credit_cards 
where gender="M"and "card type"= "Gold" 
GROUP by "exp type";
  
--xi) average expense of male based on card type

select "card type", gender,amount, avg(amount) over() as average 
FROM credit_cards 
where gender="M" 
GROUP by "card type";

-- xii) yearwise Cummulative based on month 

select year,month,amount,sum(amount)over(partition by year order by case when month='Jan' then 1
  when month='Feb' then 2
  when month='Mar' then 3
  when month='Apr' then 4
  when month='May' then 5
  when month='Jun' then 6
  when month='Jul' then 7
  when month='Aug' then 8
  when month='Sep' then 9
  when month='Oct' then 10
  when month='Nov' then 11
  when month='Dec' then 12
  else null end) as cummulative from(
  select substr(date,instr(date,'-')+5,2) as year, substr(date,instr(date,'-')+1,3) as month, amount from credit_cards) 
  group by year,month;
  