--program to increment emp salary by some amount and if salary is salary goes 
--higher than 10000 than cancle the transaction.
set serveroutput on;
--Writing code for anonymouse Blocks
select * from emp;
select  * from tab;

declare
vamount emp.esal%type;
vid emp.eid%type;
newsal emp.esal%type;
begin
vamount :=&amount;
vid :=&empID;
update emp set esal=esal+vamount where eid=vid;
select esal into newsal from emp where eid=vid;
if newsal>10000 then
dbms_output.put_line('Since salary higher then mentioned..transation is going to be rolledback');
rollback;
else
dbms_output.put_line('commited');
commit;
end if;
end;
/

--create a student table and calaulate the result and insert into table
select * from student;
commit;
drop table student;

create table student (rollnum number not null primary key , 
name varchar(20), m1 number,m2 number, m3 number, 
total float,result varchar(5));

insert into student(rollnum,name ,m1 ,m2 ,m3) values (100,'Shivendra',54,56,78);
select * from student;

insert into student(rollnum,name ,m1 ,m2 ,m3) values (101,'Pavan',32,54,54);
insert into student(rollnum,name ,m1 ,m2 ,m3) values (102,'Rakhi',65,67,56);
insert into student(rollnum,name ,m1 ,m2 ,m3) values (103,'Mohit',78,33,55);
insert into student(rollnum,name ,m1 ,m2 ,m3) values (104,'Vishwash',78,22,22);
insert into student(rollnum,name ,m1 ,m2 ,m3) values (105,'Ravindra',87,44,39);
insert into student(rollnum,name ,m1 ,m2 ,m3) values (106,'Kushal',54,45,45);
insert into student(rollnum,name ,m1 ,m2 ,m3) values (107,'Nagendra',98,97,98);
set serveroutput on;

declare
v_no student.rollnum%type;
vresult student.result%type;
vtotal student.total%type;
s student%rowtype; 
begin
v_no:=&number;
select * into s from student where rollnum=v_no;
vtotal:=s.m1+s.m2+s.m3;
if s.m1>=35 and s.m2>=35 and s.m3>=35 then
vresult:='PASS';
else
vresult:='FAIL';
end if;
dbms_output.put_line(vtotal||'--'||vresult);
update student set TOTAL=vtotal, result=vresult where rollnum=v_no;
commit;
end;
/

--query to modify column data type
alter table student 
modify total number;

describe student;