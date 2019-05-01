--USER DFINED DATA TYPE 
/*
FROM ORACLE 8 ONWARDS, USER CAN CREATE HIS OWN DATA TYPE CALLED USER DEFINED TYPE.

WHEN PREDEINED DATATYPE ARE NOT CREATING OUR REQUIRENTS, WE CAN CREATE OUR OWN DATA TYPE.
THE ADVANTAGE OF USER DEFINED DATA TYPE IS REUSABILITY. I.E. WE CAN CREATE DATA AND WE CAN RE-USE THIS IN NUMBER OF TABLES/

USER DEFINED DATA TYPE ARE OF 3 TYPES
        1. COMPOSITE TYPE OR OBEJCT TYPE
        2. VARRAY 
        3. NESTED TABLE
*/


--1. COMPOSITE TYPE
/*
A COMPOSITE TYPE ALLOWS GROUP OF ELEMENTS OF DIFFRENT DATA TYPES
SYNTEXT:

CREATE TYPE <NAME> AS OBJECT
        (FIELD1 DATATYPE(SIZE),
        FIELD2 DATATYPE(SIZE),
        .....)
*/


create type addr as object (hno varchar2(20), street varchar2(20),city varchar2(10),State_Name char(2))

create table cust(cid number(4),cname varchar2(20), Cust_addr addr)
insert into cust values(10,'1',addr('100a','ampt','hyd','TS'))
insert into cust values(11,'2',addr('101a','SR Nagar','hyd','TS'))
insert into cust values(12,'3',addr('102a','Vivekanand Nagr','Rewa','MP'))

select * from cust

--table_Alias.field.component

select c.cid as Cust_ID,c.cname as Cust_Name,c.Cust_addr.hno as House_Num,c.Cust_addr.street as street,c.Cust_addr.city as city,c.Cust_addr.State_Name as state_name
        from cust c

--UPDATE,
update cust c
        set c.Cust_addr.hno='500b'
        where c.cid=10

select c.cid as Cust_ID,c.cname as Cust_Name,c.Cust_addr.hno as House_Num,c.Cust_addr.street as street,c.Cust_addr.city as city,c.Cust_addr.State_Name as state_name
        from cust c


create type marks as object(Math number(3),Science number(3),English number(3))
create table student_Result(sid number(10),sname varchar2(20),result varchar2(5),tlt_marks marks)

insert into student_Result values(1,'shivendra','PASS',marks(90,80,98)) 
insert into student_Result values(2,'shivam','PASS',marks(80,70,87)) 
insert into student_Result values(1,'shivendra','PASS',marks(50,80,58)) 

select * from student_Result

select sr.sid, sr.sname,sr.tlt_marks.Math,sr.tlt_marks.Science,sr.tlt_marks.English
        from student_Result sr



--VARRAY,
/*
ALLOWS GROUP OF ELEMETS OF SAME DATA TYPE

CREATE TYPE <NAME> IS VARRAY (SIZE) OF DATA TYPE 
 */
create type phone_array is varray(3) of number(10)

create table emp_phones(empno number(10), phone phone_array )
insert into emp_phones values(123,phone_array(213435464,21432543,2143435))

select * from emp_phones
