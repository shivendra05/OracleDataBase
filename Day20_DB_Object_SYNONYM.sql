--SYNONYMS
/*
A SYSNONYMS IS ANOTHER NAME OR ALTERNATIVE NAME FOR A TBALE OR VIEW

SYNONYMS:-
        1. IF TABLE NAME IS LENGTHY
        2. TO ACCESS TABLE WITHOUT OWNER NAME

SYNTEXT:-
        CREATE SYSNONYMS <SYNO_NAME> FOR <TABLE_NAME>

1ST,    
        GRANT PERMISSION FROM DBA THEN ALTER ONE SYNONYMS
2ND,
        CREATE SYNONYMS.
*/

--LOGIN AS DBA system\pws
grant create e synonyms to shiv

create synonyms emp_syn for emp

--AFTER CREATING SYNONYMS INSTEAD OF USING TABLE_NAME, WE CAN USE SYNONYM NAME.
select * from emp_syn

--GRAND ACCESS TO EMP--login as dba--manager/pwd
grant all on emp to shiv

--shiv,
selct * from manager.emp        
create synonym rmp for manager.emp 
select * from emp


/*
SYNONYM ARE OF TWO TYPES.
        1. PRIVATE SYNONYMS(DEFAULT)
        2. PUBLIC SYNONYMS
        
PUBLIC SYNONYMS,
        THESE SYNONYMS ARE CREATED BY DBA AND GRANTED TO ALL USERS CAN ACCESS PUBLIC SYSNONYMS WIHTOUT PREFIXING WITH OWNER NAME
*/ 
--1. PRIVATE SYNONYMS(DEFAULT)
--LOGIN WITH SHIV,
grant all on emp to public

--LOGIN WITH SHIVENDRA
select * from shiv.emp
create synonyms emp for shiv.emp

--LOGIN WITH USER1
create synonym emp for shiv.emp

--LOGIN WITH USER2
create synonym emp for shiv.emp

/*
ABOVE EXAMPLE EVERY USER HAS TO CREATE SYNONYM THIS INCREASES COMPLEXITY TO REDUCE COMPLEXITY CREATE PUBLIC SYNONYMS.
*/

--2. PUBLIC SYNONYMS(DEFAULT)
--LOGIN AS MANAGER
create public synonym pub_emp for shiv.emp
grant all on pub_emp to public

--LOGIN WITH SCOTT
select * from pub_emp

--LOGIN WITH SHIV
select * from pub_emp

--LOGIN WITH USER1
select * from pub_emp

---DROP AN SYNONYMS.
drop synonyms <synonym_name>
drop synonym pub_emp

--GET ALL THE DETAILS OF SYNONYMS.
select synonym_name,table_name
from user_synonyms





