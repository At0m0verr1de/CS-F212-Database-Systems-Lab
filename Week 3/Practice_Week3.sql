-- group_concat: Returns a concatenated string

-- Find out the average of credits from course table in university database.
select average(credits) from course;

-- Find out the maximum and minimum value for credits from course table in university database.
select min(course.credits), max(course.credits) from university.course;

-- Find out the number of courses in the course table in university database.
select count(course.course_id) from university.course 

-- Count number of different departments and number of total courses in the course table.
select count(distinct course.dept_name), count(course.course_id) from university.course;

-- Find out the average course credits and number of courses for each department in course table.
select avg(course.credits), count(*)
from course
group by dept_name;

-- Find number of courses and average credits for all course in Math department from course table.
select avg(course.credits), count(*)
from course
where dept_name="math"
group by dept_name;

-- Find out the average course credits and number of courses for each department having average course credits 
-- more than or equal to 3.5 in course table and sort them by name of department
select dept_name, avg(course.credits), count(course.course_id)
from university.course
group by dept_name
having avg(course.credits >= 3.5) 
order by dept_name;

-- To retrieve all customers whose last name matches the first name of another customer.
select * from customers c1
inner join customers c2
on c1.last_name = c2.first_name;


-- function_name (DISTINCT | ALL expression)
-- count , sum , average , min , max , groutp_concat()
-- distinct , where > group by > having , order by 


-- JOIN

-- SELF JOIN (ex inner join customer b on a.last_name = b.first_name;)(left join)(right join)

-- CROSS JOIN or cartesian join

-- NATURAL JOIN - A natural join is a type of join operation that creates an implicit join by combining tables based on columns 
-- with the same name and data type. It is like the INNER or LEFT JOIN, 
-- but we cannot use the ON or USING clause with natural join as we used in them.
--A. There is no need to specify the column names to join.
--B. The resultant table always contains unique columns.
--C. It is possible to perform a natural join on more than two tables.
--D. Do not use the ON clause.

-- UNION
-- UNION ALL - DOESNT REMOVE DUPLICATES
--A. The order and number of the columns must be the same in all tables.
--B. The data type must be compatible with the corresponding positions of each select query.
--C. The column name in the SELECT queries should be in the same order.
/*
SELECT column_name(s) FROM table_name1
UNION
SELECT column_name(s) FROM table_name2;
*/

/*
a LEFT JOIN b USING (c1, c2, c3)
a LEFT JOIN b ON a.c1 = b.c1 AND a.c2 = b.c2 AND a.c3 = b.c3
*/

/*
With respect to determining which rows satisfy the join condition, 
both joins are semantically identical.

With respect to determining which columns to display for SELECT * expansion, 
the two joins are not semantically identical. 

The USING join selects the coalesced value of corresponding columns, 
whereas the ON join selects all columns from all tables.

For the USING join, SELECT * selects these values:
   COALESCE(a.c1, b.c1), COALESCE(a.c2, b.c2), COALESCE(a.c3, b.c3)

For the ON join, SELECT * selects these values:
   a.c1, a.c2, a.c3, b.c1, b.c2, b.c3

With an inner join, COALESCE(a.c1, b.c1) is the same as either a.c1 or b.c1 because both columns have the same value. 
With an outer join (such as LEFT JOIN), one of the two columns can be NULL. That column is omitted from the result.
*/

