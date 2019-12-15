-- 상관 관계 서브쿼리문
-- 자신이 속한 부서에 평균 급여가 적은 사원 리스트 목록


select * from emp a
where sal< (select avg(sal) from emp where deptno=a.deptno);




-- 정렬하기 전에 row_num이 정해졌다
select rownum,ename,job,sal,deptno from emp order by sal;
-- 정렬되기 전에 sort하기 위해
select rownum,ename,job,sal,deptno from (select * from emp order by sal desc)

--------- pagination 을 위한 --------------------
select rownum,ename,job,sal,deptno 
from (select * from emp order by sal desc)
where rownum<4;

-- 밑에서 부터 sort 하기 때문에 4이상은 출력해서 나오지 않는다

select rownum,ename,job,sal,deptno 
from (select * from emp order by sal desc)
where rownum>4;


select rownum,ename,job,sal,deptno 
from (select * from emp order by sal desc)
where rownum between 1 and 4;

--------------------------------------------------------

select * from 
( select rownum row#, ename, job,sal,deptno)
from (select * from emp order by sal desc)
where row# between 7 and 9;


-------------------------------------------------



