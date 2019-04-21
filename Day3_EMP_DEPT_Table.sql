select * from dept;

select * from emp;

SELECT ename,
  dname,
  job,
  empno,
  hiredate,
  loc
FROM emp,
  dept
WHERE EMP.DEPTNO = DEPT.DEPTNO
ORDER BY ename ;

----BETWEEN OPERATOR
--between operator, it is used when comparison becased on range.
--where ColumnName between v1 and v2
--where ColumnName not between v1 and v2
--between range should follow lower to higher order, eg. 2000 and 5000 but not 5000 and 2000

--FIND EMP DETAILS EARNING BETWEEN 2000 AND 5000
select * from emp where sal between 2000 and 5000;

--FIND EMP DETAILS EARNING NOT BETWEEN 2000 AND 5000
select * from emp where sal not between 2000 and 5000;

--FIND EMP DETAILS JOINED IN YESR 1981.
select * from emp where hiredate between '01-JAN-1981' and '31-DEC-1981';

----IN OPERATOR
--in operator used when comparision based on list of values.
--where ColumnName in (v1,v2,v3,v4..)
--where ColumnName not in (v1,v2,v3,v4..)

--FIND EMP DETAILS WORKING AS CLERK, MANAGER, SALESMAN
select * from emp where job in ('SALESMAN','CLERK','MANAGER');
select * from emp where job not in ('SALESMAN','CLERK','MANAGER');

--FIND EMPLOYEES WORKING AS CLERK OR MANAGER AND EARNING BETWEEN 2000 AND 5000, AND JOINED IN YEAR 1981, AND NOT WORKING FOR DEPT 10 OR 20.
select * from emp
where job in ('CLERK','MANAGER') 
        and 
        sal between 2000 and 5000 
        and 
        hiredate between '01-JAN-1981' and '31-DEC-1981' 
        and 
        deptno not in(10,20);
        
---FIND EMPLOYEE WORKING AS CLERK OR MANAGER AND REANING MORE THAN 2000
select * from emp
where job ='CLERK' OR job='MANAGER'
        and 
        sal>2000
        ---incorrect as and has higher priorty over or.

select * from emp
where (job='CLERK' OR JOB='MANAGER')
        and
        sal>2000;
        
---LIKE OPERATOR
--where ColumnName like pattern
--where ColumnName not like pattern
--pattern consist of alphabets, digits, wildcard charactor(%--> to replace 0 or many charactor and _ --> to replace exactly one charactor)

--EMPLOYEE DETIALS WHERE NAME STARTS WITH 'S'
select ename from emp 
        where ename like 'S%';

--EMPLOYEE details WHERE NAME ENDS WITH 'S'
select * from emp 
        where ename like '%S';

--EMPLOYEE DETAILS WHERE NAME CONTAINS 'S'
select * from emp 
        where ename like '%S%';
        
--EMPLOYEE DETAILS WHERE 2ND CHARCATOR IS 'A'
select * from emp
        where ename like '_A%'

--EMPLOYEE DETAILS WHERE 2nd CHARACTOR FROM LAST IS 'E'
select * from emp
        where ename like '%E_'

--EMPLOYEE EARNING 3DIGIT SALARY
select * from emp
        where sal like '___'
        
--EMPLOYEE JOINED IN 1981
select * from emp
        where hiredate like '%81'
        
--EMPLOYEE JOINED IN JAN MONTH
select * from emp
        where hiredate like '%JAN%'
        
--EMPLOYEE JONED IN JAN AND DEC MONTH
select * from emp 
        where hiredate like '%JAN%' and 
        hiredate like '%DEC%'

--EMPLOYEE JOB IS CLERK AND CONTAINS MAN
select * from emp
        where job in ('CLERK','%MAN%')
        
select * from emp 
        where job='CLERK' OR
        job like '%MAN%'
        
--SEARCH NAME CONTAINS SPECIAL CHARACTOR,
select * from emp where ename like '%\%%' escape '\';
--inplace of \ we can use any sprecial charctor but \ is recomended.

--shiv_kumar_pandey
select * from emp where ename like '%\_%\_%' escape '\';

--IS OPERATOR
--it is used when comparition based on NULL/NOT NULL.
--where colnName IS NULL
--where colnName IS NOT NULL

--EMPLOYEE WHOSE COMMINTION IS NULL
select * from emp where comm is null
select * from emp where comm is not null

--list of tables created by user
select * from tab