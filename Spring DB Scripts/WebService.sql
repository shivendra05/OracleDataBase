drop table customer;
commit;

select * from customer_details;
describe customer_details;

select * from customer_details where cno between 41 and 43;

select * from customer_details where cno in(41,42,43);

select * from customer_details where cname like 'a%';

select cno, cadd from customer_details where cname like 'a%'
commit

select * from customer_details;
update customer_details set bill_Amount=bill_Amount+10 where cadd='rewa';

delete from customer_details where cno=41;

drop procedure GET_CUSTOMER_BY_ADDRS;

create or replace procedure GET_CUSTOMER_BY_ADDRS(custno in  number, custName out varchar)
is
begin
select cname into custName from customer_details where cno=custno;
commit;
end;
/

var cname varchar2
execute GET_CUSTOMER_BY_ADDRS(43,:cname)
print :cname

drop procedure GET_CUSTOMER_BY_ADDRS;
