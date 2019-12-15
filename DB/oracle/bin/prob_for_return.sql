--1. 각 사원(employee)에 대해서 사번(employee_id),
--이름(first_name), 부서명(department_name),
--매니저(manager)의 이름(first_name)을 조회하시오.
--

select e.employee_id, e.first_name, department_name , m.first_name 
from employees e left outer join employees m on e.manager_id=m.manager_id join departments d on e.department_id=d.department_id;



--문제2. 자신의 매니저보다 연봉(salary)을 많이 받는 직원들의 성(last_name)과
-- 연봉(salary)을 출력하시오. 



select e.last_name , e.salary from employees e left outer join employees m on e.manager_id=m.manager_id where e.salary>m.salary;



--문제3. 회원 관리를 위한 users 테이블을 생성합니다.
--로그인에 필요한 id 정보와 pw 정보는 필수입니다.
--
--다음 Query 문장을 작성하십시오. 
--테이블 생성문


CREATE TABLE users
       (id  VARCHAR2(10) CONSTRAINT PK_ID_USERS PRIMARY KEY,
        pw  VARCHAR2(18) not null,
	    birthdate DATE,
	    price NUMBER(9),
        product_name varchar2(10) );
        
        
--회원 등록 sql 구문
INSERT INTO users VALUES
('hennie','1233445','SMITH',to_date( '23-1-1982','dd-mm-yyyy'),800,'갤럭시');

INSERT INTO users VALUES
('areun','102902','MARRY',to_date( '21-2-1992','dd-mm-yyyy'),300,'애플폰');
INSERT INTO users VALUES
('kange22','583292','HARRY',to_date( '18-9-2003','dd-mm-yyyy'),200,'엘지');


--- 
  
        
        

        
        
        


