--AGGREGATE FUNCTION/ MULTI ROW FUNCTIONS/ GROUP FUNCTION.
--this function acts on group of rows and returns one value from the group.

--1.1 MAX(ARG), returns maximum value
select * from tab
select * from all_users
--SELECT MAX SALARY OF THE EMP.
select max(sal) from emp

--SELECT MAX HIREDATE.
select max(hiredate) from emp

--SELECT MAX NAME.
select ename from emp
select max(ename) from emp

--1.2. MIN(ARG),        RETURNS MIN VLAUE OF THE COLUMN.
--SELECT MIN SAL.
select min(sal) from emp

--SELECT MIN NAME
select min(ename) from emp

--SELECT MIN HIREDATE
select min(hiredate) from emp

--1.4. AVG(),   RETURNS AVERAGE VALUE.
--SELECT AVG SALARY.
select sal from emp
select floor(avg(sal)) from emp
select ceil(avg(sal)) from emp
select round(avg(sal)) from emp
select round(avg(sal),2) from emp
select round(avg(sal),-2) from emp

--DISPLAY AVG COMM
select * from emp
select avg(comm) from emp--takes count to 4, but it should take all counts

--drop table emp
select * from tab
--drop table dept
select * from emp
select * from dept
select avg(nvl(comm,0)) from emp--take total counts 14
--sum and avg cant be applied on dates, only applied on number. 

--1.5.COUNT(ARG),       RETURNS NUMBER OF VALUES PRESENT IN A COLUMN.
--SELECT EMPLOYEE COUNT FROM EMP.
select * from emp
select count(ename) as eName_count from emp
select count(comm) comm_count from emp--4
select count(nvl(comm,0)) from emp--14

--1.5.COUNT(*),       RETURNS NUMBER OF RECORDS IN THE TABLE.
--SELECT EMPLOYEE COUNT FROM EMP.
select count(*) from emp
select count(deptno) from emp
select count(distinct deptno) from emp


--COUNT THE NUMBER OF EMP JOINED IN 1981 YEAR
select count(*) from emp
        where to_char(hiredate,'YYYY') =1981

--COUNT THE NUMBE ROF EMPLOYEE JOINED ON SUNDAY
select count(*) from emp
        where to_char(hiredate,'dy')='sun'

select to_char(sysdate,'day dy') from dual

--LIMITATIONS OF GROUP/AGRRIGATE FUNCTIONS
--1.1 AGGRIGATE FUNCTIONS ARE NOT ALLOWED IN WHERE CLAUSE. IT IS ONLY ALLOWED ON SELECT, HAVING CLAUSE.
select ename from emp
        where sal=max(sal) --group by function are not allowed.
        
/*
select ename ,max(sal) from emp
        14 != 1---ERROR
select ename, round(sal) from emP
        14 = 14---NO ERROR
selet round(sal),max(sal) from emp
        14 != 1--ERROR
select max(sal), min(sal) from emp
        1=1 --NO ERROR
*/
