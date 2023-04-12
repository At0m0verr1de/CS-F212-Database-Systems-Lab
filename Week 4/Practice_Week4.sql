-- Views
create view <view-name> [(<column list)] AS <select statement>
-- example
create view st_view as 
select student.ID, student.name, student.tot_cred
from university.student
where student.tot_cred>50;

-- View is just a virtual table
-- Changes in Base Table have immediate effect in the view

-- Create a view, stu_info with ID, name, tot_cred, from student table and corresponding grade from takes table 
-- of university schema. If any student does not have any grade, then fill null.
create view stu_info as
select student.id, student.name, student.tot_cred, takes.grade
from university.student left join -- DOUBT: Left vs Right join here
university.takes
on student.id = takes.id
where student.tot_cred>30
order by student.tot_cred;

-- Restriction on Views
-- 1. If a query contains SET/Distinct/groupby/group func. then rows cannot be inserted into/updated in/ 
--      or deleted from base tables using view
-- 2. 