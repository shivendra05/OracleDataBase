--SUBQUIERIS AND NESTED QURIES
/*
A QURIES INSIDE ANOTHER QUERY. ONE IS CALLED AS INNER AND ANOTHER IS OUTER QUERY.
WHEN IT IS EXECUED FIRST INNER QUERY EXECTUES THEN OUTER QUERY. AND THE RESULT OF INNER QUERY IS INPUT FOR OUTER QUERY.

TYPE OF SUB-QUERIES.
1. SINGLE ROW SUB QUERIES
2. MULTI ROW SUB QUERIES
3. CO-RELATED SUB QUERIES
4. IN-LINE VIEW
5. SCALAR SUB-QUERIES.
*/

--SINGLE ROW SUB-QUERIES.
/*
IF SUB-QUERIES RETURN ONLY ONE VALUE, THEN IT IS CALLED AS SINGLE SUB-QUIRES.

SELECT COLUMN_NAME
FROM TAB_NAME
WHERE COULMN_NAME OPERATOR(SELECT STATMENT)
*/

--EMPLYOO EARNING MORE THEN BLACK.
select ename,sal from emp
        where sal>(select sal from emp
                        where ename='BLAKE')


--SELECT EMPLOYEES JOB=BLAKE JOB.
select ename, job from emp
        where job=(select job from emp
                        where ename='BLAKE')

--SELECT EMPLOYEES JOB=BLAKE JOB, BUT DONT INCLUDE BLAKE
select ename, job from emp
        where job=(select job from emp
                        where ename='BLAKE')
               and ename<>'BLAKE'

--SELECT EMPLOYEES JOB=BLAKE JOB AND EARNING MORE THEN BLAKE.
select ename, job, sal from emp
        where job=(select job from emp
                        where ename='BLAKE')
                        AND
               SAL>(select sal from emp
                        where ename='BLAKE')

--NAME OF EMPLOYEE EARNING MAX SAL.
select ename, sal from emp
        where sal=(select max(sal) from emp)


--NAME OF THE EMPLOYEE HAVING MAX EXP.
select ename, hiredate from emp
        where hiredate=(select min(hiredate) from emp)

--DISPLAY 2ND MAX SAL.
select max(sal) from emp
        where sal<(select max(sal) from emp)

--DIAPLAY ENAME OF THE EMPLOYEE REARNING THE SECOND MAX SAL
select max(sal) from emp

select ename, sal from emp
        where sal>(select max(sal) from emp
                where sal<(select max(sal) from emp))


/*
UPDATE TABLE_NAME
        SET CLOUMN_NAME = (SELECT ..)
        WHERE COULMN_NAME OPERATION(SELECT..)
*/

--UPDATE EMPLOYEE SAL TO MAX SAL OF 30TH DEPT,WHERE EMPNO=7499 
select * from emp where empno='7499'

update emp
        set sal=(select max(sal) from emp where deptno=30)
        where empno='7499'


--UPDATE EMPLOYEE SAL TO MAX SAL OF 'SALES' DEPT WHOSE EMPNO='7499'
update emp
        set sal =(select max(sal) from emp
                where deptno=(select deptno from dept
                                where dname='SALES'))
        where empno=7499

/*
JOIN VS SUB QUERY
TO GET DATA FROM ONE TBALE AND CONDITION BASED ON ANOTHER TBALE THEN WE CAN USE JOIN OR SUBQUET
*/

--EMPLOYEE NAME WORKING AT 'NEW YORK' LOCATION

select ename from emp
        where deptno=(select deptno from dept
                        where loc='NEW YORK')


select ename 
        from emp e, dept d
        where e.deptno = d.deptno
                and 
                d.loc='NEW YORK'
                

select ename 
        from emp e join dept d
        on e.deptno = d.deptno
                and 
                d.loc='NEW YORK'
        
        
--2. MULTI ROW SUB QUERY.
/*
IF SUB QUERY RETURNS MULTIPLE ROWS THEN IT IS CALLED MULTI ROW SUB QUERY

SELECT COLUMN_NAME
FROM TABLE_NAME
WHERE COL_NAME OPERATION (SUB_QUERY)

OPERATION MUST BE, IN, NOT IN, ANY, ALL
*/        

--EMPLOYEE WHOSE JOB  = SMITH'S JON OR BLAKE'S JOB

select ename from emp
        where job in(
                select job from emp
                        where ename in ('SMITH','BLKAE'))


select ename from emp
        where job =(select job from emp
                        where ename ='SMITH')
                OR
             job =(select job from emp
                        where ename ='BLKAE')

--SELECT NAME OF EMPLOYEE EARNING MIN, MAX SALARY.
select max(sal) from emp--5000
select min(sal) from emp--800

select ename, sal from emp
        where sal =(select max(sal) from emp)
                OR
             sal =(select min(sal) from emp)


select ename, sal from emp
        where sal =(select max(sal) from emp)
        union
select ename, sal from emp
        where sal =(select min(sal) from emp)

--ROW NUM.
/*
RETURNS RECORD NUMBER FOR TEH RECOREDS RETURN BY SELECT QUERY
THIS IS CALLED PSUEDO COLUMN.
IT IS CALLED PSUEDO COLUMN BECASUE IT IS NOT A COLUMN BUT ACTS LIKE A COLUMN AND IT DEOSNT BELOGS TO ANY TBALE BUT IT CAN BE SELECTED FROM ALL THE TABLES.
*/

select * from emp
select rownum, ename, empno from emp

/*IF QUERY CHANEGS ROW NUMBER ALSO CHNAGES
*/

select rownum, ename,empno, sal from emp
        where sal>2000

select rownum, ename,empno, sal from emp
        where sal>3000

--DISPLAY FIRST FIVE ROW FROM EMP TABLE
select * from emp
        where rownum<5

/*
ROWNUM DOESNT WORK WITH, =,>=,> 
ROWNUM WORKS WITH <,<=
*/

--DISPLAY FIFTH ROW FROM EMP TABLE.

select * from emp
        where rownum=5--no row selectd

select * from emp
        where rownum<5
        minus
select * from emp
        where rownum<4


select * from emp
        where empno in(select case rownum
                        when 5 then empno
                        when 7 then empno
                        when 11 then empno
                        end as empno
                        from emp
        )

--SELECT EVEN NUMBER ROW RECORED
select * from emp
        where empno in(select case mod(rownum,2)
                        when 0 then empno
                        end
                        from emp)
--SELECT 5TH TO 10TH RECORD
select * from emp
        where empno in(select case when rownum between 5 and 10
                        then empno
                        end
                        from emp)
                        
                        
--ANY
/*
OPERATOR USED TO COMPARE ANY OF THE VLAUES IN THE GIVEN LIST
*/                      
--ALL
/*OPERATOR USED TO COMAPRE WITH ALL THE VALUES
*/

--EMPLOYEE EARING MORE THAN ALL MANAGERS                        
select ename, sal from emp
        where sal > all( select sal from emp
                                where job='MANAGER')                        
                        
--EMPLOYEE EARING MORE THAN ANY MANAGERS                        
select ename, sal from emp
        where sal > ANY( select sal from emp
                                where job='MANAGER')                             
                        
--CO-RELATED SUBQUERIES.
/*
if sub query refers values of out query then it is called co-related sub query.
HERE EXECUTION STARTS FROM OUTER QUERY AND INNER QUERIES EXECUTED NO OF TIMES DEPENS ON NO OF ROWS RETUNS BY OUTER QUERY.
USE CO-RELATED SUB QUERY TO EXECUTE SUB QUREY FOR EACH ROW RETURN BY OUTER QUERY.
*/                        

/*
STEPS:-
1. RETURNS ROW FROM OUTER QUERY
2. PASS VALUES TO INNER QUERY
3. EXECUTE INNER QUERY
4. RETURNS THAT VALUES TO OUTER QUERY
5. EXECUTE OUTER QUERY.

CO-RELATED SUB-QUERIES ARE EXPENSIVE WHEN COMPARE TI NARMAL SUB-QUERY
CO-RELATED SUB-QUERYTAKES MORE TIME.
*/
                        
                        
--EMPLOYEE EARNING MORE THEN AVG SAL OF THERI DEPT.                        
                        
select * from emp                     
select * from dept                        
    
select ename from emp a
        where sal>(                        
                select round(avg(sal)) from emp e
               where e.deptno=a.deptno)                   
                        
--EMPLOYEE WHO ARE EARNING MAX SAL OF THERI DEPT.                        
                        
select * from emp                     
select * from dept                        

select ename, sal from emp e
        where sal  = (select max(sal) from emp m
                        where e.deptno = m.deptno)


--DISPLAY TOP 3 SALARIES FROM EMP TABLE.
select distinct sal from emp a
        where 3>(select count(distinct sal) from emp b
                                where a.sal<b.sal)
        order by sal desc


--DISPLAY 3RD MAX SAL?
select distinct sal from emp a
        where (3-1)=(select count(distinct sal) from emp b
                        where a.sal<b.sal)
        order by sal desc


--ROWID:-
/*
IT RETURNS PHYSICAL ADDRESS OF A ROW.
RETURNS RECORD ADDRESS
PSUEDU COLUMN
IT IS NOT A COLUMN BUT ACT LIKES A COULMN, NOT BELOWGS TO ANY TABLE BUT CAN BE SELECTED FROM ALL TABLE
*/

select rowid, rownum, empno, ename, sal from emp                                
--IF QUERY CHNAGES ROWNO CHNAGES BUT ROWID DOESNT CHNAGE. ROWID IS STATIC BUT ROWNO IS DYNEMIC.                                
--ROWID USED TO DELETE RECORD DUPLICATE RECORDE FROM THE TABLE
select * from tab
create table emp44 (empno number(5), ename varchar(10), sal number(10))
insert into emp44 values(1,'a',5000)
insert into emp44 values(2,'b',3000)
insert into emp44 values(3,'c',6000)
insert into emp44 values(2,'b',3000)
insert into emp44 values(4,'d',7000)
select empno,ename,sal,rowid,rownum from emp44

--DELETE DUPLICATE ROWS.
select empno,ename,sal,rowid,rownum from emp44

delete from emp44
        where rowid like '%D'

select * from emp44
delete emp44 x
        where rowid<>(select min(rowid) from emp44
                        where empno=x.empno
                        and
                        ename=x.ename
                        and
                        sal=x.sal)

select * from emp44

--EXIST OPERATOR
/*
USED TO CHECK WHETHER RECORD EXIST IN THE TABLE OR NOT.

IT RETURNS, TRUE/FALSE
TRUE,   IF SUBQUERY RETURNS AT LEAST ONE ROW
FASLE,  IF SUB QUREY RETUENS ZERO ROWS
*/

--NOT EXIST OPERATOR
/*
USED TO CHECK RECORD DOES NOT EXIST IN THE TABLE.

IT RETURNS, TRUE/FALSE
TRUE,   IF SUBQUERY RETURNS ZERO ROWS
FASLE,  IF SUB QUREY RETUENS AT LEAST ONE ROW
*/

--INLINE VIEWS
/*
SUB-QUERIES ON 'FROM' CLAUSE ARE CALLED 'INLINE VIEWS'

SYNTEX.
SELECT COLUMN FROM(SUBQUERY)
THE RESULT OF SUB-QUERY ACTS LIKE A TABLE FOR OUTER QUERY.
BY DEFAULT ORACLE FOLLOWS THE FOLLOWING ORADER

FROM
WHERE
GROUP BY
HAVING
SELECT
ORDER BY
*/


select ename, sal*12 as ann_sal
        from emp
        where ann_sal>2000--            ERROR
/*
BY DEFAULT COLUMN ALIASES CANT BE REFERENCE IN WHERE CLAUSE BECASE 'WHERE CALUSE' IS EXECUTED BEFORE 'SELECT'.
TO USE COLUMN ALIASES IN WHERE CALUSE USE 'INLINE VIEW'.
*/

select * from
        (select ename, sal*12 as ann_sal from emp)
        where ann_sal>2000

--SCALAR SUB-QUERIES:
/*
SUB-QUERIES IN SELECT CLAUSE ARE CALLED AS SCALAR SUB-QUERIES
SYNTEX:-
SELECT (SUBQUERY),(SUBQUERY),...
FROM <TABLE_NAME>
[WHERE <CONDITION>]

THE SUB-QUERY OUTPUT ACTS LIKE A COLUMN
*/

select (select count(*) from emp) as emp,
        (select count(*) from dept) as dept
        from dual


--DISPLAY DEPT WISE SUM OF SAL

select (select sum(sal) from emp where deptno=10) as dept_10,
        (select sum(sal) from emp where deptno=20) as dept_20 ,
        (select sum(sal) from emp where deptno=30)as dept_30 
from dual

--DISPLAY DEPTNO,DNAME,DEPT_SUMSAL
select deptno,dname,(select sum(sal) from emp) as dept_sumsal
        from dept