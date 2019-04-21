--CONVERSION FUNCTIONS
/*
CONVERSION OF TWO TYPES
1. IMPLICIT CONVERSION
2. EXPLICITY CONVERSION
*/

--1. IMPLICIT CONVERSION.       if conversion performed by oracle then it is called implicit conversion.
select 2000+'1000' from dual
--3000, string '1000' converted to integer by Oracle

--2. EXPLICIT CONVERSION.       if conversion performed by user then it is called explicit conversion.
/*
1. to_char()
2. to_date()
3. to_number()
*/

--2.1--converting date to charater.
--dates are convered to charator type to display dates in different formats.
--2.1.1. to_char(date,[format])
/*
year format
YYYY    2017
YY      17
year    twenty seventeen
CC      contuary 21
AD/BC   BC year/AD year
*/

select to_char(sysdate,'YYYY YY YEAR CC BC') from dual

--DISPLAY EMPLOYEE JOINED IN 1980,1982,1987.

select * from emp
        where to_char(hiredate,'YYYY') in (1980,1982,1987)

/*
format month
MM      month number
mon/MON JAN,FEB,MAR..
month/MONTH     JANUARY,FEBRUARY
*/

select to_char(sysdate,'MM MON MONTH') from dual
select to_char(sysdate,'MM MON MONTH') from dual

--EMPLOYEE JOINED IN JAN, MAR,DEC
select * from emp
        where to_char(hiredate,'MM') in (01,03,12)

--EMPLOYEE JOINED IN JAN 1981
select * from emp
        where to_char(hiredate,'YYYYMM') ='198201'

--day format
/*
DDD     day of the year
DD      day of the month
D       day of the week
*/

select to_char(sysdate, 'DDD DD D day Dy') from dual


--on which day india as got independent.
select to_char(to_date('15-AUG-2019'),'DAY DY day dy ') from dual


--DISPLAY EMPOYEE JOINED ON DAY,        SMITH JOINED ON WEDNESDAY
//if date if string then convert to date using to_date()

select ename|| ' JOINED ON '|| to_char(to_date(hiredate),'DAY') as joining_date from emp
or
select ename|| ' JOINED ON '|| to_char(hiredate,'DAY') as joining_date from emp

--WEEK FORMAT.
/*
WW      WEEK OF THE YEAR
W       WEEK OF THE MONTH
*/

select to_char(sysdate,'WW W') from dual



