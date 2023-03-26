-- IMPORTANT + doubt
-- finds the actor with most films.
select first_name, last_name, count(*) films
from actor as a
join film_actor as fa using (actor_id)
group by actor_id, first_name, last_name
order by films desc
limit 1;


-- Difference in ordering first and then limiting the number of results and doing the opposite
-- first gives top (3)/ bottom (3) and the other gives first (3)/ last (3) and then orders
-- them.

-- Multiple columns in order by -> move in column by column.
-- Group by for grouping rows with same column value provided for the grouping


-- return the number of records that contain each last name.
select last_name, count(*) from actor
group by last_name;

-- Where is applied before group by, Having is applied on the group by


-- filter the result set to only those records that have a count of greater than three (i.e. HAVING COUNT(*) > 3).
select last_name, count(*) from actor
group by last_name having count(*)>3;

-- (%) -> Any number of characters
-- (-) -> Single character

-- The precedence order is NOT, AND, OR from highest to lowest.

-- Select rows from actor in which first_name start with either S or M and actor_id is >=100.
select * from sakila.actor
where first_name in ("S%", "M%") and actor_id>=100;


-- important (because I have never used)
SELECT CASE quantity
    WHEN 2000 THEN "NOT GOOD"
    WHEN 8000 THEN "AVERAGE"
    WHEN 10000 THEN "GOOD"
    ELSE "UNKNOWN"
    END AS STATUS
FROM `sakila`.`products`;

-- important (because I have never used)
-- IF(expr1,expr2,expr3) If expr1 is TRUE (expr1 <> 0 and expr1 <> NULL), IF() returns expr2. 
-- Otherwise, it returns expr3.

-- IFNULL(expr1, expr2) If expr1 is null returns expr2 otherwise expr1

-- COALESCE(value, )
-- Returns the first non-NULL value in the list, or NULL if there are no non-NULL values.
