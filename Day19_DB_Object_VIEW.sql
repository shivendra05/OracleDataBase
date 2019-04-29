--DATA BASE OBJECTS.
/*
SQL:
        1. TABLES
        2. VIEWS
        3. SYNONAMES
        4. SEQUESCES
        5. INDEXES
        6. CLUSTERS
        7. MATERIZATION VIEW

PL/SQL
        1. PROCEDURE
        2. FUNCTIONS
        3 PACKAGES
        4. TRIGGERS
*/

/*
1. VIEWS:-
        A VIEW IS ASUBSET OF A TABLE.
        A VIEW IS A VIRTUAL TABLE.
        A VIEW IS A REPESENTATION OF A QUERY.
VIEWS ARE CREATED TO:-
        PROVIDE SECURITY
        REDUCE COMPLEXCITY.

BENIFITES:-
        WITH HELP OF VIEWS, WE CAN GRANT SPECIFIC COLUMNS AND ROWS TO USER INSTEAD OF GRANTING THE WHOLE TABLE.
        A VIEW IS CALLED VIRTUAL TABLE BECAUSE IF DOESNT STIRE AND DIESNT ICCUTY MEMORY. UT ALWASTS DERUVERS DARA FROM BASE TABLE

PRE-REQUISIT:
USER SHOULD HAVE PREVILEGE TO DO OPERATION ON VIEW.

VIEWS ARE OF TWO TYPES:
1. SIMPLE VIEWS
2. COMPLEX VIEWS

1. SIMPLE VIEW:
        A VIEW IS CALLED SIMPLE CIEW, IF IT IS BASED ON SINGLE TABLE
SYNTEX,:-
        CREATE VIEW <VIEW_NAME>
        AS
        SELECT STATEMENT
*/

/*
LOGIN WITH MANAGER, PROVIDE PREVILEGE TO USERS TO CREATE VIEW. 
        GRANT CREATE VIEW TO <USER_NAME>
*/
--login as dba(manager/pws)
select * from tab
select * from emp10
grant create view to shiv

create view view_emp10
        as
        select empno, ename from emp10
        
select * from view_emp10


create view emp_view1
as 
select empno,ename,sal from emp

select * from emp_view1

/*
ORACLE RE-WRITES THE QUERY AS FOLLOWS
SELECT * FROM (SELECT EMPNO, ENAME, SAL FROM EMP)
*/
/*
GRATING PERMISSION ON VIEW TO USERS.
SYNTEX:-
        SHIV:-
        GRANT ALL ON VIEW_EMP1 TO SHIVENDRA        
*/

GRANT ALL ON VIEW_EMP1 TO SHIVENDRA

/*
INSERTING RECORDS INTO VIEW.
        WHEN WE INSERTS THE DATA INTO VIEWS, ORACLE INSERTS RECORDS IN THE TABLE AS WELL AND REMAINING FIELDS ARE FILLED WITH NULL VLAUES.
*/
insert into view_emp10
        values(2,'shivam')
select * from view_emp10
select * from emp10


/*
UPDATING RECORDS INTO VIEW.
        WHEN WE UPDAETS THE DATA INTO VIEWS, ORACLE UPDAETS RECORDS IN THE TABLE AS WELL AND REMAINING FIELDS ARE FILLED WITH NULL VLAUES.
        WE CANT UPDATE VLAUES/COULMNS WHIHC IS NOT IN VIEW.
*/
update view_emp10
        set empno='4'
        where ename='shivam'

select * from view_emp10
select * from emp10

/*
WITHOUT CHECK OPTION,
        INSERT:- 
        IF VIEW CREATED 'WITHOUT CHECK OPTION' THEN ANY DML COPERATIOBS THROUGH THAT VIEW VOILATES WHERE CONDITION THE DML IS ACCEPTED
*/
select * from tab
select * from emp19
--drop view emp_view19
create view emp_view19
as
select empno,ename,sal,deptno from emp19
where deptno=20 

select * from emp_view19

insert into emp_view19 values(4,'shivendra',21000,20)

/*
WITh CHECK OPTION,
        INSERT:- 
        IF VIEW CREATED 'WITH CHECK OPTION' THEN ANY DML COPERATIOBS THROUGH THAT VIEW VOILATES WHERE CONDITION THE DML IS NOT ACCEPTED
*/

create view emp_checkview19
as
select empno,ename,sal,deptno from emp19
where deptno=20
with check option 

select * from emp_checkview19

insert into emp_checkview19 values(7,'shivem',20100,30)



/*
2. COMPLEX VIEW:
        A VIEW IS CALLED SIMPLE CIEW, IF 
                1. IT IS BASED ON MORE THEN ONE TABLE
                2. IF QUERY CONTAINS GROUP BY CALUSE/AGGRIGATE FUNCTION/DISTINCT CLAUSE/SUB-QUERIES/SET-OPRATIONS
SYNTEX,:-
        CREATE VIEW <VIEW_NAME>
        AS
        SELECT COLUMN_NAMES FROM <TABLE NAME> JOIN <TABLE NAME>
        ON CONDITIONS
*/
select * from tab

select * from emp18
select * from dept18

create view emp_dept_view18
as
select e18.empno,e18.ename,e18.deptno,d18.dname
        from emp18 e18 join dept18 d18
        ON e18.deptno=d18.deptno

select * from emp_dept_view18

/*
SIMPLE VIEW VS COMPLEX VIEW.
SIMPLE VIEW:-
        1. BASED ON SINGLE TABLE
        2. BASED OM SIMPLE QUERY
        3. ALWAYS UPDATBALE--COLUMN OF KEYPRESEVE TABLE ARE UPDATBLE

COMLEX VIEW:-
        1. BASED ON MULTIPLE TABLE
        2. BASED ON COMPLEX QUERIES
        3. NOT ALWAYS UPDATBLE--COLUMN OF NON-KEYPRESEVE TABLE NOT UPDATBLE
*/

--USER UPDATABLE COLUMNS
desc user_updatable_columns

select column_name,updatable 
        from user_updatable_columns
        where table_name='emp_dept_view18'


--CREATE VIEW DEPT SUMMARIES.
create view dept_summary
as
select deptno,max(sal) as max_sal,
                min(sal) as min_sal,
                sum(sal) as sum_sal,
                count(*) as counts
from emp
group by deptno


select * from dept_summary

select coulmn_name,updatable 
        from user_updatable_columns
        where table_name='dept_summary'


--CAN WE CREATE ONE VIEW FROM ANOTHER VIEW,     YES

create view emp_summary1
as
select empno,ename,sal,deptno from emp

select * from emp_summary1


create view emp_summary2
as
select empno,ename,sal from emp_summary1

select * from emp_summary2


---CAN WE CREATE A VIEW WITHOUT A BASE TABLE,   YES
/*
view can be created with compilation
*/
create force view v1
as
select * from abc

create view v2
as
select * from emp14

select * from v2
--drop view v2

--USERS VIEW,
/*
STORES INFORMATION ABOUT VIEWS CREATED BY USERS
*/

desc user_views

--TO GET LIST OF VIEWS
select view_name from user_views

--TO GET QUERY FROM PARTICULAR VIEW
select text from user_views
        where view_name='v1'