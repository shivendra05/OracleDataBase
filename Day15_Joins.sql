--JOINS
/*
JOINES IS AN OPERATION USED TO GET DATA FRIM MULTIPLE TABLES,
TO GET DATA FROM TWO OR MORE TABLES, WE NEED TO JOIN TBALES

TYPES OF JOIN.
1. EQUI JOIN.
2. OUTER JOIN
        2.1 LEFT OUTER JOIN
        2.2 RIGHT OUT JOIN
        2.3 FULL OUTER JOIN
3. NON EQUI JOIN
4. SELF JOIN
5. NATURAL JOIN
6. CROSS JOIN/CARTISEAN PRODUCT.
*/

--1. EQUI JOIN.
/*
WE USE EQUALS (=) OPERATOR FOR EQUI JOINS.

TO PERFORM EQUI JOIN BETWEEN TWO TABLES, THERE MUST BE A COMMON FIELD,COMMAN COLUMN(BASED ON DATA TYPE)
        NAME OF THE FIELD NEEF NOT TO BE SAME
        PRIMARY AND FOREIGN KEY RELATION ALSO NOT NECESSORY.

SYNTEX:-

SELECT <COLUMN_NAME>
FROM <TABLE_NAME>
WHERE <JOIN CONDITION>

JOIN CONDITION:-
BEASED ON JOIN CONDITION ORACLE JOINS THE REPORCE OF TABLE1 WITH RECORD OF TABLE2

WHERE T1.E = T2.E
WERE CHILD.FK = PARENT.PK
*/
--DISPLAY EMPNO, ENAME,SAL,DNAME,LOC. DEPT(DNAME,LOC) AND EMP(EMPNO, ENAME,SAL,DNAME)
select * from tab order by 1
select * from emp
select * from dept

select constraint_name, constraint_type
        from user_constraints
        where table_name='EMP'
        
select constraint_name, constraint_type
        from user_constraints
        where table_name='DEPT'

select empno, ename, sal, emp.deptno,  dept.deptno, dname, loc
        from emp , dept
        where emp.deptno=dept.deptno

--USE ALIAS ON TABLE NAME FOR FASTER EXECUTION.

select * from dept
select * from emp
select e.empno, e.ename, e.sal, d.dname, d.loc
        from emp e, dept d
        where e.deptno=d.deptno

--DISPLAY EMPNO, ENAME,SAL,DNAME,LOC WHERE LOCATION='NEW YORK' DEPT(DNAME,LOC) AND EMP(EMPNO, ENAME,SAL,DNAME)

select e.empno, e.ename, e.sal, d.dname,d.loc
        from emp e, dept d
        where e.deptno=d.deptno
                and
              d.loc='NEW YORK'
// IN WHERE CLAUSE, CONDITIONS ARE EXECUTED FROM BOTTOM.

/*
WE CAN WRITE JOIN QURIES IN TWO WAYS.
1. NATIVE OR ORACLE STYLE
2. ANSI STYLE,  IT IS INTRODUCES IN ORACLE 9i.
        -QURIES WRITTEN IN ANSI, CAN BE MOVED ONE TO ANOTHER DATABASE WITHOUT MAKING NAY CHNAGES.
        -NAMES ARE SEPARATED BY KEY WORDS AND USE 'ON' CLAUSE OR 'USNING' CLAUSE FOR JOIN CONDITION 
*/

--DISPLAY EMPNO, ENAME, SAL, DNAME, LOC USING ANSI.
select empno,ename, sal, dname, loc
        from emp e join dept d
        on e.deptno=d.deptno

--USING CLAUSE

select empno, ename, sal, dname, loc
        from emp e join dept d
        using (deptno)

/*IF WE ARE USING, 'USING CLAUSE' IT SHOULD NOT USE TABLE ALIAS.
*/
--select e.ename, e.empno, e.sal, d.loc,d.deptno--ERROR CONT USE ALIAS FOR COMMON COLUMN
select e.ename, e.empno, e.sal, d.loc,deptno
        from emp e join dept d
        --using (e.deptno)--ERROR CAN USE ALIAS
        using (deptno)


--2. OUTER JOIN
/*
EQUI JOIN RETURNS ONLY MATHCING RECORDS BUT CANT RETURN UNMATCHED RECORDS, TO GET UNMATCHD RECORDS PERFORM OUTER JOIN
1. LEFT OUTER JOIN
2. RIGHT OUT JOIN
3. FULL OUTER JOIN
*/

--2.1 LEFT OUTER JOIN.
/*
IT RETRUNS ALL ROWS(MATCHED+UNMATCHED) FROM LEFT SIDE TABLE AMD MATCHED ROWS FROM RIGHT SIDE TABLE
*/
--DISPLAY EMPNO,ENAME,SAL,DNAME,LOC, ANSI
select e.ename,e.empno,e.sal,d.dname,d.loc
        from emp e left outer join dept d
        using (deptno)

--or 
select e.ename,e.empno,e.sal,d.dname,d.loc
        from emp e left outer join dept d
        on e.deptno=d.deptno

--or 

select e.ename,e.empno,e.sal,d.dname,d.loc
        from emp e, dept d
        where e.deptno = d.deptno(+)



--2.2 RIGHT OUTER JOIN.
/*
IT RETRUNS ALL ROWS(MATCHED+UNMATCHED) FROM RIGHT SIDE TABLE AMD MATCHED ROWS FROM LEFT SIDE TABLE
*/
--DISPLAY EMPNO,ENAME,SAL,DNAME,LOC, ANSI

select e.ename,e.empno,e.sal,d.loc,d.dname
        from emp e right outer join dept d
        on e.deptno = d.deptno

--or

select e.ename,e.empno,e.sal,d.loc,d.dname
        from emp e right outer join dept d
        using (deptno)

--or

select e.ename,e.empno,e.sal,d.loc,d.dname
        from emp e,dept d
        where e.deptno (+) = d.deptno
        
        
--2.2 FULL OUTER JOIN.
/*
IT RETRUNS ALL ROWS FROM BOTH THE TABLES
*/
--DISPLAY EMPNO,ENAME,SAL,DNAME,LOC, ANSI

select e.empno,e.ename,e.sal,d.dname,d.loc
        from emp e full outer join dept d
        on e.deptno = d.deptno

select e.*,d.*
        from emp e full outer join dept d
        on e.deptno = d.deptno
--or

select e.empno,e.ename,e.sal,d.dname,d.loc
        from emp e full outer join dept d
        using (deptno)
        
--or

select e.empno,e.ename,e.sal,d.dname,d.loc
        from emp e, dept d
        where e.deptno(+) = d.deptno
  union
select e.empno,e.ename,e.sal,d.dname,d.loc
        from emp e, dept d
        where e.deptno = d.deptno(+)               
       

--3. NON EQUI JOIN.
/*
PERFORMING JOIN OPERATION BETWEEN TWO TABLES NOT BASED ON COMMON FIELDS CALLED NON EQUI JOIN.
THIS JOIN IS NOT BASED ON '=',INSTEAD IT IS BASED ON <,>,<=,>= OPERATORS
*/


select e.empno, e.ename,e.sal,s.grade
        from emp e, salgrade s
        where e.sal between s.losal and s.hisal


select e.empno, e.ename,e.sal,s.grade
        from emp e, salgrade s
        where e.sal between s.losal and s.hisal
                and
         s.grade=3
         
                 
--4.SELF JOIN
/*
JOINING A TABKE TO ITSELF IS CALLED SELF JOIN.
TO PERFORM SELF JOIN, WE CREATE 2 ALIAS OF SAME TABLE.
EMP X, EMP Y
*/        
        
--DISPLAY ENAME,MGRNAME(DISPLAY EMPLOYEE IS A MANAGER) ?        
select * from tab order by 1 
create table e3 (empno number(5),ename varchar(20),mgr number(5))       
insert into e3 values(1,'a',null)     
insert into e3 (empno,ename,mgr) values (2,'b',1)        
insert into e3 values(3,'c',1)
insert into e3 values(4,'d',2)
insert into e3 values(5,'a',3)

alter table e3
        add constraint pk_e3
        primary key (empno)


alter table e3
        add constraint fk_e3
        foreign key (mgr)
        references e3(empno)
        
select constraint_type, constraint_name
        from user_constraints
        where table_name='E3'       
        
update e3
        set ename='e'
        where empno=5      
select * from e3 



select * from emp

--SELECT EMPLOYEES EARNING SAME SALARY
select x.ename,x.sal
        from emp x, emp y
        where x.sal=y.sal
         and 
        x.empno<> y.empno
           
--SELECT EMPLOYEE JOINED ON SAME DATE.
select x.ename,x.hiredate
        from emp x,emp y
        where x.hiredate=y.hiredate
        and
        x.empno<>y.empno        
        
        
        
/*
TEAMS,
ID      COUNTRY
1       IND
2       AUS
3       SA

OUTPUT:-
IND VS AUS
INS VS SA
AUS VS SA
*/        

create table teams(id number(5),country varchar(4))
insert into teams values(1,'IND')
insert into teams values(2,'AUS')
insert into teams values(3,'SA')
select * from teams

select x.country||'vs'||y.country
        from teams x,teams y
        where x.id< y.id


--NATURAL JOIN
/*
NATUREAL JOIN IS SIMILAR TO EQUI JOIN BUT TO PERFORM NATURAL JOIN, COULMN NAME MUST BE SAME.
IT IS INTRODUCES IN ORACLE 9i AND POSSIBLE ONLY FOR ANSI
*/

select e.ename,d.loc
        from emp e natural join dept d


--CROSS JOIN
/*
A CROSS JOIN RETURNS CROSS PRODUCT OF TWO TABLES. IT IS ASLO CALLED AS CARTIESIAN PRODUCT
*/

--CALCULATE DEPT WISE TOTAL SALRY.
/*
OUTPUT

DEPTNAME SAL_SUM
ACCOUNT 32382
SALES   42389
*/


select d.dname, sum(e.sal) as DepSal_sum
        from emp e, dept d
        where e.deptno = d.deptno
        group by d.dname
                


