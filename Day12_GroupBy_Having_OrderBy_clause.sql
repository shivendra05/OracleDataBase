--GROUP BY HAVING ORDER BY CLAUSES
/*
group by clause is used to group records based on one or more coulmns to calculate
sun,max,min,count for each group
*/

/*
SELECT <COLUMN NAME>
FROM <>TAB_NAME
[WHERE <CONDITION>]
GROUP BY <COLUMNS>
[HAVING <CONDITION>]
[ORDER BY <COLUMNS>]
*/


/*
ORDER OF EXECUTION
FROM
WHERE
GROUP BY 
HAVING
SELECT
ORDER BY
*/
---CALCULATE DEPARTMENT WISE TOTAL SALARY.
select * from emp

select deptno, sum(sal) as total_sal from emp
        group by deptno
        order by 2---1 reflates deptno and 2 reflacts total_sal

---CALCULATE JOB WISE NO OF EMPLOYEES
select * from emp

select job, count(empno) as No_Emp from emp
        group by job
        order by 2

---COUNT NUMBER OF EMPLOYEES JOINED IN EACH YEAR.
select to_char(hiredate,'YYYY'), count(empno) from emp
       group by to_char(hiredate,'YYYY')

---CALCULATE DEPT WISE TOTAL SAL WHERE DEPTNO 10 OR 20.(we can use both where and having)
select deptno, sum(sal) from emp
        --where deptno in (10,20)
        group by deptno
        having deptno=10 or deptno=20
        order by 1

---CALCULATE DEPT WISE TOTAL SAL WHERE DEPTNO 10 OR 20 AND SUN_SAL>10000(we can use both where and having)

select deptno, sum(sal) as total_sal from emp
        where deptno in (10,20)
        group by deptno
        having sum(sal)>10000

---HAVING WORKS WITH GROUP BY
select sum(sal) as total_sal from emp
        having sum(sal)>10000

/* DIFFERENCE BETWEEN WHERE AND HAVING CLAUSE.
WHERE:- USED TO SELECT DATA FROM SPECIFIC ROW
CONDITIONS APPLIES BEFORE GROUP BY.

HAVING:- USED TO SELECT DATA FROM SPECIFIC ROW
CONDITION APPLIES AFTER GROUP BY.
*/


---CALCULATE JOB WISE NUMBER OF EMPLOYEE WHERE JOB IS CLERK OR MANAGER AND NUMBER OF EMPLOYEEE>3
select * from emp

select job,count(ename) from emp
        where LOWER(job) in('manager','clerk')
        group  by job
        having count(ename)>3

---DEPTS WISE WITHIN DEPT, JOB WISE TOTAL SAL
select deptno, job, sum(sal) from emp
        group by deptno, job
        order by 1,2
        
--ROLLUP AND CUBE.
/*
USED TO CALCULATE SUB TOTAL AND GRAND TOTAL FOR EACH GROUP
GROUP BY ROLLUP(COL1,COL2,....)
GROUP BY CLBE(COL1,COL2,.....)
*/

--ROLLUP
select deptno,job,sum(sal) from emp
        group by rollup(deptno,job)
        order by 1,2

--CUBE
select deptno,job,sum(sal) from emp
        group by cube(deptno,job)
        order by 1,2
