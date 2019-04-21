--DML COMMANDS
/*
ALL OPERATION BELONGS TO ROWS/VALUES COMES UNDER DML.
1. INSERT
2. UPDATE
3. DELETE
*/
--UPDATE,       command is used to modify data in a table
/*
systex:-
update <tableName>
        set colName = <value>,
        set colName = <value>,
        ----
[where <condition>]
*/

--UPDATE ALL EMP COMM TO 500
update emp
        set comm=500
        
select * from emp
--update command updated data in the RAM, so to make it permanent execute 'commit' command. and to rollback execute 'rollback'.
--rollback doesnt work after commit.

--UPDATE EMP COMM TO 800 WHOSE EMPNO=7566
update emp
        set comm=800
        where empno=7566
/*        
select * from emp
select * from taB
drop table EMP;
DROP TABLE DEPT;
select * from emp
select * from dept
*/

--UPDATE EMPLOYEE COMM TO 500 WHOSE COMM=NULL
update emp
        set comm =500
        where comm is null

--UPDATE COMM TO NULL WHOSE COMM IS NOT NULL
update emp 
        set comm=null
        where comm is not null

select * from emp
--null assignemt operator is '='
--null comparison operator is 'IS'

--INCREASE EMPLOYEE SAL BY 20% AND COMM BY 20% THOSE JOINED IN 1981.
update emp 
        set sal=sal + (sal*.1), comm = comm+(comm*.2)
        where hiredate like '%81'

or

update emp 
        set sal = sal+(sal*.1), comm=comm+(comm*.2)
        where hiredate between '01-JAN-1981' and '31-DEC-1981'

--increase employee salaries follows,
/*
if job=clerk increase by 10%
        salesman increase by 15%
        manager increase by 20%
        other incease by 5%
*/

update emp
        set sal= case job 
        when 'CLERK' THEN sal+(sal*.1)
        when 'SALESMAN' THEN sal+(sal*.15)
        when 'MANAGER' THEN sal+(sal*.2)
        else sal+(sal*.05)
        end

select * from emp


--DELETE COMMAND
--delete is used to detele row/rows from table
/*

delete <tableName>
[where <condition>]
*/

--DELETE ALL THE DATA FROM EMP
delete from emp

--delete all the data from dept
delete from dept

--DELETE ALL THE EMP HAVE MOER THEN 35 YEARS OF EXPERIENCE
delete from emp
        where (sysdate - hiredate)>35;










