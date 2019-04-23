--ADDING CONSTRAINTS TO AN EXSTING TABLE.
/*
ALTER COMMAND IS USED TO ADD CONSTRAINS TO AN EXISTING TABLE.
*/
select * from tab order by 1

create table emp5(empno number(10),ename varchar(20), sal number(10),dno number(5))

--ADDING PRIMARY KEY.
/*
ALTER TABLE <TABLE_NAME>
ADD <CONSTRAINT <NAME>>
PRIMARY KEY (<COLUMN_NAME>)
*/

alter table emp5
        add constraints pk_emp5
        primary key (empno)


--ADDING CHECK CONSTRAINTS.
/*
ALTER TABLE <TABLE_NAME>
        ADD CONSTRAINT <CONSTRAINT_NAME>
        CHECK (CONDITION)
*/

alter table emp5
        add constraints check_emp5
        check(sal>=3000)
/*
IF ALRAEDY HAVE DATA WHERE SAL>3000 DOES NOT SATISFY CONDITION, ADD <NOVALIDATE>
SYNTEX.

ALTER TABLE <TABLE_NAME>
        ADD CONSTRAINT <CONSTRAINT NAME>
        PRIMARY KRY <COLUMN_NAME> NOVALIDATE
*/


--ADDING FOREIGN KEY.
/*
ALTER TABLE <TABLE_NAME>
        ADD CONSTRAINT <CONSTRAINT_NAME>
        FOREIGN KEY (COLUMN_NAME) 
        REFERENCES PARENT_TABLE_NAME(COLUMN_NAME)
*/
create table dept5(dno number(10), dname varchar(20))

alter table dept5
        add constraints fk_dept5
        foreign key (dno)
        references emp5(dno)

--CHANGING NULL TO NOT NULL
/*
ALTER TABLE TABLE_NAME
MODIFY (COULMN_NAME NOT NULL)
*/

alter table emp5
        modify ename not null


--DROPPING CONSTRAINTS,
/*
ALTER TABLE <TABLE_NAME>
        DROP CONSTRAINT <CONSTRAINT_NAME>
*/

--DROPPING PRIMARY KEY CONSTRAINTS. 
alter table emp5
        drop constraints pk_emp5

--DROPPING CHECK CONSTRAINTS
alter table emp5
        drop constraints check_emp5

--DROPPING ALL RELATED CONSTRAINTS
alter table emp5
        drop primary key cascade



---USER CONSTRAINTS.
/*
IT IS A SYSTEM TABLE OR DATA DECTIONARY TBALE THAT STORES INFORMAION ABLUT CONSTRAINTS DECLARED IN A TABLE.
*/

select * from tab order by 1

create table dept2(dno number(10) primary key, dname varchar(20))
insert into dept2 values(1,'manager')
insert into dept2 values(2,'clerk')
insert into dept2 values(3,'salesman')
select * from dept2

create table emp2(empno number(20) constraints pk_emp2 primary key,
                        ename varchar(20) not null,
                        sal number(10,2) check (sal>5000),
                        dno number(10) references dept2(dno))
insert into emp2 values(100, 'shivendra', 300000, 1)
insert into emp2 values(101, 'shiv', 400000, 1)
insert into emp2 values(102, 'shivam', 200000, 2)
select * from emp2


--DISPLAY LIST OF CONSTRAINTS DECLARED IN EMP2 TABLE

select constraint_name,
        constraint_type
        from user_constraints
        where table_name ='EMP2'--TABLE NAME I CAPITAL LETTERL.

select constraint_name,
        constraint_type
        from user_constraints
        where table_name='DEPT2'


--RENAMING CONSTRAINTS.

ALTER TABLE DEPT2
        RENAME CONSTRAINT SYS_C004145 TO PK_DEPT2

SELECT CONSTRAINT_TYPE,
        CONSTRAINT_NAME
        FROM USER_CONSTRAINTS
        WHERE TABLE_NAME='DEPT2'
        
        
--DISBALE/ENABLE CONSTRAINTS.
/*
PROCESS.
1. DISBALE CONSTRAINS
2. COPY DATA
3. UNABLE CONSTRAINTS

ALTER TABLE <TABLE_NAME>
DISABLE/ENABLE CONSTRIANT <CONSTRAINT_NAME>
*/        
        

ALTER TABLE DEPT2
        DISABLE CONSTRAINT PK_DEPT2

INSERT INTO DEPT2
        VALUES(5,'SALES')

ALTER TABLE DEPT2
        ENABLE CONSTRAINTS PK_DEPT2