delimiter $
create or repalce procedure selectAllEmployee()
Begin
select * from Employee;
End $
delimiter ;


delimiter $
create procedure SelectWithWhere(IN empId int(10))
begin
select * from Employee where eid = empId;
end $
delimiter ;

drop procedure SelectWithWhere