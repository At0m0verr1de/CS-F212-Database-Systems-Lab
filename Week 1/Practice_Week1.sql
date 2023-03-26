-- “What is the highest item number?”
select max(item) as item
from shop;

-- Find the number, dealer, and price of the most expensive article.
select number, dealer, price
from shop
where price=(select max(price) from shop);

-- Find the highest price per article.
select article, max(price)
from shop
group by artile;

-- IMPORTANT
-- For each article, find the dealer or dealers with the most expensive price.
select article, dealer, max(price)
from shop s1
where price=(   select max(s2.price) 
                from shop s2 
                where s1.article = s2.article
            )
group by article;

-- UNIQUE is the candidate key constraint

-- Assigning names to constraints. Naming constraint helps in altering or dropping that constraint at a later time.
-- CONSTRAINT PK_REGISTERED PRIMARY KEY(COURSENO, IDNO)

-- ON UPDATE <ACTION>
-- ON DELETE <ACTION>
-- set null, set default, cascade, no action (default), restrict (same as no action but the action cannot be deferred)

-- copying tables
-- 1. Copy the schema
create table temp like shop;
-- 2. Copy the data
insert into temp
select * from shop;

-- OR, using the keyword AS

create table temp2 AS select * from shop;

-- INDEX Constraint -> Create and retireve data from the database very quickly.
