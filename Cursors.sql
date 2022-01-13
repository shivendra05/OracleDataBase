--inline cursor
------this cursor used immidiatly after DML command----------

select * from employee;
set serveroutput on;


declare
veno employee.eid%type;
begin 
veno:=&eid;
delete from employee where eid=veno;
if SQL%found then
dbms_output.put_line('record deleted  '||veno);
else
dbms_output.put_line('Unable to deleted record  '||veno);
end if;
end;
/

--2. update the employee class data.
select * from employee;


declare 
empgender employee.gender%type;
id employee.eid%type;
begin
empgender:='&getgender';
id:=&empid;
update employee set GENDER=empgender where EID=id;
if SQL%found then
dbms_output.put_line('data updated '||id);
else
dbms_output.put_line('Unable to update data '||id);
end if;
end;
/


--display student record.. with the help of loops and cursors.... %found...%notfound...%rowcount...
select * from student;
set serveroutput on;


declare
cursor c1 is select rollnum,name,m1,m2,m3 from student;
rollnum student.rollnum%TYPE;
name student.name%TYPE;
m1 student.m1%TYPE;
m2 student.m2%TYPE;
m3 student.m3%TYPE;
begin
open c1;
loop
fetch c1 into rollnum,name,m1,m2,m3;
dbms_output.put_line(rollnum||'--'||name||'--'||m1||'--'||m2||'--'||m3);
exit when c1%notfound;
end loop;
end;
/



--display student record.. with the help of loops and cursors.... %found...%notfound...%rowcount...
select * from student;
set SERVEROUTPUT on; 


declare 
cursor c1 is select rollnum,name,m1,m2,m3 from student;
rollnumber student.rollnum%type;
name student.name%type;
m1 student.m1%type;
m2 student.m2%type;
m3 student.m3%type;
total student.total%type;
result student.result%type;
begin
open c1;
fetch c1 into rollnumber,name,m1,m2,m3;
while (c1%found)
loop
fetch c1 into rollnumber,name,m1,m2,m3;
dbms_output.put_line(rollnumber||'-'||name||'-'||m1||'-'||m2||'-'||m3);
end loop;
end;
/


--display student record.. with the help of loops and cursors.... %found...%notfound...%rowcount...
select * from student;
set SERVEROUTPUT on; 


declare 
cursor c1 is select rollnum,name from student;
roll student.rollnum%type;
name student.name%type;
begin
for i in c1
loop
dbms_output.put_line(i.rollnum||'--'||i.name);
end loop;
end;
/

declare 
cursor c1 is select * from student;
begin
for i in c1
loop
dbms_output.put_line(i.rollnum||'--'||i.name||'--'||i.m1||'--'||i.m2||'--'||i.m3||'--'||i.result);
end loop;
end;
/

