create table student (sid number, sname varchar(29), gender varchar(1),addr varchar(20))
insert into student values(1,'shivendra','M','Rewa MP')
#Hiberte scipts
select * from student
select * from Employee
insert into Employee values(3,'shiva',4321)

create table emp (sid number, sname varchar(29), sal number)
INSERT INTO emp SELECT * FROM Employee;
select * from emp
commit
create table Employee (eid number, ename varchar(29), esal number,addr varchar(29))

insert into Employee(eid, ename, esal) values(1,'Pandey',12443);
insert into Employee(eid, ename, esal) values(2,'Kumar',11111);
insert into Employee(eid, ename, esal) values(3,'Singh',2132);
insert into Employee(eid, ename, esal) values(4,'Keshav',3243);
select * from Employee
insert into Employee(eid, ename, esal,addr) values(3,'Mahesh',222,'MH')
insert into Employee (eid, ename, esal,addr)values(8,'Kishan',333,'UP');
insert into Employee (eid, ename, esal,addr)values(9,'Rajesh',4444,'MP');
insert into Employee (eid, ename, esal,addr)values(10,'Kivita',5555,'HP');
insert into Employee (eid, ename, esal,addr)values(11,'Sriman',666,'AP');
insert into Employee (eid, ename, esal,addr)values(12,'Hari',777,'TN');
insert into Employee (eid, ename, esal,addr)values(13,'Neha',10,'MP');
insert into Employee (eid, ename, esal,addr)values(14,'Sharma',100,'UP');
insert into Employee (eid, ename, esal,addr)values(15,'Deepak',200,'PJ');
commit

alter table Employee add addr varchar(20)
update Employee set eid=5 where ename='Mahesh'
update Employee set addr='AP' where eid=7
update Employee set addr='HP' where eid=3

select * from Employee

describe Employee

update Employee  set addr='REWA' where   eid=4
DELETE FROM Employee WHERE eid between 1 and 2
select * from Employee  order by eid asc

commit

select table_name from user_tables

create table empdep (did number, dname varchar(29), gender varchar(1))

select * from student
select * from Employee
select * from empdep
select * from emp

alter table emp drop column eid

truncate table emp

create table emp (eid number, ename varchar(29), esal number,addr varchar(29))

insert into emp(eid,ename,esal)  select eid,ename,esal from Employee

alter table emp add eid number(30)

select * from empdep
select * from emp

alter table emp drop column addr
alter table empdep drop column eid

alter table empdep add addr varchar(30)
alter table empdep add gender varchar(1)

update empdep set gender='F' where eid<11

update empdep set addr='MP' where eid<11
update empdep set addr='AP' where eid=11
insert into empdep values(10,'MONKEY','M');
insert into empdep values(11,'Apple','M');
insert into empdep values(12,'ROSE','M');
insert into empdep values(13,'LION','M');

alter table emp add did number

select * from empdep
select * from emp

commit

ALTER TABLE empdep
ADD PRIMARY KEY (did);

ALTER TABLE emp
ADD FOREIGN KEY (did) REFERENCES empdep(did);

select * from emp
update emp set did=11 where esal=777

insert into emp (eid,ename,esal) values(13,'OP',768)
insert into emp((eid,ename,esal) values(14,'Suri',3254)

select * from empdep
select * from emp
describe emp
describe empdep

SELECT *
    FROM  emp   e
         INNER JOIN
	  empdep  et
    ON e.did=et.did;
    
SELECT *
    FROM  emp   e
        LEFT JOIN
	empdep  et
    ON e.did=et.did;  
    
SELECT *
    FROM  emp   e
        RIGHT JOIN
	  empdep  et
    ON e.did=et.did; 
    
    
SELECT e.ename,e.eid,et.did,et.dname
    FROM  emp e
        INNER JOIN
	  empdep  et
    ON e.did=et.did;       
    
    
SELECT e.ename,e.eid,et.did,et.dname
    FROM  emp e
        LEFT JOIN
	 empdep  et
    ON e.did=et.did;      
    
    
SELECT e.ename,e.eid,et.did,et.dname
    FROM  emp e
        RIGHT JOIN
	 empdep  et
    ON e.did=et.did;    
    
    
select * from global_name 
select * from tab
    
    
create table compositeEmp (
  deptId number,
  empId number,
  ename varchar(255), 
  eprj varchar(255),
  esal number, 
  
  primary key (deptId, empId)
  
) 
    
insert into compositeEmp values(10,1,'Shivendra','Spring',10000);  
insert into compositeEmp values(11,1,'shiv','Spring',3254); 
insert into compositeEmp values(12,2,'pandey','CJ',200); 
insert into compositeEmp values(11,2,'kumar','Log4j',2000); 
insert into compositeEmp values(12,3,'shivan','Ant',2132); 
insert into compositeEmp values(11,3,'nadeem','maven',2334); 

select * from compositeEmp

select * from emptab
select * from  emptab_UUID
select * from emptab_Sequence

select * from emptab_CustomGen

drop table emp_BeanValidation

select * from tab
select * from emptab_NewGenSequence
select * from emptab_NewGenIdentity
select * from emptab_NewGenTable
select * from emptab_NewGenAuto
select * from emp_bag
select * from emp_BeanValidation

commit

select * from Employee




