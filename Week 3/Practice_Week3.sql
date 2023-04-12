-- groutp_concat: Returns a concatenated string

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

