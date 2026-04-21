# we are doing operations on the data table 
use `awesome chocolates`;
show tables;
desc sales;
select * from sales;
select saledate , amount, customers from sales; #truncated version
select saledate,amount,boxes,amount/boxes from sales; # we can do different operations
select saledate , amount, boxes , amount/boxes as 'Amount per box' from sales; ##how to add name? we will use as-
select * from sales
where amount>10000#how to impose in any condition like filtering in excel
order by amount desc; #orderclause
select * from sales
where geoid ='g1'
order by pid, amount desc; #where is filtering  the data and order by sorting data
select * from sales
where amount>10000 and saledate>='2022-01--01';
select saledate,amount from sales
where amount > 10000 and year(saledate)=2022
order by amount desc;
#between condition
select * from sales
where boxes >0 and boxes<=50;


select * from sales
where boxes between 0 and 50;
select * from sales;
select * from people;
select v. saledate, v.amount , v.spid, p.spid ,p.Salesperson
from sales as v
join people p on p.spid = v.spid; #join operation type of join left join

select v.saledate,v.amount,v.pid, pr.product #productname in that we are selling in this shipement
from sales v
left join products pr on pr.pid = v.pid;

select v. saledate, v.amount , v.spid, p.spid ,p.Salesperson, pr.product, p.team
from sales as v
join people p on p.spid = v.spid
join products pr on pr.pid = v.pid # multiple join
where v.amount<400
and p.team = 'delish';

select saledate , amount, boxes , weekday(saledate) as 'day of week'
from sales
where weekday(saledate) = 4;
#NOW USING MULTIPLE TABLES

select * from people
where team = 'Delish' or team = 'Yummies';
# now in clause
select * from people
where team in ('delish','yummies');
#pattern matching -- like operator
select * from people
where Salesperson like '%B%';
 select * from sales;#case operator
 
 select saledate , amount,
  case when amount<1000 then 'under 1k'
	when amount<5000 then 'under 5k'
    when amount <10000 then 'under 10k'
else'10k or more'
end as 'amount category'
from sales;
#multiple join with GROUP BY: total sales per salesperson
select p.Salesperson, sum(v.amount) as total_sales
from sales v
join people p on p.spid = v.spid
group by.Salesperson
order by total_sales desc;









 
