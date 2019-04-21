--SPECIAL FUNCTIONS
--1.1 NVL(arg1,arg2),   is sued to convert null vlaues
/*
NVL(arg1,arg2)
means:-
if arg1 = null return arg2
if arg1<> null return arg1
*/

select nvl(100,200) from dual---returns 100
select nvl(null,200) from dual---return 200

select * from emp
--DISPLAY ENAME, SAL, COMM, SAL+COMM AS TOTAL, FRPM EMP.
--null+any number=null
select ename, sal,comm, sal+nvl(comm,0) as total_sal from emp 


--DISPLAY ENAME, SAL, COMM. IF COMM IS NULL DISPLAY N/A.
select ename, sal, nvl(to_char(comm),'N/A') as new_comm from emp
--select ename, sal, nvl(comm,'N/A') as new_comm from emp--fail becasue data type of comm is number



--1.2 NVL2(arg1,arg2,arg3),   is used to convert null values
/*
NVL2(arg1,arg2,arg3)
means:-
if arg1 = null return arg3
if arg1<> null return arg2
*/

select nvl2(100,200,300) from dual--200
select nvl2(null,200,300) from dual--300


--CALCULATE TOTAL SALRY AS FOLLOWS.
/*

IF COMM=NULL, IT SHOULD BE SAL+500
IF COMM<>NUL, IS SHOULD BE SAL+200
*/

SELECT ENAME,SAL, NVL2(COMM,SAL+200,SAL+500) AS TOTAL_SAL FROM EMP
or
select ename, sal, sal+nvl2(comm,200,500) as total_sal from emp
