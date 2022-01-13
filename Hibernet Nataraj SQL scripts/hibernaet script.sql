create table product1 (pno number, pname varchar(20), quantity number,price float);
select * from product1 

create table books (bid number, bname varchar(20), quantity number,bprice float);

drop table books

select * from student
insert into student values(100,'pandey',31,'IT');
insert into student values(102,'Shibbu Pandit',27,'MTech');
insert into student values(103,'Shibbu pandey',28,'CTA');
insert into student values(104,'pandey JI',29,'CS');

select * from product
select * from Hostel

create sequence hostel_seq start with 1 increment by 2


select * from bank_account;
-- to chane to new line
DBMS_OUTPUT.NEW_LINE

--refer table column name with :new for insert/update command
--refer table column name with :old for DELETE command
--trigger, if any user tries to insert into table records that is having amount less then 500....

create or replace trigger hostel_info 
before insert
on Hostel
for each row
begin
if :new.rentamount<500 then
raise_application_error(-2001,'Amount less than 500 cant be deposited');
end if;
end;
/

select * from student


---procedure to return employee name from eid
create or replace procedure getStudName(roll in number,studName out varchar)
is
begin
select sname into studName from student where rollnumber=roll;
end;
/
commit
var name varchar2
execute getStudName(1,:name)
print :name

select * from StudAddress
select * from INH_PERSON_TPCH
select * from STUDENT_TPSC
select * from PERSON_TPSC
select * from  EMPLOYEE_TPSC
select * from  PAYMENT_TPCH

drop table PHONENUMBER;
drop table EMPLOYEE;

select * from  PHONENUMBER
select * from  EMPLOYEE
select * from  DEPARTMENT

select * from  CarCompany
select * from  PERSON_ANNO_OTO