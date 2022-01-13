select * from Employee;

drop table Employee;

    
create table Employee_Department ( eno int primary key not null, ename varchar(20), 
                                job_title varchar(20),
                                sal float, deptNo int);
drop table Employee_Department;

insert into Employee_Department values(100, 'shivendra', 'QA', 5444354.32,2);
insert into Employee_Department values(100, 'pandey', 'QA', 54354.302,2);
insert into Employee_Department values(101, 'vishal', 'QA', 24254.232,1);
insert into Employee_Department values(102, 'neeraj', 'dev', 6532354.362,2);
insert into Employee_Department values(103, 'yaswant', 'dev', 873244.342,4);
insert into Employee_Department values(104, 'sanjeev', 'teacher', 2134354.32,5);
insert into Employee_Department values(105, 'sudha', 'teacher', 5432404.02,4);
insert into Employee_Department values(106, 'manoj', 'agent', 9804354.32,3);
insert into Employee_Department values(107, 'sameer', 'dev', 79329354.92,1);

select * from Employee_Department;

create sequence Employee_Department_seq start with 1; 

SELECT ENO, ENAME, JOB_TITLE, SAL, DEPTNO FROM Employee_Department WHERE job_title IN ('dev','QA');

select * from PATIENT_DETAILS;

Select count(*) from Employee_Department;

Select * from Employee_Department;

Select ename from Employee_Department where eno=101;

describe employee_department

describe student
Select * from student;

insert into student (ROLLNUMBER, SNAME, DOORNO,STREETNAME,AREANAME,STATE,COUNTRY,PINCODE) 
values(100, 'shivendra', 'D12', 'Ravindra', 
                    'BusStand', 'MP', 'India',486001);
                    
insert into student (ROLLNUMBER, SNAME, DOORNO,STREETNAME,AREANAME,STATE,COUNTRY,PINCODE) 
values(101, 'Sudha', 'B22', 'Sharada', 
                    'Puram', 'MP', 'India',486001);

insert into student (ROLLNUMBER, SNAME,DOORNO,STREETNAME,AREANAME,STATE,COUNTRY,PINCODE) 
values(102, 'Sudeep', 'C21', 'Ramanagar', 
                    'Bangalore', 'Karnatka', 'India',43801);
                    
insert into student (ROLLNUMBER, SNAME,DOORNO,STREETNAME,AREANAME,STATE,COUNTRY,PINCODE) 
values(103, 'Kuldeep', 'C01', 'Lupin', 
                    'Indore', 'MP', 'India',43241);   
                    
select SNAME,DOORNO,STATE,PINCODE from student where ROLLNUMBER=100;    
commit;

SELECT ENO, ENAME, JOB_TITLE, SAL, DEPTNO FROM Employee_Department WHERE job_title IN ('QA','teacher');

alter table student 
    drop column DOJ;
    
DESCRIBE student;

select * from student;



create table BankAccount ( accnumber int primary key not null, holdername varchar(20), 
                                balance float);
                                
select * from BankAccount;

insert into BankAccount (accnumber, holdername, balance) 
                    values(100, 'shivendra', 48541.09); 
                    
insert into BankAccount (accnumber, holdername, balance) 
                    values(101, 'manoj', 346401.09);  

insert into BankAccount (accnumber, holdername, balance) 
                    values(102, 'sudeep', 54324301.09);  

insert into BankAccount (accnumber, holdername, balance) 
                    values(103, 'sanjeev', 4535354.09);  

insert into BankAccount (accnumber, holdername, balance) 
                    values(104, 'sudha', 5654234.09);     

insert into BankAccount (accnumber, holdername, balance) 
                    values(105, 'sonam', 53412.09);  

insert into BankAccount (accnumber, holdername, balance) 
                    values(106, 'shyamkali', 434543.09);  

insert into BankAccount (accnumber, holdername, balance) 
                    values(107, 'anshi', 432123.09); 
select * from BankAccount;   








create table userlist ( username varchar(20) primary key not null, password varchar(20)  not null);
                                
select * from BankAccount;

insert into BankAccount (accnumber, holdername, balance) 
                    values(100, 'shivendra', 48541.09); 
                    
insert into BankAccount (accnumber, holdername, balance) 
                    values(101, 'manoj', 346401.09);  

insert into BankAccount (accnumber, holdername, balance) 
                    values(102, 'sudeep', 54324301.09);  

insert into BankAccount (accnumber, holdername, balance) 
                    values(103, 'sanjeev', 4535354.09);  

insert into BankAccount (accnumber, holdername, balance) 
                    values(104, 'sudha', 5654234.09);     

insert into BankAccount (accnumber, holdername, balance) 
                    values(105, 'sonam', 53412.09);  

insert into BankAccount (accnumber, holdername, balance) 
                    values(106, 'shyamkali', 434543.09);  

insert into BankAccount (accnumber, holdername, balance) 
                    values(107, 'anshi', 432123.09); 
select * from BankAccount;                    