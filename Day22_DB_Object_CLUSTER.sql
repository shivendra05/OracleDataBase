--CLUSTER.
/*
CLUSTER IS A DB OBJECT, THAT STORS DB RELATED TWO OR MORE TABLES IN SINGLE MEMORY SPACE.
CLUSER IMPROVES PERFORMANCE OF JOIN OPERATIONS.

CLUSTER TBALES FOLLOWS BELLOW STEPS
        1. CREATE CLUSTER
        2. CREATE INDEX ON CLUSTER
        3. CREATE TABLES
*/
--1. CREATE CLUSTER:
/*
SYNTEX
        CREATE CLUSTER <NAME> (COLUMN_NAME DATATYPE(SIZE),.....)
*/
create cluster c1 (d number(2))

--2. CREATE INDEX ON CLUSTER:
create index create_ind1 on cluster c1

--3. ADDING TABLES TO CLUSTER:
--TABLES WHICH ARE FREQUENTLY INVOLVED ON JINED OPERATION THOSE TABLES ARE CLUSTERED TABLES.

create table dept99(d number(2),dname varchar(20)) 
        cluster c1(d)--d number(2) should be same as c1(d number(2))

insert into dept99 values(10,'IT')
insert into dept99 values(20,'ECE')
insert into dept99 values(30,'CSE')


create table dept999(d number(2), dname varchar(20), empno number(5))
        cluster c1(d)

insert into dept999 values(1,'IT',12)
insert into dept999 values(60,'Mach',123)
insert into dept999 values(90,'Elect',21)


--BOTH TABLE DATA STORED IN CLUSTER C1 AND ORGENIZED BASED ON 'D' WISED. AND IT IS CALLED CLUSTER ID

select table_name from user_tables
        where cluster_name='C1'

drop cluster c1

drop cluster c1 including tables

