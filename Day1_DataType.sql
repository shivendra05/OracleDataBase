--Data type is SQL
--datatype sprecifies type of value allowed in the column and Amount of memory allocated for coulumn.

--1. char(p)       , used for fixed size of charactor data and allows data upto 2000 character, allows only charactor
--eg. country_code char(3)
--IND,USA,ENG

--2. varchar2(p) , used for vaiiable lemght of charactor data and allows data upto 4000 charctor, Allows only charactor
--eg. name varchar2(20)
--sachin, shivendra (remaing charactor space will be released)

--3. number(p)  , allows number upto 38 digits
--eg. empid number(3)
--11,100,1000(invalid becasue size if 4)

--4. number(p,s)        ,allows floating point numbers, where p is precision(total number of digits) and s is scale(number of digits after decimal)
--eg. salary number(7,2)
--12345.32,123456.21(invslid as number of digit exceeding lenght size 7)

--5. date       ,allows to enter date and time, but time is optional(if not enter them Oracel will add 12AM). date format must be DD-MM-YY/YYYY HH MM SS occupiese 7 bytes(1 byte for each)
--eg. hiredate date
--01-MAR-19 , 20-OCT-2019, 

--6. timestamp, allows date, time and milisecond
--eg. T timestamp
--01-MAR-2019 2:30:23:10.321

--7. LOBs       , larg Object 7.1 BLOB(Binary LOB), 7.2 BFILE(Binary File), 7.3 CLOB (charactor LOB)
--BLOB and BFILE is used to stor multimedia files like audio, vedio, image upto 4GB.

--creating table in Oracle DB.
--create table <TableName>(colName1 dateType(size),colName2 dataType(size),colName3 dataType(size),colName4 dataType(size),.....)
create table emp(empno number(20),empname varchar(20), job varchar(20),salary number(7,2),hiredata date);

--desc <table>
desc emp;

--insert into <table>(value1,value2,value3,value3,...)
insert into emp values(100,'Raju','clerk',12345.67,'02-MAR-17');

select * from emp;

insert into emp values(101,'Shyam','clerk',12346.57,sysdate);

insert into emp values(102,'Mohan','Manager',12345,'12-APR-2105')

--input values at run time.
--insert into <tableName> values(&f1,&f2,&f3,&f4,....)

insert into emp values(&empno,&empname,&job,&salary,&hiredata)