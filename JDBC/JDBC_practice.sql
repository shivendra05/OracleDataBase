select * from movie;
describe movie;
commit

insert into movie values(105,'check de India','Shahrukh',100);

delete from movie where MNO=100;

Select * from movie where BUDGET>=100;



select * from (select mno,title rank() over (order by budget desc) ranking from movie) where ranking=1;


insert into movie values(106,'Krishna','krishna,balram',2000);
insert into movie values(107,'Ramayan','ram, lakshman',800);
insert into movie values(108,'Mahabharat','arjun,bheem',3000);
insert into movie values(109,'agnipath','amitabh',180);


--stored Procedure.

create or replace procedure sumOfTwoNumbers(x in number, y in number, z out number) as
begin
    z:=x+y;
end;
/

--run/call the procedure fucntion
--variable k number;
var k number;
execute sumOfTwoNumbers(100,51,:k);
print k;

--to print/get the error message
Show Errors 

create or replace procedure squar_root(x in number, y out number) as
begin
    y:=x*x;
end;
/

--execute squar procedure
var y number
execute squar_root(120,:y)
print y

select * from movie;

--store procedure to find budget of give movie number.
create or replace procedure findMovieBudget(movieNumber in number, movieBudget out number) is
begin
    select BUDGET into movieBudget from movie where MNO=movieNumber;
end;
/

show errors
--execute procedure

var movie_budget number
execute findMovieBudget(&num,:movie_budget);
print movie_budget

select * from movie;
--store procedure with messages if not found in the DB

create or replace procedure findMovieDetailsUsingNumber
        (movieNumber in number,movieBudget out number,movieName out varchar2,numberOfMovies out number) as
begin
    select count(mno) into numberOfMovies from movie;
    --DBMS_OUTPUT.put_line('Number of Movies in the DB');
    --DBMS_OUTPUT.put_line(numberOfMovies);
   -- print numberOfMovies;
    --DBMS_OUTPUT.NEW_LINE;
    if numberOfMovies<movieNumber
      then
        select BUDGET, TITLE into movieBudget, movieName from movie where MNO=movieNumber;
        DBMS_OUTPUT.PUT_LINE( 'Sales revenue is greater than 100K ' ); 
    else
        movieBudget :=00000;
        movieName :='HHHHHH';
    end if;
end;
/

drop procedure findMovieDetailsUsingNumber;

show errors;


--execute procedure

var mBudget number;
var mName varchar2;
var mcount number;
execute findMovieDetailsUsingNumber(&no ,:mBudget,:mName, :mcount);
print :mBudget;
print :mName;
print :mcount;

create or replace procedure getMoviesCount(numberOfMovies out number) as
begin
    select count(MNO) into numberOfMovies from movie;
    DBMS_OUTPUT.put_line('Number of Movies in the DB');
    DBMS_OUTPUT.NEW_LINE;
end;
/


drop procedure getMoviesCount;


variable movieCount number;
execute getMoviesCount(:movieCount);
print movieCount;


select * from movie;


--write an procedure to find sum, min, max and Avg of total movies in Db also print
--actors name and Movie name of a given Movie Number..

create or replace procedure findAggrigateDetails_MName_AName
            (mNumber in number,bsum out number,bmax out number,bmin out number,
            bavg out number,aName out varchar2,mName out varchar2,mcount out number) as
begin
    select max(BUDGET) into bmax from movie;
    select min(BUDGET) into bmin from movie;
    select sum(BUDGET) into bsum from movie;
    select avg(BUDGET) into bavg from movie;
    select count(BUDGET) into mcount from movie;
    
    IF mNumber>mcount
        then
            select TITLE, ACTOR_NAME into mName,aName from movie where MNO=mNumber;
    ELSE
        mName:='No Name Found, Invalid Movie_Name';
        aName:='No Name Found, Invalid Movie_Name';
    END IF;
end;
/



var bsum number;
var bmax number;
var bmin number;
var bAvg number;
var aName varchar2;
var mName varchar2;
var mcount number;
execute findAggrigateDetails_MName_AName(107,:bsum,:bmax,:bmin,:bAvg,:aName,:mName,:mcount);
print :mBudget;
print :bAvg;
print :aName;
print :bmax;
print :bsum;

-- write a procedure to print all movie details

create or replace procedure getMovieDetails(mdetails out SYS_REFCURSOR)as
begin
    open mdetails for 
        select * from movie;
end;
/