-- ACID Properties :-
--  Atomicity, Consistency, Isolation, Durability

-- BEGIN / BEGIN WORK can be used in place of START TRANSACTION
-- COMMIT - Save Changes 
-- Rollback - Goes to the state before the start of transaction, if it has not been committed.

-- AUTOCOMMIT - by default on.
set autocommit = 0;
set autocommit = off;
set autocommit = on;

-- SAVE POINT - can rollback to particular save point instead of going to the state before transaction started
Savepoint aryan;
rollback [work] to [Savepoint] aryan;
release savepoint aryan;

-- after a commit all save points are released.



-- STATEMENTS THAT CAUSE IMPLICIT COMMIT
-- hence you should not use these in your transaction because you cannot rollback after these commands have been used.

--   DDL Statements that ddefine or modify database objects
ALTER, CREATE, DROP, INSTALL, RENAME, TRUNCATE, UNINSTALL -- use implicit commit.

--   Statements that implicitly use or modify tables in database
ALTER USER, CREATE USER, DROP USER, GRANT, RENAME, USER, REVOKE, SET PASSWORD

--   Transaction Control and Locking Statements
BEGIN -> LOCK TABLES, START TRANSACTION -> UNLOCK TABLES

--   Data Loading Statements
LOAD DATA -- causes a commit using the NDB storage engine

--   Administrative Statements
ANALYZE TABLE, CACHE INDEX, CHECK TABLE, FLUSH, LOAD INDEX INTO CACHE, OPTIMIZE TABLE, REPAIR TABLE, RESET (but not RESET PERSIST).

-- Replication Control Statements
START REPLICA | SLAVE, STOP REPLICA | SLAVE, RESET REPLICA | SLAVE, CHANGE REPLICATION SOURCE TO, CHANGE MASTER TO




-- these commands although do not have implicit commit cannot be rolled back
-- hence transactional atomicity is violated.
Create table, drop table; -- for *temporary* tables
