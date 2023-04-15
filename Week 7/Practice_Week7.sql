-- Procedure example
DELIMITER $$ 
CREATE PROCEDURE GetCustomers() 
    BEGIN
        select customer.customer_id,
            customer.first_name,
            customer.last_name
        from sakila.customer;
    END $$
DELIMITER;

-- Calling the procedure
CALL GetCustomers();


-- You can pass parameters to procedures
-- Procedure nesting is allowed
-- When the procedure is called for the first time in a session, 
--      it is compiled and stored in the cache; dont need to recompile for the same session
-- ADVANTAGES:
--      1. Stored in the database itself, so no need to search in all the code files.
--      2. Ease of execution for the user, can execute functions without knowing sql.
--      3. Reduce Network Traffic: No need to send lengthy queries repeatedly.
--      4. Centralising logic
--      5. Security: Different users can have different priveliges and authorities to execute procedures.
-- DISADVANTAGES:
--      1. If you use many procedures, memory usage of each connection will increase a lot.
--      2. Troubleshooting: No debugger
--      3. Maintainence


-- Example Syntax
Create 
    [definer = user]
    procedure [ db_name. ]sp_name ([proc_parameter[,...]])
    [characteristic ...] routine body

proc_parameter:
    [ IN | OUT | INOUT ] param_name type

characteristic: {
    COMMENT 'string'
    LANGUAGE sql
    [NOT] deterministic
    { contains sql | no sql | reads sql data | modifies sql data}
    sql security { definer | invoker}
}

-- Create: Makes procedure known to server, can specifiy database if not default.
-- IN, OUT, INOUT: Every par is IN by default unless specified otherwise.

-- Write a MySQL procedure to show student list for semester.
-- Name of semester is given as input and count the number of students in that semester.

DELIMITER //
CREATE DEFINER = 'root@localhost' PROCEDURE list_semester_and_count 
(IN semester varchar(10), OUT count int )
    READS SQL DATA
    deterministic
    sql security invoker
    comment 'blah blah'

    BEGIN
        select student.name from university2.student
        where student.id in (select takes.id from university2.takes where takes.semester = semester);

        select count(student.name) into count from university2.student
        where student.id in (select takes.id from university2.takes where takes.semester = semester)
    END //
DELIMITER ;

call list_semester_and_count('Fall', @st_count);
select @st_count;

-- Consider Sakila database, find out that whether a DVD rental is overdue? If yes,
-- then count overdue days. Make a function for the same
DELIMITER //
CREATE DEFINER = 'root@localhost' FUNCTION overdue(return_date DATE) RETURNS CHARSET utf8mb4
    BEGIN
        DECLARE sf_value VARCHAR(3);
        IF curdate() > return_date
            THEN SET sf_value = 'Yes';
        ELSEIF  curdate() <= return_date
            THEN SET sf_value = 'No';
        END IF;

        RETURN sf_value;
    END //
DELIMITER ;

DELIMITER //
     CREATE DEFINER=`root`@`localhost` FUNCTION count_days(return_date DATE) RETURNS int
         DETERMINISTIC
     begin
            declare days INT;
             IF curdate() > return_date
                 THEN SET days = DATEDIFF(curdate(), return_date);
             ELSEIF  curdate() <= return_date
                 THEN SET days = 0;
             END IF;
             return days;
     end //
     DELIMITER ;
