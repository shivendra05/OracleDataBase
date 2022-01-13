--BUILD-IN FUNCTIONS IN ORACLE
/*
WE HAVE TWO TYPE OF BUILD-IN FUNCTIONS 
1. SINGLE-ROW FUNCTIONS(SCALAR)
2. MULTI-ROW FUNCTIONS(GROUP)
*/

--1. SINGLE-ROW FUNCTIONS.      THESE FUNCTIONS PROCESS ONE ROW AND RETUEN ONE VALUE.
/*
1.String function
2.Mathematical function
3.Data function
4.Conversion function
5.Special function
6.Analytical function
*/
--1.STRING FUNCTIONS

--1.1. upper(column_name)
select upper('hello') from dual

--1.2. lower(column_name)
select lower('HELLO') from dual

--SELECT EMPNO,ENAME, SAL. DISPLAY ENAME IN UPPER
select * from emp
select empno, upper(ename),sal from emp
select empno, lower(ename),sal from emp

select * from tab

--UPDATE ALL NAME WITH LOWER CASE.
select ename from emp1
update emp1
        set ename=lower(ename)
select ename from emp1
 
--DISPLAY EMPLOYEE DETAILS HAVE NAME 'smith'
select * from emp
        where lower(ename)='smith'

select * from emp1
        where upper(ename)='SMITH'

--1.3. initcap(arg)
select * from emp1
select initcap(ename) from emp
--UPDATE ALL EMPNAME INITIAL TO CAPITAL LATTER
select * from emp1
update emp1
        set ename=initcap(ename)
select * from emp1

--1.4. lenght(arg),     returns string length
select * from emp1
alter table emp1
        add (namelength number(20))
select * from emp1
select ename,length(ename) as namelength from emp1
select * from emp1
update emp1
        set namelength=length(ename)        
select * from emp1

--SELECT EMPLOYEE CONTAINS 5 CHARACTER.
select * from emp
        where length(ename)=5
        
        or
        
select * from emp
        where ename like '_____'

--1.5. substr(args, num1,[num2]),       used to get part of string.     num1-start_point, num2-end_point
select substr(ename,2,length(ename)) as subString from emp1
--substr('hello welcome',-10,3) --lo

--SELECT EMPNAME STARTS WITH 'S'
select * from emp
        where ename like 'S%'
        
        or
        
select * from emp
        where substr(ename,1,1)='S';

--SELECT EMPNAME ENDS WITH 'S'
select * from emp
        where ename like '%S'
        
        or

select * from emp 
        where substr(ename,-1,1)='S'

--SELECT EMPNAME WHERE START_CHARACTER AND END_CHARACTER OF NAME IS SAME
select * from emp
        where substr(ename,1,1)=substr(ename,-1)

--1.6. || --concatination operator.
--GENERATE EMAIL ID FOR ALL THE USERS, HAVE FIRST 3 DIGITS OF NAME, FIRST DIGITS OF EMPNO AND @TCS.COM.
select empno, ename, substr(ename,1,3)|| substr(empno,1,3)||'@tcs.com' as email from emp

--CREATE TABLE AND ADD EMAIL TO ALL THE EMPLOYEE.
select * from emp1

alter table emp1
        add (email varchar(20))

select * from emp1

update emp1
        set email= substr(ename,1,3)||substr(empno,1,3)||'@tcs.com'

select * from emp1

--1.7. rpad(str,count,pattern) and lpad(str,count,pattern)
/*
rpad('hello',10,*)--> hello*****
lpad('hello',10,*)--> *****hello
*/

--1.8. ltrim(str1,[str2]) and rtrim(str1,[str2]),       used to remove spaces and unwanted charactars.
--trim()---> remove spaces and unwanted charactor from both end.

/*
ltrim('         hello')-->hello
rtrim('hello            ')-->hello
ltrim('hello@@@@@@@@','@')-->hello

trim()--
trim(leading,'pattern' , string)
trim(trailing,'pattern' , string)
trim(both,'pattern' , string)
*/
select trim(leading '@' from '@@@@@hello@@@@') from dual
select trim(trailing '@' from '@@@@@hello@@@@@') from dual
select trim(both '@' from '@@@@@@shiv@@@@@') from dual
select ltrim('#####          hello','#') from dual
select rtrim('shiv00000000','0') from dual

--1.9. replace(str, substr, newstr),    used to replace one string to another string
--replace('hello','ell','abc')--habco

select replace('hello','ell','xxx') from dual
select replace('@@@@h@@e@@@ll@@o','@','') from dual

--1.10. translate(),    used to translate one char to another char. used to encrypt one char to another char
--translate(str1,str2,str3),    in str1, str2 tanslated to str3.

select translate('hello','elo','abc') from dual
select ename, translate(sal,'0123456789','poiuytqwer') as sal from emp1 

--1.11. DATE FUNCTION.
--SYSDATE+10 --> 10 DAYS ADDED TO SYSTEM DATE.
--SYSDATE-10 --> 10 DAYS SUBSTRACTED TO SYSTEM DATE
--DATE1-DATE2 --> DIFFERENCE IN DAYS.
--DATE1+DATE2 --> INVLAID

--ADD_MONTHS(DATE, NO OF MONTHS)

select ADD_MONTHS(SYSDATE,2) from dual
select add_months(sysdate,-2) from dual

--NEXT_DAY(DATE,DAY)

select NEXT_DAY(sysdate,'FRIDAY') FROM DUAL
select next_day(sysdate,'monday') from dual

--MONTHS_BETWEEN(month1,month2),        returns number of months between too dates

select months_between(sysdate,'17-APR-2016') as months from dual

--DISPLAY EMPNO, ENAME, EXPRIENCE?
select empno, ename, round(months_between(sysdate,hiredate)/12) as exprience
        from emp1

---
--1.12.round(number,[decimal place]),   used to round number to deciaml places or to an integer
select round(386.3324) from dual
select round(386.5) from dual 
select round(356.3423,2) from dual
select round(356.342,-2) from dual      --300---350--400
select round(375.3224,-1) from dual

--1.13.trunc(number,[decimal place]),   used to round numbers to lowest.
select trunc(386.956) from dual
select trunc(356.2324,2) from dual


--SELECT LIST OF EMPLYOEE JOINED TODAY.
select * from emp
        where hiredate = sysdate;
        --    17-APR-2019 10:58:00=  17-APR-2019 00:00:00--wont work
--so use
select * from emp
        where trunc(hiredate) = trunc(sysdate)
        --    17-APR-2019 00:00:00=  17-APR-2019 00:00:00--works
        
--1.14. ceil(num) and floor(num)
/*
ceil()---is used to rounf number to highest.
floor()---is used to round number to lowest
*/        

select ceil(324.32) from dual
select floor(324.32) from dual
