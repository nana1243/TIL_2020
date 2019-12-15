-- select * + from  + where  + order by

-- 정규표현식

select * from emp where regexp_like(ename,'[A-D]');
select * from emp where regexp_like(ename,'A|B|C|D');
select * from emp where regexp_like(ename,'^[A-D]');
select * from emp where regexp_like(ename,'[A-D]$');

-- where 절에서 null

select * from emp where comm is null;
select * from emp where comm is not null;


select ename,sal,comm,sal+nvl(comm,0) as total from emp;

-- 총급여가 2000이상인 사람

select ename,sal,comm,sal+nvl(comm,0) as total from emp 
where sal+nvl(comm,0)>2000;

-- 정렬 , 오름차순 기본

select deptno,ename,sal,comm,sal+nvl(comm,0) as total from emp order by deptno;
-- 내림차순
select deptno,ename,sal,comm,sal+nvl(comm,0) as total from emp order by deptno DESC;

-- order by 절에서는 금액에 따라 정렬 됨
select deptno,ename,sal,comm,sal+nvl(comm,0) as total from emp order by total;

-- 다섯번째항
select deptno,ename,sal,comm,sal+nvl(comm,0) as total from emp order by 5;

select deptno,ename,sal,comm,sal+nvl(comm,0) as total from emp 
order by deptno desc,total;

select deptno,ename,sal,comm,sal+nvl(comm,0) as total from emp 
where deptno=10 order by total;

-- or절은 in(a,b) -> a or b, 2개의 표현
select deptno,ename,sal,comm,sal+nvl(comm,0) as total from emp 
where deptno in(10,20) order by total;


select deptno,ename,sal,comm,sal+nvl(comm,0) as total from emp 
where deptno = any(10,20) order by total;

-- deptno가 10 and20 모두가 아닌 -> 2개의 표현
select deptno,ename,sal,comm,sal+nvl(comm,0) as total 
from emp where deptno <> all(10,20) order by total;

select deptno,ename,sal,comm,sal+nvl(comm,0) as total 
from emp where deptno != all(10,20) order by total;

-- 단일항 함수 
select * from dept;
select dname,dname,loc, loc from dept;

select dname,lower(dname),loc, lower(loc) from dept;

select round(45.357,2),trunc(45.357,2) from dept;

select sysdate,sysdate+30 from dual;
--년도 정보 뽑아내기 --> hire date의 index(1,2)까지 출력
select ename,hiredate,substr(hiredate,1,2) from emp;

select sysdate,to_char(sysdate,'YYYY') from dual;
select sysdate,to_char(sysdate,'YY') from dual;
select sysdate,to_char(sysdate,'day') from dual;
select sysdate,to_char(sysdate,'mm') from dual;



-- emp에서 사원들의 입사월을 출력해보세요


select ename,hiredate,to_char(hiredate,'mm') as "입사한 달" from emp;
select ename,hiredate,to_char(hiredate,'mm') as "입사한 달" from emp order by "입사한 달";

select sysdate,to_date('2019/12/10') from dual;
select sysdate,to_date('2019_12_10') from dual;
select sysdate,to_date('2019 12 10') from dual;
select sysdate,to_date('12/05/2019') from dual; -- 얘는 에러남
select sysdate,to_date('12/05/2019','mm/dd/yy') from dual; 


select ename,nvl(to_char(comm),'_') from emp;


-- decode 함수

select ename,sal,deptno,sal*1.2 from emp;
select ename,sal,deptno,sal*1.2  from emp where deptno=20;
select ename,sal,deptno,sal*1.3  from emp where deptno=30;


select ename,sal,deptno, decode(deptno, 10,sal*1.2 ,20,sal*1.3,30,sal*1.4) 
as increase_salary  from emp order by deptno ;



