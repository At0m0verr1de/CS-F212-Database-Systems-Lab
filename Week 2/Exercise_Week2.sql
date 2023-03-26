
/* 
1. Suppose you are given a relation grade_points(grade, points) that provides a conversion 
    from letter grades in the takes relation to numeric scores; for example, an “A” grade could 
    be specified to correspond to 4 points, an “A−” to 3.7 points, a “B+” to 3.3 points, 
    a “B” to 3 points, and so on. The grade points earned by a student for a course offering
    (section) is defined as the number of credits for the course multiplied by the numeric points 
    for the grade that the student received. Given the preceding relation, and our university 
    schema, write each of the following queries in SQL. You may assume for simplicity that no 
    takes tuple has the null value for grade.
    
    a. Find the total grade points earned by the student with ID '12345', across all courses taken by the student.
 
    b. Find the grade point average (GPA) for the above student, that is, the total grade points divided by the total credits
        for the associated courses.

    c. Find the ID and the grade-point average of each student.

    d. Now reconsider your answers to the earlier parts of this exercise under the assumption

*/
select sum() from 

/*
2. Write the following queries using the university schema
    a. Find the ID and name of each student who has taken at least one Comp. Sci. course; make
        sure there are no duplicate names in the result.

    b. Find the ID and name of each student who has not taken any course offered before 2017.

    c. For each department, find the maximum salary of instructors in that department. You
        may assume that every department has at least one instructor.

    d. Find the lowest, across all departments, of the per-department maximum salary
        computed by the preceding query.
*/

/*
3. Write the following queries using the university schema
    a. Create a new course “CS-001”, titled “Weekly Seminar”, with 0 credits.
    
    b. Create a section of this course in Fall 2017, with sec id of 1, and with the location of this
        section not yet specified.
    
    c. Enroll every student in the Comp. Sci. department in the above section.
    
    d. Delete enrollments in the above section where the student’s ID is 12345.
    
    e. Delete the course CS-001. What will happen if you run this delete statement without first
        deleting offerings (sections) of this course?
    
    f. Delete all takes tuples corresponding to any section of any course with the word
        “advanced” as a part of the title; ignore case when matching the word with the title.
*/

insert into course values ("CS-001", "Weekly Seminar", "Comp. Sci.", 0);

insert into section("CS-001", 1, "Fall", 2017, null, null, null);