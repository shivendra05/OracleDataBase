--INTREGRITY CONSTRAINT.
/*
INTEGRITY CONSTRAINT IS A RULE TO INSURE THE DATA QUALITY AND DATA CONSISTANCTY
USING INTEGRITY CONSTRAINT WE CAN PREVENT AN USER TO ENTER INVALID DATA, IF WE USE INTEGRITY CONSTRAINT TO STORE DATA, IT ENSURES DATA IS VALID
BUT IF WE DONT USE IC TABLE DATA ,MAY OR MAY NOT BE VALID.

DATABASE, 1. ENTITY ENTEGRITY, 2. DOMAIN ENTEGRITY, 3. REFERENTIAL ENTEGRITY.
1. ENTITY ENTEGRITY,    1. UNIQUE KEY, 2. PRIMARY KEY.
2. DOMAIN ENTEGRITY,    1. NOT NULL, 2. CHECK, 3. DEFAULT.
3. REFERENTIAL ENTEGRITY,       1. FOREIGN KEY 

CONSTRAINT CAN BE DECLARED AT TWO LAVEL.
1. COLUMN LEVEL
2. TABLE TEVEL
*/
--1. COLUMN LEVEL,      IF CONSTRAINT IS DECLARED IMMIDIATLY AFTER DECLARINNG COLUMN THEN IT IS CALLED COLUMN LAVEL.
--1.1 NOT NULL,  IT DOESNT ALL NULL VALUES.

select * from tab
select * from all_users
create table emp10(empno number(10), ename varchar(20) not null)
select * from tab
select * from emp10
insert into emp10(empno,ename) values(10,'shivendra')
insert into emp10 values(1,'pandeyji')
insert into emp10 values(3,'pandeyji')--ALLOWS DUPLICATE
insert into emp10 values(2,'')--ERROR,  CANT INSERT NULL VALUES BECAUSE WE HAVE DEFIEND CONSTRAINED AS NOT NULL
insert into emp10(empno) values(3)--ERROR,  CANT INSERT NULL VALUES BECAUSE WE HAVE DEFIEND CONSTRAINED AS NOT NULL

select * from emp10


--1.2 UNIQUE,  IT DOESNT DOESNT ACCEPT DUPLICATE VALUES FOR UNIQUE CONSTRAINT COLUMN.

create table emp11 (empno number(10),email varchar(20) unique)
insert into emp11(empno, email) values (1,'shiv@gmail.com')
insert into emp11(email,empno) values('pandey@gmail.com',2)
insert into emp11 values(3,'shiv@gmail.com')-- ERROR,   CANT INSERT DUPLICATE BECAUSE IS DECLARED AS UNIQUE
insert into emp11 values(3,'')--ALLOWS NULL VLAUES
insert into emp11(empno) values (4)--ALLOWS NULL VALUES

select * from emp11

--1.3 PRIMARY KEY,  IT DOESNT ACCEPT DUPLICATE AND NULL VALUES. IT IS A COMBINATION OF NOT NULL AND UNIQUE VLAUES.

create table emp12(empno number(10) primary key, ename varchar(20))
insert into emp12(empno,ename) values(1,'shivendra')
insert into emp12(ename,empno) values('shivendra',2)
insert into emp12 values(1,'pandeyJi')--ERROR,  CANT INSERT DUPLICATE FOR PRIMARY KEY CONSTRAINT COLUMN
insert into emp12(ename) values('Divyansh')--ERROR,  CANT INSERT NULL FOR PRIMARY KEY CONSTRAINT COLUMN
insert into emp12 values('','Divyanshi')--ERROR,  CANT INSERT NULL FOR PRIMARY KEY CONSTRAINT COLUMN

select * from emp12

select * from tab
select constraint_name,constraint_type from user_constraints where table_name='emp'
/*
LIMITATIONS,
1. A TABLE ALLOWS ONLY ONE PRIMARY 
2. COLUMN DECLARED WITH LOB CANT BE DECLARED WITH RPIMARY KEY


DIFFERENCE BETWEEN, UNIQUW AND PRIMARY KEY.

UNIQUE KEY, 
1. ALLOWS NULL VALUES
2. A TABLE CAN HAVE 0 OR MORE UNIQUE KEY
PRIMARY KEY, 
1. DOESNT NOT ALLOW NULL AND DUPLICATE VALUES
2. A TABLE CAN HAVE EITHER 0 OR 1 PRIMARY KEY

UNIQUE KEY CANT BE USED A PRIMARY KEY, WHILE PRIMARY KEY CAN BE USED A UNIQUE KEY
*/


--1.4 CHECK,  USED WHEN CONDITION IS BASED ON CONDITIONS.
-- CHECK(CONDITION)
--SAL MUST BE MIN 3000
create table emp13 (empno number(10),sal number(8,2) check(sal>=3000))
insert into emp13 values(1, 5000)
insert into emp13 values(1,2000)
insert into emp13(empno) values(2)
insert into emp13 values(2, 5000)
select * from emp13

/*
CHECK ALLOWS.
1. NULL VALUES
2. DUPLICATE VALUES
*/

--GENDER MUST BE M/F,           gender char(1) check(gender in(M,F))
--AMT SHOULD BE MULTIPLE OF 100,                amt number(10,2) check(mod(amt,100)=0)
--PASSWORD MUST BE MIN OF 8 DIGIT,              pwd varchar(10) check(length(pwd)>=8)

/*
LIMITATIONS.
SYSDATE, CANT BE REFERECNCD IN CHECK CONSTRAINT
*/
create table emp14 (empno number(10) primary key, ename varchar(20) not null, hiredate date check(hiredate=sysdate))--ERROR


--1.5 FOREIGN KEY,  USED TO ESTABLISH RELATIONSHIP BETWEEN TWO TABLE, USED TO REFERANCE PRIMARY KEY.
/*
FOREIGH KEY,
1. ALLOWS DUPLICATE AND NULL VALUES.
2. FOREIGN KEY VALUE SHOULD MATCH WITH PRIMARY KEY
3. AFTER DECLARING FOREIGN KEY, TWO TABLE BECOMES PARENT(PRIMARY KEY TABLE) AND CHIDL(FOREIGN KEY TABLE) 
*/

/*
ORDER OF VALIDATION.
NOT NULL
CHECK
PRIMARY KEY/UNIQUE
FOREIGN KEY
*/

select * from tab
create table dept15 (deptno number(10) primary key, dname varchar(20) unique not null, loc varchar(20))
insert into dept15 values(10,'account', 'hyd')
insert into dept15 values(20,'sales','mum')
select * from dept15

create table emp15 (empno number(10) primary key,ename varchar(15) not null,sal number(15,2) check(sal>=2000),deptno number(20) references dept15(deptno))
insert into emp15 values(1,'shiv',5000.21,10)
select * from emp15
insert into emp15 values(1,'shiv',6000.21,20)--ERROR, PRIMARY KEY CONSTRAINT VOILATION.
insert into emp15 values(2,'',5000,10)--ERROR,NOT NULL CONSTRAINT VOILATION.
insert into emp15 values(3,'shiv',1000.21,10)----ERROR, CHECK CONSTRAINT VOILATION.
insert into emp15 values(2,'shivangi',6000,30)--ERROR, FOREIGN KEY REFERANCE NOT FOUND.
insert into emp15 values(2,'shivangi',6000.21,20)


--SELF REFERENCIAL INTEGRITY.
/*
IF FOREIGN KEY OF ONE TABLE REFERS PRIMARY KEY OF SAME TABLE THENIT IS CALL SELF REFENTIAL INTEGRITY. AND RELATIONSHOP IS CALL RECURSIVE OR UNINARY RELATIONSHIP.
*/

select * from tab
create table emp16(empno number(10) primary key, ename varchar(20) not null, sal number(15,2) check(sal>5000), 
email varchar(20) unique,manager_no number(20) references emp16(empno))
--drop table emp16
select * from tab

insert into emp16 values(1,'shiv',40000,'shiv@gmail.com',null)
insert into emp16 values(2,'shivangi',50000,'shivangi@gmail.com',1)
insert into emp16 values(3,'shivam',30000,'shivam@gmail.com',3)
select * from emp16


--1.6 DEFAULT CONSTRAINT,  USED TO INSERT/PLAEC DEFAULT VALUES TO THE COLUMN.
--SO ID INCASE, WHILE ENTERING DATA, WE FORGET TO INSERT. ORACLE WILL PLACE DAFULT VALUES.
create table emp17 (empno number(10), ename varchar(20),sal number(8), hiredate date default sysdate)
--drop table emp17
insert into emp17(empno,ename,sal) values(1,'shivendra',1000)
select * from emp17
insert into emp17(empno,ename,sal) values(2,'shivangi', 2000)

--DEFAULT RULES
/*
THERE ARE 3 DELETE RULES AND ARE DECLARED WITH FOREIGN KEY
1. ON DELETE NO ACTION
2. ON DELETE CASCADE
3. ON DELETE SET NULL
*/

--1. ON DELETE NO ACTION. PARENT RECORD CANT BE DELETED IF ASSOCIATED WITH CHILD RECORD. 
select * from tab
create table dept18(deptno number(10) primary key, dname varchar(20))
insert into dept18 values(10,'manager')
select * from dept18
insert into dept18 values(20, 'clerk')

create table emp18(empno number(10),ename varchar(20),deptno number(10) references dept18(deptno))
insert into emp18 values(1,'shivendra',10)
insert into emp18 values(2, 'shivam',20)
select * from emp18


delete from dept18 where deptno=10--ENTEGRITY VOILATION. DEPNDENT TABLE....CHILD RECORD FOUND.


--2. ON DELETE CASCADE. IF PARENT RECORD DELETEED IT WILL DELETE ASSOCIATED CHILD RECORD AS WELL. 
select * from tab
create table emp19(empno number(10) primary key,ename varchar(20) not null,hiredate date default sysdate,
email varchar(20) unique, sal number(10) check(sal>2000),deptno number(15) references dept18(deptno) on delete cascade)
--drop table emp19
insert into emp19(empno, ename,email,sal,deptno) values(1,'shiv','shiv@gmail.com',300000,10)
insert into emp19(empno, ename,email,sal,deptno) values(2,'shivam','shivam@gmail.com',100000,20)
select * from emp19
select * from dept18

delete from dept18 where deptno=20--voilation.----check in other version of oracle, it should allow to delete record as child table has on delete cascade 

--3. ON DELETE SET NULL. IF PARENT RECORD DELETEED THEN IT IS DELETED WITHOUT  DELTEING CHILD RECORD BUT FOREIGN KET SET TO NULL.

create table emp20(empno number(10) primary key,ename varchar(20) not null,hiredate date default sysdate,
email varchar(20) unique, sal number(10) check(sal>2000),deptno number(15) references dept18(deptno) on delete SET NULL)
--drop table emp19
insert into emp20(empno, ename,email,sal,deptno) values(1,'shiv','shiv@gmail.com',300000,10)
insert into emp20(empno, ename,email,sal,deptno) values(2,'shivam','shivam@gmail.com',100000,20)
select * from emp20
select * from dept18

delete from dept18 where deptno=10--voilation.----check in other version of oracle, it should allow to delete and set record to null as child table has on delete set null



--TABLE LAVEL CONSTRAINTS.
/*
IF CONSTRAINTS IS DECLARED AFTER DECLARING ALL COLUMNS, TEHN IT IS CALLED AS TABLE LAVEL CONSTRAINTS.
USE TABLE LAVEK TI DECLARE CONSTRAINTS FOR MILTPLE COLUMNS
*/

create table managers(mgrno number(10) constraints pk_mgr primary key,
                        mname varchar(20), 
                        start_date date, 
                        end_date date,
                        constraints ck_mgr check (start_date<end_date))

insert into managers values(1,'shivendra',sysdate,'01-jan-2016')--ERROR
insert into managers values(1,'shivendra','01-jan-2016',sysdate)
select * from managers



--COMPOSITE PRIMARY KEY.
/*
DELCARING COMBINATION OF COLUMN NAME AS A PRIMARY KEY, CALLED COMPOSITE PRIMARY KEY.
COMPOSITE PRIMARY KEY, COMBINATION SHOULD NOT BE DUPLICATE
*/
select * from tab
create table emp14(efname varchar(15),
                   elname varchar(15),
                   dname varchar(10),
                   dob date,
                   constraints pk_emp14 primary key(efname,elname,dname))

insert into emp14 values('shiv','pandey','clerk','05-jan-1990')
insert into emp14 values('shivam','pandey','manager','06-jan-1991')
insert into emp14 values('shivangi','mishra','manager','07-jun-1992')
insert into emp14 values('shiv','pandey','clerk','08-july-1994')--ERROR---UNIQUE CONSTRAINT VOILATION.
select * from emp14

/*CONSTRAINT CANT BE TABLE LAVEL.
NOT NULL.


CAN BE A TABLE LAVEL CONSTRAINTS.
UNIQUE CONSTRAINTS
PRIMARY KEY CONSTRAINTS
FOREIGN KEY CONSTAINTS
CHECK CONSTRAINTS
*/