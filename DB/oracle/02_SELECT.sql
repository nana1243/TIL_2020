
select * from emp;
select * from tab;
select * from dept;

select ename,sal,sal*12 from emp;
select sal,sal*12 as total_hire_money from emp;\

-- 이름에 공백을 넣고 싶다면 더블 코테이션으로 ! (이름 쓸때)

select sal,sal*12 as "total hire money" from emp;

-- 주의! -> 오라클에서 문자열은 ' '이고 여기에서만 더블코테이션이다!


select empno,ename,sal from emp;
select * from emp where COMM is not null;


select ename,sal,comm,sal+comm as"합계" from emp;
-- nvl function: 
-- NVL(COMM-> 얘도 정수, 0<- 얘도 정수)
select ename,sal,NVL(comm,0) ,sal+NVL(comm,0) 
as"합계" from emp;


SELECT empno,ename,job,mgr from emp;


-- null의 값을 바꾸는게 nvl -- 체크!
-- 주의! SIGLE 인지 DOUBLE인지
SELECT empno,ename,job,NVL(to_char(mgr), '<top>') FROM emp;


-- 문자열 연결 연산자 ||

select empno ||' '|| ename ||' ' || job from EMP;


select 12*12*30 from emp;
select 12*12*30 from dual; -- 가상의 테이블


select sysdate from dual; -- 날짜의 정보

-- 중복 제거

select distinct job from EMP;

-- row 제한 where 절 --(where절안에) 별칭을 써서는 안됨
select * from  emp where deptno=10;
select ename,job,hiredate from emp where deptno=10;


-- 대소문자를 여기서는 가린다
select *from emp where UPPER(job)=UPPER('MANAGER') ORDER BY DEPTNO;
select *from emp where LOWER(job)=LOWER('MANAGER') ORDER BY DEPTNO;


-- 입사일자 --<> : 같지 않은
SELECT ENAME,JOB,HIREDATE FROM EMP WHERE HIREDATE='81/05/01' ;
SELECT ENAME,JOB,HIREDATE FROM EMP WHERE HIREDATE<>'81/05/01' ;
SELECT ENAME,JOB,HIREDATE FROM EMP WHERE HIREDATE !='81/05/01' ;

desc emp;

-- between and 하한값 먼저 기술
select ename,job,sal from emp where SAL>=2000 AND SAL<=3000;
select ename,job,sal from emp where SAL between 2000 and 3000;


select * from emp where deptno=10 or deptno=20;
select * from dept;
select * from dept where (deptno,loc) in ((10,'NEW YORK'),(20,'CHICAGO'));

-- LIKE 연산자
-- A가 포함된 이름을 찾고 싶다
-- 대문자 A로 포함된
SELECT * FROM EMP WHERE ENAME LIKE 'A%';
-- 뒤에 A로 끝난
SELECT * FROM EMP WHERE ENAME LIKE '%H';

-- A가 포함된

SELECT * FROM EMP WHERE ENAME LIKE '%A%';
SELECT * FROM EMP WHERE ENAME LIKE UPPER('%A%');

-- M 과  T 사이에 있는 것을 찾고 싶을 때 언더바 쓴다
SELECT * FROM EMP WHERE ENAME LIKE '%M_T%';


-- 81년도에 입사한 사원의 목록
SELECT *FROM EMP WHERE HIREDATE LIKE'81%';
SELECT *FROM EMP WHERE HIREDATE LIKE'81/%';
SELECT *FROM EMP WHERE HIREDATE LIKE'81/%/%';

--09월에만 뽑을 때 
SELECT *FROM EMP WHERE HIREDATE LIKE'%/09/%';


-- 이름이 A B C D 로 시작 하는 사원의 목록 -- 다시 답 확인

SELECT * FROM EMP WHERE ENAME LIKE 'A%' OR 'B%' OR 'C%'  OR 'D%';



