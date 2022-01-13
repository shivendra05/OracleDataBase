select * from emp;

create or replace package hr
as
procedure hire(eid number, ename varchar, esal number, did number);
procedure fire(id number);
end;
/


create or replace package body hr
as
procedure hire(eid number, ename varchar, esal number, did number)
is 
begin 
insert into emp (eid, ename, esal, did) values (eid, ename, esal, did);
commit;
end hire;
procedure fire (id number)
is 
begin 
delete from emp where eid=id;
commit;
end fire;
end;
/


--execute
execute hr.hire(1,'Hari',100, 11);
execute hr.hire(2,'OM',2000, 12);
execute hr.hire(3,'OP',21324, 10);
execute hr.hire(4,'Keshav',2000, 11);

select * from emp;

--execute
execute hr.fire(4);


--write a fuction to perform operation on bank.
select * from bank_account;

--package for insert/update/delete/select all/select specific row

create or replace package bank_operation
as
procedure insert_into_bank(acc number, name varchar,amount number);
procedure update_name(acc number,name varchar);
procedure credit(acc number, amount number);
procedure debit(acc number, amount number);
procedure delete_account(acc number);
function getName(acc number) return varchar;
function getAllName(acc number) return SYS_REFCURSOR;
end;
/

create or replace procedure body bank_operation
as
procedure insert_into_bank(acc number, name varchar,amount number)
is begin
insert into bank_account values(acc , name ,amount );
commit;
end insert_into_bank;

procedure update_name(acc number,name varchar)
is begin
update bank_account set cname=name where account=acc;
commit;
end update_name;

procedure credit(acc number, amount number)
is begin
update bank_account set balance=balance+amount where account=acc;
end credit;

procedure debit(acc number, amount number)
is 
tlt_amount number;
begin
select balance into tlt_amount from bank_account where account=acc;
if balance>amount than
update bank_account set balance=balance-amount where account=acc;
end if;
end debit;

procedure delete_account(acc number)
is begin
delete from bank_account where account=acc;
commit;
end delete_account;

function getName(acc number) return varchar
is 
cust_name varchar;
begin
select cname into cust_name from bank_account where account=acc;
return cust_name;
end getName;

function getAllName(acc number) return SYS_REFCURSOR
is
cust_name SYS_REFCURSOR;
begin
select cname into cust_name FROM bank_account where account<acc; 
return cust_name;
end getAllName;

end;
/

execute bank_operation.insert_into_bank(103,'OP',21324);

