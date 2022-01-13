--DISTINCT CLAUSE
--use to eliminate duplicate values from the result of select statement.
/*
DISTINCT COLUMN_NAME
DISTINCT COL1,COL2
*/
select * from tab
select * from all_users
select * from emp

create table customer (cid number(8), cname varchar(20), cstate char(2), country char(3));
insert into customer values (&cid,&cname,&cstate,&country)
select * from customer

--SELECT STATE FROM CUTOMER
select cstate from customer
select distinct cstate from customer

--SELECT STATE, COUNTRY FROM CUSTOMER
select cstate, country from customer
select distinct cstate, country from customer
