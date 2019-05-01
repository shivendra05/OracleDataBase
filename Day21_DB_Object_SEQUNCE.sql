--SEQUENCES
/*
IF A TABLE IS NOT HAIVNG PRIMARY KEY, SEQUENCE IS USED TO GENERATE PRIMARY KEY.
SEQUENCE IS A DB OBJECT USED TO GENERATE VSLUES FOR PRIMARY KEY COLUMNS
SYNTEXT:-
        CREATE SEQUENCE <SEQ_NAME>
        [START WITH <NAME>]
        [INCREMENT BY <VALUE>]
        [MAX_VALUE <VALUE>]
        [MIN_VALUE <VALUE>]
        [CYCLE/NOCYCLE]
        [CACHE <SIZE>/NOCACHE]
*/

create sequence s1
        start with 1
        increment by 1
        maxvalue 5

/*
SEQUENCE HAS TWO PSUEDO COLUMNS
1. current,     RETURNS CURRENT VALUE
2. NEXTVAL,     RETURN NEXT VALUE

SEQ_NAME.CURRENT,       RETURNS CURRENT VALUE
SEQ_NAME.NEXTVAL,       GENERATES NEXT VALUE AND RETUENS IT.

*/
select * from tab
create table emp3(empno number(10),ename varchar(20))
insert into emp3 values(s1.nextval,'shivendra')
select * from emp3
insert into emp3 values(s1.nextval,'shiv')
insert into emp3 values(s1.nextval,'ram')


--NOCYCLE/CYCLE
/*
        DEFAULT IS NOCYCLE
        IF SEQUENCE CREATED WITH NOCYCLE, IT STARTS FROM 'START WITH' AND GENERATE UPTO 'MAX VLAUE' THEN IT STOPS

        IF SEQUENCE CREATED WITH CYCYLE, IT START FROM 'START WITH' AND GENERATES UPTO MAX VALUE. AFTER REACHING 'MAX VALUE' THEN IT WILL BE RESET TO 'MIN VALUE'
*/

create sequence s2
        start with 2
        increment by 1
        maxvalue 4
        minvalue 1
        cycle
        cache 3

create table emp4(empno number(10), ename varchar(20))
insert into emp4 values(s2.nextval,'A')
insert into emp4 values(s2.nextval,'B')
insert into emp4 values(s2.nextval,'C')
insert into emp4 values(s2.nextval,'D')
insert into emp4 values(s2.nextval,'E')
insert into emp4 values(s2.nextval,'F')
insert into emp4 values(s2.nextval,'G')
insert into emp4 values(s2.nextval,'H')
insert into emp4 values(s2.nextval,'I')

select * from emp4


desc user_sequences

select min_value,max_value,increment_by,cycle_flag,cache_size
from user_sequences
where sequence_name='S2'

--ALTER SEQUENCE,
alter sequence s2 maxvalue 10

select min_value,max_value,increment_by,cycle_flag,cache_size
from user_sequences
where sequence_name='S2'

alter sequence s2 cache 4

alter sequence s2 start with 4--ERROR,  ALL PARAMETER CAN BE CHANGED EXCEPT START WITH
drop sequence s2