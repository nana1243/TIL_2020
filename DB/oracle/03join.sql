-- join

-- iner join

select ename,deptno from emp where ename='SMITH';
select * from dept where deptno=20 ;
select ename,dname,loc from emp,dept ;
select ename,dept.deptno,dname,loc from emp,dept  where emp.deptno=dept.deptno;

-- 별칭 써써
select ename,d.deptno,dname,loc from emp e,dept d  
where e.deptno=d.deptno;

-- ansi join 표준 ,=> join
-- where =>on

select ename, d.deptno,dname,loc from emp e join dept d  
on e.deptno=d.deptno;


select ename, d.deptno,sal,comm,sal+nvl(comm,0) as total from emp e join dept d
on e.deptno=d.deptno where sal+nvl(comm,0)>2000;


select ename, d.deptno,sal,comm,sal+nvl(comm,0) as total from emp e inner join dept d
on e.deptno=d.deptno where sal+nvl(comm,0)>2000;



-- outer join
-- null이 있는 곳에 플러스 마킹 해야한다

select ename,dept.deptno,dname,loc from emp,dept  
where emp.deptno(+)=dept.deptno;

--
select ename,dept.deptno,dname,loc from emp,dept  
where emp.deptno=dept.deptno(+);


select ename,dept.deptno,dname,loc from emp right outer join dept  
on emp.deptno=dept.deptno;



select ename,d.deptno,dname,loc from emp e left outer join dept d  
on e.deptno=d.deptno;



-- non equi join 


select * from salgrade;

select ename,job,sal,salgrade.grade from emp, salgrade 
where sal between losal and hisal ;


select ename,job,sal,salgrade.grade from emp join salgrade 
on sal between losal and hisal ;

--------------------
----세개의 테이블 조건----
---------------------

-- 테이블이 n ->조건 :n-1
select ename, job, dname,loc,sal,grade 
from emp ,dept,salgrade 
where emp.deptno=dept.deptno 
      and 
      sal between losal and hisal ;


-- 안시 조인
select ename, job, dname,loc,sal,grade 
from emp 
     join dept  
     on emp.deptno=dept.deptno 
     join salgrade 
     on sal between losal and hisal 
     where sal>3000;

      
select lower(e.ename), lower(m.ename) as "상사명"
from emp e, emp m 
where e.mgr = m.empno;



-- oracle 방식---상사보다 급여가 많은 사원을 출력해라

select lower(e.ename), lower(m.ename) as "상사명",e.sal as "e의 sal",m.sal as "m의 sal"
from emp e, emp m 
where e.mgr = m.empno and e.sal>m.sal;


--- 12명 다 나오게

select lower(e.ename), lower(m.ename) as "상사명"
from emp e, emp m 
where e.mgr = m.empno(+);


-- 안시조인


select lower(e.ename), lower(m.ename) as "상사명"
from emp e left outer join emp m 
on e.mgr = m.empno;



select lower(e.ename), lower(m.ename) as "상사명",e.sal as "e의 sal",m.sal as "m의 sal"
from emp e left outer join emp m 
on e.mgr = m.empno where e.sal>m.sal;

--집계함수
select ename,round(sal) from emp;
select ename,avg(sal) from emp;-- avg는 한개인데 ename은 12개의 항목 ->에러남

select count(empno),count(comm),count(mgr) from emp;
select count(*)from emp;

select count(job) from emp;
select count(distinct job) from emp;


select sum(sal),round(avg(sal)),sum(sal)/count(*) from emp;

select round(avg(sal)) as "급여" from emp where deptno=10;

select deptno,round(avg(sal)) as "평균급여" from emp 
group by deptno;



-- 부서 이름별 평균 급여

select d.dname,d.deptno,round(avg(e.sal)) as "평균급여" 
from emp e, dept d  
where e.deptno=d.deptno
group by d.deptno,d.dname;



select d.dname,d.deptno,round(avg(e.sal)) as total ,d.loc
from emp e, dept d  
where e.deptno=d.deptno
group by loc
order by total desc;



select loc,avg(sal) as total 
from emp 
     join dept
     on emp.deptno=dept.deptno
group by loc
order by total DESC;



-- 부서별 평균 급여가 2000이상인 목록 
/*
 select 
 from
 where
 group by
 having 
 order by
 */

select dname,avg(sal) as avgsalary 
from emp join dept on emp.deptno=dept.deptno group by dname having  avg(sal)>2000;


select dname,avg(sal) as avgsalary 
from emp,dept where emp.deptno=dept.deptno 
group by dname having  avg(sal)>2000;


select dept.deptno, max(sal),min(sal),count(*),
       avg(sal) as avgsal
from emp,dept
where emp.deptno=dept.deptno
group by dept.deptno;

-- 급여가 가장 많은 사람

select ename from emp where sal=(select max(sal) from emp);


-- ford 보다 급여가 많은 사원 목록

select ename from emp where sal>(select sal from emp where ename='FORD');

-- 전체 평균보다 급여가 적게 받는 사원목록

select ename from emp where sal<(select avg(sal) from emp) order by sal;

select ename from emp where sal in (select min(sal) from emp group by deptno);


select min(sal) from emp group by deptno; -- 그룹별중 가장 작은 값이 뽑아나옴 


-- 각 부서에서 최고 급여를 받은 사람목록 -- 2명이상일 때 섞임 

select * from emp where sal in (select max(sal) from emp group by deptno);


select * from emp where (deptno,sal) in (select deptno,max(sal) from emp group by deptno);



