select * from bank_account;
-- to chane to new line
DBMS_OUTPUT.NEW_LINE

--refer table column name with :new for insert/update command
--refer table column name with :old for DELETE command

--trigger, if any user tries to insert into table records that is having amount less then 500....

create or replace trigger banktable_amount_validation 
before insert
on bank_account
for each row
begin
if :new.balance<500 then
raise_application_error(-2001,'Amount less than 500 cant be deposited');
end if;
end;
/
---inserting data into table
select * from bank_account;
describe bank_account;
insert into bank_account values(103,'Suri',213243);
insert into bank_account values(104,'Mukesh',200);

---trigger before update
create or replace trigger banktable_amount_validationBeforeUpdate
before update
on bank_account
for each row
begin
if :new.balance<500 then
raise_application_error(-2001,'Amount less than 500 cant be deposited');
end if;
end;
/
--updating data into table
select * from bank_account;
describe bank_account;
update bank_account set balance= balalce+50 where account=100;
update bank_account set balance= balalce+600 where account=100;
update bank_account set balance= 600 where account=100;
update bank_account set balance= 300 where account=101;
insert into bank_account values(104,'Mukesh',200);


create table bank_account_reco (account number, custname VARCHAR(20),amount FLOAT(5));
insert into bank_account_reco values(100,'shyam',2132.43);
select * from bank_account_reco;

--write a trigger script.. whenever a record is being deleted from table bank_account it should insert one copy to bank_account_reco
select * from bank_account_reco;
select * from bank_account;
describe bank_account_reco; 

create or replace trigger bank_recovery
after delete
on bank_account
for each row
begin
--tribute values should ebe from old/parent table
insert into bank_account_reco values(:old.ACCOUNT,:old.CNAME,:old.balance);
end;
/

select * from bank_account_reco;
select * from bank_account;

delete from bank_account where account=100;
insert into bank_account values(100,'shyam',2132);



--trigger not to allow to enter account holder name less than 2 chars

create or replace trigger bank_account_Namevalidation
before insert
on bank_account
for each row
declare
vname number;
begin
select length(:new.cname) into vname from dual;
if vname<2 then
raise_application_error(-2001,'dont enter account holder name have less than 2 chars');
end if;
end;
/

--test
select * from bank_account;
insert into bank_account values(104,'Bablu',2132);
insert into bank_account values(105,'B',2456);

