-- MySQL does not allow use of all vaidations, only allow extended validations
-- We cant use NOT NULL, UNIQUE, CHECK, FOREIGN KEY

-- Triggers may increase the overhead of the database server.
-- Cannot nest triggers, Can nest stored procedures
-- Cannot use triggers on views
-- Cannot use triggers on temporary tables
-- Cannot use triggers on system tables
-- Cannot use triggers on tables that are not in the same database as the trigger
-- Triggers are stored in the mysql database in the table mysql.triggers.

-- The following query displays the triggers in the current database:
SELECT * FROM information_schema.triggers;


-- Syntax:
/* CREATE 
     [DEFINER = { user | CURRENT_USER }]
     TRIGGER trigger_name
     {BEFORE | AFTER} {INSERT (INSERT, LOAD DATA, REPLACE) | UPDATE (UPDATE) | DELETE (DELETE, REPLACE) }
     ON table_name FOR EACH ROW
     [{ FOLLOWS | PRECEDES } other_trigger_name]
     trigger_body;
*/

-- When inserting a row in orders table, we need add 18% GST before inserting the new row. 
-- The following trigger add 18% GST into the new price of order.
DELIMITER //
CREATE TRIGGER add_gst
BEFORE INSERT ON orders
FOR EACH ROW
    BEGIN
        NEW.price = NEW.price*1.18;
    END //
DELIMITER ;

-- The following trigger is associated with table test1 and executed before insert statement.
-- It insert same value in table test2, delete that value from test3, and update the value 
-- in table test4.
DELIMITER //
CREATE TRIGGER testing
BEFORE INSERT ON test1
FOR EACH ROW
    BEGIN
        INSERT INTO test2 SET a2 = NEW.a1;
        DELETE FROM test3 WHERE a3 = NEW.a1;
        UPDATE test4 SET b4 = b4 + 1 WHERE a4 = NEW.a1;
    END //
DELIMITER ;

-- Database triggers execute with the privileges of the owner, not the current user.

-- DROP TRIGGER testref;

-- CREATE INDEX cannot be used to create a PRIMARY KEY; use ALTER TABLE instead.

/* These indexes are for quick access to rows in a table.
-- Syntax:
CREATE [UNIQUE | FULLTEXT | SPATIAL] INDEX index_name
    [index_type]
    ON tbl_name (key_part,...)
    [index_option]
    [algorithm_option | lock_option] ...

index_type:
    USING {BTREE | HASH}

key_part:
    col_name [(length) | (expr)] [ASC | DESC]

index_option:
    KEY_BLOCK_SIZE [=] value
  | index_type
  | WITH PARSER parser_name
  | COMMENT 'string'
  | {VISIBLE | INVISIBLE}

algorithm_option:
    ALGORITHM [=] {DEFAULT | INPLACE | COPY}

lock_option:
    LOCK [=] {DEFAULT | NONE | SHARED | EXCLUSIVE}

*/

-- For a nonunique index, either an error occurs (if strict SQL mode is enabled), 
-- or the index length is reduced to lie within the maximum column data type size 
-- and a warning is produced (if strict SQL mode is not enabled).

-- For a unique index, an error occurs regardless of SQL mode because reducing the index 
-- length might enable insertion of nonunique entries that do not meet the specified 
-- uniqueness requirement.
