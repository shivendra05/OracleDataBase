----Excaption handling in pl/sql
set serveroutput on;
-- to chane to new line
DBMS_OUTPUT.NEW_LINE

---1. zero divide
declare
a number;
b number;
c number;
begin 
a:=&num1;
b:=&num2;
c:=a/b;
dbms_output.put_line('Division of bumbers: '||a||' and :'||b||' is: '||c);
end;
/

-----new code with exception handle

declare
a number;
b number;
c number;
begin 
a:=&num1;
b:=&num2;
c:=a/b;
dbms_output.put_line('Division of bumbers: '||a||' and :'||b||' is: '||c);
exception 
when zero_divide then
dbms_output.put_line('Recomanded dont enter divisor as a 0 number');
end;
/

---1. value_error..values exceed the range or number is being inilized wiht char
declare
num number(3);
gender varchar(1);
name varchar(20);
begin
num:=&number;
gender:='&gender';
name:='&name';
DBMS_OUTPUT.PUT_LINE('Your data is: '||'number='||num||'gender='||gender||'name='||name);
exception 
when value_error then
DBMS_OUTPUT.PUT_LINE('Incorrect values is being passed');
END;
/

---NO_DATA_FOUND---when searched recored is not in the DB.
---too_many_values---when normal variable tries to multiple vlaues.
---sqlerrm..sqlcode
select * from emp

declare 
num number;
name varchar(20);
begin
num:=&empNumber;
--select ename into name from emp where eid=num;
select ename into name from emp where eid<num;
dbms_output.put_line('name of the emp is--> '||name);
exception 
when too_many_rows then
dbms_output.put_line('Multiple matches for your searhc:--');
when no_data_found then
dbms_output.put_line('search id doesnt exist');
when others then
dbms_output.put_line(sqlcode);
end;
/

----user defined

declare 
num number;
name varchar(20);
empid_error exception;
begin
num:=&empNumber;
--select ename into name from emp where eid=num;
if num>3 then
raise empid_error;
end if;
select ename into name from emp where eid=num;
dbms_output.put_line('name of the emp is--> '||name);
exception 
when empid_error then
dbms_output.put_line('empid more than 3 not alowed');
end;
/


----raised exception

declare 
num number;
name varchar(20);
empid_error exception;
begin
num:=&empNumber;
--select ename into name from emp where eid=num;
select ename into name from emp where eid=num;
dbms_output.put_line('name of the emp is--> '||name);
if num>3 then
raise_application_error(-20001,'emp id more than 3 not allowed');
end if;
end;
/
