
-- view: 가상의 테이블
-- 각 부서에서 최대급여를 받는 사원의 목록
select * from emp;

select * from emp where sal in (select max(sal) from emp group by deptno);


create or replace view max_sal_dept 
as 
select * 
from emp 
where 
(deptno,sal) in (select deptno, max(sal) from emp group by deptno);


delete from emp2;
delete from dept2;


create sequence dept_seq;

insert into dept2 (deptno, dname,loc) values(dept_seq.nextval,'EDU','SEOUL');

select dept_seq.currval from dual;

drop sequence dept_seq;

create sequence dept_seq start WITH 10  increment by 10;

insert into dept2 (deptno, dname,loc)
values(dept_seq.nextval,'EDU','SEOUL');

DELETE FROM DEPT2;
COMMIT;


INSERT INTO DEPT2(deptno,dname,loc)
values(dept_seq.nextval,'EDU','SEOUL');


SELECT MAX(DEPTNO)+10 FROM DEPT2;