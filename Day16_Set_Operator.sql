--SET OPERATORS
/*
1. UNION
2. UNION SET
3. INTERSECT
4. MINUS

SELECT STATEMENT1
UNION/UNION ALL/INTERSECT/MINUS
SELECT STATEMENT2

RULES:
1. NUMBER OD COULMNS RETURN BY BOTH QUIERIES SHOULD BE SAME
2. CORRESPONDING COLUMNS DATA TYPE SHOULD BE SAME.
*/


--1. UNION.
/*
COMBINES ROWS RETURN BY TWO SELECT STATEMENTS.
ELIMINATE DUPLICATES
RESULT IS SORTED. BY DEFAULT UNION SORTS RESULT BASED ON FIRST COULMN, AND TO SORT ON SECOND COLUMN USE ORDER BY.

*/

--SELECT JOB WHERE DEPTNO IS 20 AND 30
select job, sal from emp where deptno=20
union
select job, sal from emp where deptno=30
order by 2

/*
UNION VS JOIN
UNION,  COMBINES DATA HORIZONTALY
        COMBINES ROWS
        SIMILER STRUCTED TABLES ARE COMBINED WITH UNION.

JOIN,   COMBINES DATA VERTICALLY
        COMBINES COULMNS
        DISSIMILAR STATRUS TABLE ARE COMBINED WITH JOIN        
*/

/*
EMP_US
EMP_IND
DEPT
*/
--TOTAL NUMBER OF EMPLOYEE
select * from emp_us
        union 
select * from emp_ind


--EMPLOYEE WORKING AT US LOCATION WITH DEPT DETAILS.
select e.*, d.*
        from emp_us e, dept d
        where e.deptno = d.deptno

--TOTAL EMPLOYEE WITH DEPT DETAILS.

select e.*, d.*
        from emp_us e, dept d
        where e.deptno = d.deptno
union
select e.*, d.*
        from emp_ind e, dept d
        where e.deptno = d.deptno        


--UNION ALL
/*
COMBINES ALL RETURNS BY TWO SELECT STATEMTNS
DUPLICATE ARE NOT ELEMINIATE
RESULT IS NOT SORTED
*/

--INSERTSECT.
/*
RETURNS COMMAN VALUES FROM THE RESULT OF TWO SELECT STATEMENTS.
*/

select job from emp 
        where deptno=20
intersect
select job from emp
        where deptno=30



--MINUS.
/*
RETURNS VALUES FROM 1ST QUERY OUTPUT NOT PRESNT IN 2ND QUERY OUTPUT.
*/

select job from emp 
        where deptno=20
MINUS
select job from emp
        where deptno=30


select job from emp
        where deptno=30
MINUS
select job from emp 
        where deptno=20
