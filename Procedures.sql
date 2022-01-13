select * from emp
set serveroutput on

-- to chane to new line
DBMS_OUTPUT.NEW_LINE

--simple alter command
alter table emp drop column deptobj_did

--procedure 1, update the data, without in and out parameters
create or replace procedure updateempdetails
is
begin 
update emp set esal=esal+7557 where eid=1;
commit;
end;
/

--command to delete the procedure
drop procedure updateempdetails

--procedure to update department number from emp id
create or replace procedure updateempsal(empid in  number,empdid in  number)
is
begin
update emp set did=empdid where eid=empid;
commit;
end;
/

execute updateempsal(2,10)
select * from emp


---procedure to return employee name from eid
create or replace procedure getempname(empid in number,empname out varchar)
is
begin
select ename into empname from emp where eid=empid;
end;
/

var name varchar2
execute getempname(5,:name)
print :name


---create a prcedure to encremtn specific emplyeee sal with specific amount and send it to the calling program
select * from emp

drop procedure raise_sal

create or replace procedure raise_sal(empid in number,amt in number,sal out number)
is
begin
update emp set esal=esal+amt where eid=empid;
commit;
select esal into sal from emp where eid=empid;
end;
/


declare 
vempid emp.eid%type;
vamt emp.esal%type;
vsal emp.esal%type;
begin
vempid  := &id;
vamt    := &amount;
--raise_sal(empid->vempid, amt->vamt,sal->vsal);
raise_sal(vempid, vamt,vsal);
dbms_ouput.put_line(vsal);
end;
/

var k number
execute raise_sal(1, 1,:k);
print :k



--create procedure to withdraw money
create table bank_account(account number(10), cname varchar(20), balance number);

create or replace procedure insert_bal(acc in number, cust in varchar, amt in number)
is
begin
insert into bank_account values(acc,cust,amt);
commit;
end;
/


declare 
vacc  bank_account.account%type;
vcust  bank_account.cname%type;
vamt  bank_account.balance%type;
begin
vacc    :=&a;
vcust   :=&b;
vamt    :=&c;
insert_bal(vacc,vcust,vamt);
dbms_output.put_line('Data Inserted');
end;
/

select * from bank_account

create or replace procedure withdraw_money(acc in number,amount in number,rbal out number)
is
vbal  bank_account.balance%type;
begin
select balance into vbal from bank_account where account=acc;
if amount>vbal then
    raise_application_error(-20001,'insuficient balance');
end if;
update bank_account set balance=balance-amount where account=acc;
commit;
select balance into rbal from bank_account where account=acc;
end;
/


var k number
execute withdraw_money(100,51,:k);
print :k


