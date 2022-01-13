select * from emp
set serveroutput on
-- to chane to new line
DBMS_OUTPUT.NEW_LINE


--1. function to get name of the Employee 
create or replace function get_ID(n number)
return varchar2
is 
fname emp.ename%type;
begin
select ename into fname from emp where eid=n;
return fname;
end;
/

--execute  function

select get_ID(2) from dual;

--execute  function
declare 
acc number;
name varchar2(20);
begin 
acc:=&Account_number;
name:=get_ID(2);
dbms_output.put_line('---------');
dbms_output.put_line(name);
end;
/



--2. create a funciton to perform actions like add/sub/div/multi

create or replace function calculation(num1 number, num2 number,operation char)
return number
is
result number;
begin

if operation='+' then
result:=num1+num2;
elsif operation='-' then
result:=num1-num2;
elsif operation='*' then
result:=num1*num2;
elsif operation='%' then
result:=num1/num2;
else
result:=0000;
end if;
return result;
end;
/

---execute function
select calculation(3,4,'*') from dual

---execute function
declare 
num1 number;
num2 number;
op varchar(2);
result number;
begin
num1:=&number1;
num2:=&number2;
op:=&operator;
result:=calculation(num1,num2,op);
dbms_output.put_line('-----------------');
dbms_output.put_line(result);
end;
/

--create function to calculate tax pais by the employee

create or replace function getTax(sal number) return number
is
taxAmount number;
tltsal number;
pct number;
begin
tltsal:=sal*12;

if tltsal<=250000 then
pct:=0;
elsif tltsal>=250000 and tltsal<=500000 then
pct:=5;
elsif tltsal>=500000 and tltsal<=1000000 then
pct:=10;
else
pct:=20;
end if;

taxAmount:= (tltsal+(tltsal*pct)/100);
return taxAmount;
end;
/

--execution
select getTax(1000) as sal from dual;
select getTax(10000) as sal from dual;

---execution

declare
salary number;
tlttax number;
begin
salary:=&sal;
tlttax:= getTax(salary);
dbms_output.put_line('--------');
dbms_output.put_line(tlttax);
end;
/

--function to work with subString(str,start,end) and instr(str,start,end)

create or replace function getLastName(name varchar) return varchar
is 
lName varchar(20);
begin
lName:=substr(name,instr(name,' ',-1,1)+1);
return lName;
end;
/

--execute sql command
select getLastName('shivendra kumar pandey') from dual;

--execute with script
declare
name varchar(25);
lname varchar(20);
begin
name:=&fullname;
lname:=getLastName(name);
dbms_output.put_line('*********************');
dbms_output.put_line(lname);
end;
/

--get salary of employee having eid>=12..

create or replace function getSalary(empid number) return sys_refcursor
is 
c1 sys_refcursor;
begin
open c1 for select esal from emp where eid>=empid;
return c1;
end;
/

--execute script
select getSalary(12) from dual;

--execute script
declare
empid number;
sal_cursor sys_refcursor; 
begin
empid:=&empid;
sal_cursor:=getSalary(empid);
dbms_output.put_line('***************');
dbms_output.put_line(sal_cursor);
end;
/

