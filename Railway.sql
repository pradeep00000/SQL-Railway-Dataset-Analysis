create schema railway;
select * from railway.railway;

#1. Retrieve all transactions where the ticket 
#   price is below 50.
select * from railway.railway
where Price < 50;

#2. List all unique departure stations.
select Distinct(`Departure Station`)
from railway.railway;

#3. Count the total number of transactions.
select count(*) from railway.railway;

#4. Find all transactions made using contactless payment.
select * from railway.railway
where `Payment Method` = 'Contactless';

#5. Display the transactions where the railcard type is 'Adult'.
select * from railway.railway
where Railcard = 'Adult';

#6. Retrieve all transactions for journeys between 
#   'London Paddington' and 'Reading'.
select * from railway.railway
where `Departure Station` = 'London Paddington' and 
      `Arrival Destination` = 'Reading';
      
#7. Calculate the total revenue generated from ticket sales.
select sum(Price) as Total_Revenue
from railway.railway;

#8. Find the average ticket price for each ticket type.
select `Ticket Type` , avg(Price) as Avg_Price
from railway.railway
group by `Ticket Type`;

#9. Get the count of transactions by payment method.
select `Payment Method`, count(*) as Total_Transections
from railway.railway
group by `Payment Method`;

#10. Identify journeys delayed due to 'Signal Failure'.
select * from railway.railway
where `Reason for Delay` = 'Signal Failure';

#11. Find the station pair with the highest number of journeys.
select `Departure Station`,`Arrival Destination` ,
count(*) as journey_count from railway.railway
group by `Departure Station` , `Arrival Destination`
order by journey_count desc
limit 1;

#12. Determine the percentage of journeys that were delayed.
select `Journey Status` , (count(*) * 100.0 / (select count(*)
from railway.railway)) as Delayed_Percentage
from railway.railway
where `Journey Status` = 'Delayed';

#13. Find the top 5 stations with the most departures.
select `Departure Station` , count(*) as Counts
from railway.railway
group by `Departure Station`
order by Counts Desc
limit 5;

#14. List transactions with a refund request for delayed journeys.
select *from railway.railway
where `Journey Status` = 'Delayed'
and `Refund Request` = 'Yes';
 
#15. Find the ticket class with the highest revenue.
select `Ticket Class` , Sum(Price) as Total_Revenue
from railway.railway
group by `Ticket Class`
order by Total_Revenue desc
limit 1;

#16. Identify the day with the most ticket purchases.
select `Date of Purchase`, COUNT(*) as Purchase_Count
from railway.railway
group by `Date of Purchase`
order by Purchase_Count desc
LIMIT 1;

#17. Find the railcard type contributing the least to revenue.
select Railcard, sum(Price) as Total_Revenue
from railway.railway
group by Railcard
order by Total_Revenue asc
limit 1;