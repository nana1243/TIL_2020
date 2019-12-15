
--1. 각 사원(employee)에 대해서 사번(employee_id),
--이름(first_name), 부서명(department_name),
--매니저(manager)의 이름(first_name)을 조회하시오.
--

select e.employee_id, e.first_name, department_name , m.first_name 
from employees e left outer join employees m on e.manager_id=m.manager_id join departments d on e.department_id=d.department_id;


--자신의 매니저보다 연봉(salary)을 많이 받는 직원들의 성(last_name)과 연봉(salary)을 출력하시오.

select e.last_name , e.salary from employees e left outer join employees m on e.manager_id=m.manager_id where e.salary>m.salary;




-- 문제3. 업무명(job_title)이 ‘Sales Representative’인 직원 중에서 연봉(salary)이 
--- 9,000 이상, 10,000 이하인 직원들의 이름(first_name), 성(last_name)과 연봉(salary)을 출력하시오.

select  e.first_name, e.last_name, e.salary from employees e left outer join jobs j on  e.job_id=j.job_id
where e.salary>=9000 and e.salary<=10000  
and j.job_title='Sales Representative';


--문제4. Query 문장을 작성하십시오. 
-- 자신의 매니저보다 채용일(hire_date)이 빠른 사원의 사번(employee_id), 성(last_name)과 채용일(hire_date)을 조회하라.
select * from employees;

select e.employee_id, e.last_name from employees e inner join employees m on e.manager_id=m.manager_id
where e.hire_date> m.hire_date;


--문제5. Query 문장을 작성하십시오. 
--
--각 업무(job_title)가 어느 부서(department_name)에서 수행되는지 조회하는 SQL 쿼리문을 작성하세요. 
--(단, 수행하지 않는 업무는 표시하지 않고 중복되는 정보는 하나만 표시합니다.)
--출력: JOB_TITLE | DEPARTMENT_NAME

select j.job_title,d.department_name from employees e  left outer join departments d  on e.department_id=d.department_id
left outer join jobs j on e.job_id =j.job_id ;


--6. 월 별 입사자 수를 조회하는 SQL 쿼리문을 작성하세요. 월 순으로 정렬하세요. 

select to_char(hire_date,'mm') as month ,count(employee_id)||'명' as 입사자수
from employees 
group by to_char(hire_date,'mm') 
order by to_char(hire_date,'mm');


select to_char(hire_date,'mm') as month ,count(employee_id)  
from employees 
group by to_char(hire_date,'mm') 
order by 1;



--문제7. 08년도에 입사한 직원의 이름(first_name), 입사일(hire_date), 관리자사번(employee_id), 관리자 이름(first_name)을 조회합니다. 
--단, 관리자가 없는 사원정보도 출력결과에 포함되어야 합니다..  

select first_name, hire_date, employee_id, first_name 
from employees where hire_date like '08/%';


--문제8. ‘Sales’부서에 속한 직원의 이름(first_name), 급여(salary), 부서이름(department_name)을 조회하시오. 


select * from employees;
select * from departments;

select first_name, salary, department_name from employees e left outer join  departments d  
on e.department_id=d.department_id where d.department_name='Sales';




--문제9. 2004년 입사한(hire_date) 직원들의 사번(employee_id), 이름(first_name), 성(last_name), 부서명(department_name)을 조회합니다. 
--이때, 부서에 배치되지 않은 직원의 경우, ‘<NOT ASSIGNED>’로 보여줍니다.

-- 오류 발생
select e.employee_id, e.first_name,e.last_name , NVL(to_char(d.department_name),'<NOT ASSIGNED>') from employees e 
left outer join departments d on e.department_id=d.department_id ;




--문제10. 2003년에 입사한 직원의 이름(first_name), 입사일(hire_date), 관리자사번(employee_id), 관리자 이름(first_name)을 조회합니다. 
--단, 관리자가 없는 사원정보도 출력결과에 포함되어야 합니다.. 

select e.first_name,e.hire_date, d.department_name, m.employee_id, m.first_name  
from employees e left outer join employees m on e.manager_id=m.manager_id join departments d on e.department_id=d.department_id;








