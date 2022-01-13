set serveroutput on

-- to chane to new line
DBMS_OUTPUT.NEW_LINE
--loop//simple loop exit when()...

declare 
x number:=1;
begin 
loop
DBMS_OUTPUT.PUT_LINE (x);
x:=x+1;
exit when(x=10);
end loop;
end;
/

--loop 2.. while()

declare 
x number:=1;
begin
while(x<=10)
loop
dbms_output.put_line(x);
x:=x+1;
end loop;
end;
/

--for loop
begin
for i in 1..10
loop
dbms_output.put_line(i);
end loop;
end;
/

--reverse a String

declare
name VARCHAR(20);
name1 VARCHAR(20);
sizeName number;
begin
name:='&entername';
sizeName:=length(name);
for i in 1..sizeName
loop
name1:= name1||SUBSTR(name,-i,1);
dbms_output.put_line(name1);
end loop;
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
