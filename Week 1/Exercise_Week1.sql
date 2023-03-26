/*
1. Write the following queries in SQL, using the university schema.
    a. Find the titles of courses in the Comp. Sci. department that have 3 credits.
    b. Find the IDs of all students who were taught by an instructor named Einstein; 
    make sure there are no duplicates in the result.
    c. Find the highest salary of any instructor.
    d. Find all instructors earning the highest salary (there may be more than one with the
    same salary).
    e. Find the enrollment of each section that was offered in Fall 2017. 
    f. Find the maximum enrollment, across all sections, in Fall 2017.
*/

select * from course
where dept_name = 'Comp. Sci.' and credits = 3;

-- doubt
select unique id from teaches
where ID in (select ID from instructor where name = 'Einstein');

select max(salary) from instructor;

select ID, name from instructor
where salary=(select max(salary) from instructor);


select sec_id, count(ID) as enrollment
from takes
where semester = 'Fall' and year = 2017
group by sec_id;

-- important
select max(enrollment) from (
    select sec_id, count(ID) as enrollment
    from takes
    where semester = 'Fall' and year = 2017
    group by sec_id
) as temp;


/*
2. Write the following inserts, deletes, or updates in SQL, using the university schema. 
    a. Increase the salary of each instructor in the Comp. Sci. department by 10%.
    b. Delete all courses that have never been offered (i.e., do not occur in the section relation).
    c. Insert every student whose tot cred attribute is greater than 100 as an instructor in the same department, with a salary of $10,000.
*/
update instructor
set salary=salary*1.1;

-- doubt, how to cascade here
delete from course
where course_id not in (select distinct course_id from section);

-- doubt, gives error due to the checks, what to do?
insert into instructor
select ID, name, dept_name, 10000 from student where tot_cred>100;