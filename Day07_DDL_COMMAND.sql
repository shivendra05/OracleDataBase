--DDL COMMAND
/*
1. CREATE
2. ALTER
3. DROP
4. TRUNCATE
5. RENAME
ALL DDL COMMANDS ARE AUTO COMMIT.
*/

--CREATE A NEW TABLE FROM EXISTING TABLE
/*
CREATE TABLE <NEW_TABLE>
AS
SELECT <COLUMN_NAME> FROM <OLD_TABLENAME>
*/

create table emp1
        as
        select * from emp;

select * from emp1
select * from tab
select * from all_users

--COPY SPECIFIC COLUMN AND ROWS
create table emp2
        as
        select empno, ename, job, sal
                from emp
                where job in('CLERK','MANAGER')     
select * from emp2

--COPY ONLY SCHEMA/DEFINACATION OF TABLE
create table emp3
        as
        select * from emp
                where sal>9999999
select * from tab
select * from emp3

--COPY ONLY DATA FROM ONE TABLE TO ANOTHER TABLE(COPY DATA BUT DONT CREATE TABLE)
/*
INSERT INTO <TABLE_NAME>
        SELECT <COLUMN_NAME> FROM <TABLE_NAME>
*/
select * from emp3--retruns only schema

insert into emp3
        select * from emp
select * from emp3--return values,all vlaues have had in emp

--COPY DATA FROM ONE USER TO ANOTHER USER
/*
create user shivendra identified by shivendra
grant connect,resource to shivendra
*/

connect AS DBA(system/tiger)
        create table shivendra.emp5
                as
                select * from shiv.emp

--All DML COMMANDS ARE AUTO COMMITED

create table a (id number(10))
insert into a (id) values(10)
insert into a (id) values(20)
insert into a (id) values(30)
create table b (id number(20))
insert into b values(10)
insert into a values(40)
rollback
select * from a
select * from b

--ALTER COMMAND
--ALTER COMMAND USED TO MODIFY TABLE DEFINATION, USING ALTER WE CAN DO.
/*
1. ADD COLUMN
2. DROP COLUMN
3. RENAME COLUMN
4. MODIFY COLUMN
*/

--1. ADD COLUMNS.
--SYNTAX.
/*
ALTER TABLE <TABLE_NAME>
ADD (COLUMN_NAME DATA_TYPE(SIZE),.....)
*/

--ADD DOB AND GENDER TO EMP1 TABLE
select * from emp1

alter table emp1 
        add (DOB date, gender char(1))

--ENTER VLAUES TO GENDER.       
update emp1 
        set gender='F'
        where deptno=10

--DROPING THE COLUMN.
/*
ALTER TABLE <TABLE_NAME>
        DROP <TABLE_NAME>
*/

--DROP COLUMNS FROM THE TABLE.
alter table emp1 
        drop (DOB)


--RENAMING COLUMNS
/*
ALTER TABLE <TABLE_NAME>
        RENAME COLUMN <OLD_COLUMN_NAME> TO <NEW_TABLE_NAME>
*/

select * from emp1
alter table emp1
        rename column comm to bonus
select * from emp1

/*
        difference between RENAME and ALIAS
1.RENAME IS PERMANENT BUT ALIAS IS NOT PERMANENT
2.RENAME CHNAGES COLUMN NAME IN THE TBALE BUT ALIAS CHANGES ONLY COLUMN HEADING IN HR STATEMENT 
*/


--MODIFYING A COLUMN.
/*
1. TO INCREASE/DECREASE SIZE
2. TO CHNAGE DATA TYPE
*/
--1. TO INCREASE SIZE OF COLUMN
/*
ALTER TABLE <TABLE_NAME>
        MODIFY (COLUMN_NAME DATE_TYPE(SIZE))
*/

--INCREASE SIZE OF ENAME FROM 10 TO 20
alter table emp1
        modify (ename varchar(20))

--2. CHNAGE DATA TYPE OF COLUMN

--HOW TO CHANGE DATA TYPE OF A COLUMN AND IF COLUMN CONTAINS DATA
--STEP-1. ADD A NEW COLUMN.
alter table emp1
        add (empid varchar(20))

select * from emp1
--STEP-2. COPY VLAUES FROM OLD COLUMN TO NEW COLUMN.
update emp1
        set empid=empno
        
select * from emp1

--STEP-3. DROP COLUMN, OLD_COLUMN_NAME
alter table emp1
        drop column empno

or 

alter table emp1
        drop empno

--STEP-5. RENAME NEW_COLUMN NAME
alter table emp1
        rename column empid to empno

select * from emp1

--DROP COMMAND
--USED TO DROP TABLE FROM DB.
/*
DROP TABLE <TABLE_NAME>
*/

select * from tab
DROP TABLE B
select * from tab


--WHEN DATA IS DROPED, IT GOES TO RECYCLE BIN. COMMAND TO SHOW RECYCLEBUN
show recyclebin
select * from recyclebin

--PURGE COMMAND
--USED TO DALETE OBJECT FROM RECYCLEBIN
purge table <table_name>

--to delete all the data from the recyclebin
purge recyclebin



--4. TRUNCATE COMMAND
--USED TO DELETE ALL THE DATA FROM THE TABLE, USED TO EMPTY THE TABLE,RELEASES ALL THE MEMORY LOCATION FOR TABLES
/*
TRUNCATE TABLE <TABLE_NAME>
*/
select * from emp2
truncate table emp2
select * from emp2
select * from tab

--5. RENAME COLUMN
--USED TO CHANGE NAME OF THE TABLE.
/*
RENAME <OLD_TABLE_NAME> TO <NEW_TABLE_NAME>
*/

rename emp2 to copy_of_emp
select * from tab
