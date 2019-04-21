--CASE STATEMENT
--case statements used to implement IF-THEN-ELSE in SQL. there are 2 types of statements 1. simple case,2. searched case.
--1. simple case.       when condition is based on =.
--DISPLAY EMPNO, ENAME.  eg,

/*select col1,col2,
        case col3
        when col3_value then value
        when clo3_value then value
        else value
        end 
        from emp*/

select empno, ename,
        case job
        when 'CLERK' THEN 'WORKER'
        when 'MANAGER' THEN 'BOSS'
        when 'PRESIDENT' THEN 'BIG BOSS'
        else 'EMPLOYEE'
        end
       from emp;
       
select * from emp

select empno,ename,
        case deptno
        when 10 then 'TEN'
        WHEN 20 then 'TWENTY'
        when 30 then 'THIRTY'
        else 'UNKNOWN'
        end as Deptno
 from emp       

--2. SEARCHED CASE, used when condition not based on '=' operator
/*
case 
when cond1 then return exp1
when cond2 then return exp2
----
else retrun exp
end
*/
/*--DISPLAY EMPNO, ENAME,SAL,
        CASE 
        WHEN SAL>3000 THEN 'HI_SAL'
        WHEN SAL<3000 THEN 'LOW_SAL'
        ELSE 'AVG_SAL'
        END
*/       

select empno,ename,sal,
        case
        when sal>3000 then 'HI_SAL'
        when sal<3000 then 'LOW_SAL'
        else 'AVG_SAL'
        end as New_Sal
from emp

select * from tab
select * from all_users
select * from student

--DISPLAY SID, STOTAL, SAVG, ARESULT AND PASS/FAIL.
select id as sid, (m+p+c) as stotal, (m+p+c)/3 as savg,
        case
        when m>35 and p>35 and c>35 then 'PASS'
        else 'FAIL'
        end as Sturesult
from student        