--list of tables created by user
select * from tab

--list of users
select * from all_users;

--list of data base name
select * from global_name;

--select ename and anual salary
select ename, sal*12 from emp
--ALIAS
--alias means another name or alternative name, it is of two type
--1. column alias 2. table alias
--1. column alias. used to chnage column name. e.g. columnName as <alias>
select ename, sal*12 as annsal from emp;
select ename, sal*12 as "annual sal" from emp;

select * from emp
--DISPLAY ENAME, SAL, HRA, DA, TAX AND TOTAL SALARY
--HRA=30% ON SAL
--DA=20% ON SAL
--TAX=10% ON SAL
--TOTAL=SAL+HAR+DA+TAX
select ename, sal, 
        (sal*.30) as hra, 
        (sal*.20)as da, 
        (sal*.10)as tax, 
        sal+((sal*.30)+(sal*.20)+(sal*.10)) 

        as tltsal 
    from emp
    
--2. table alias. used to change table name. e.g. tableName <alias>
select * from emp e;
    
---ORDER BY CLAUSE
--used to sort rows based on one or more column either in ASC or DESC order.
--syntex --[]-->conditional
/*SELECT <CLOUMN_NAME>
FROM <TABLE_NAME>
[WHERE <CONDITION>]
ORDER BY <COLUMN_NAME> [ASC/DESC]
*/
--ARRANGE EMP LIST SALARY WISE IN ASC ORDER.
select * from emp
        order by sal asc;
        
--ARRANGE EMP LIST SALARY WISE IN DESC ORDER.
select * from emp
        order by sal desc
        
--in order by clause, we can use column name or we can also use column no.
select * from emp
        order by 6 asc
        
--order by is not based on table, its based on select list.
select ename, empno, job, sal, deptno
        from emp
        order by 4 desc

--ARRANGE EMP LIST DEPARTMENT WISE ASC, AND WITHIN THE DEPARTMENT SALARY WISE DESCENSING ORDER.
select empno, ename, job, deptno, sal
        from emp
        order by 4 asc, 5 desc

--EMP LIST WORKING AS CLERK OR MANAGER AND ARRNAGE LIST SALARY WISE DESC ORDER.
select * from all_users
select * from tab
select * from emp

select * from emp
        where job in ('CLERK','MANAGER')
        order by sal desc

--LIST OF EMP JOINED IN 1981 YEAR AND ARRANGE LIST NAME ASC ORDER.
select * from emp
        where hiredate like '%81'
        order by ename

--create student table, insert data, sort by avg desc, m desc, p desc.
select * from student

alter table student 
        add C number

update student set m=90,p=90,c=90 where id='245341'
update student set m=10,p=50,c=90 where id='212342'
update student set m=80,p=80,c=80 where id='234543'
update student set m=30,p=90,c=90 where id='27u344'

select * from student
        order by (m+p+c)/3 desc, m desc, p desc


--CONTROLLING NULL
--in sorting NULL, treaded high in DESC order they are arranged first. In ASC order they are arranged last. 
--to control NULL use NULLS FIRST/LAST option.

--ARRANGE LIST COMM WISE DESC ORDER, WHOSE COMM ARE NULL SHOULD BE DISPLAYED LAST.
select * from emp
        order by comm desc nulls last

