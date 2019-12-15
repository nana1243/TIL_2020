select user from dual; -- 동시에 두명이 들어간다



-- ddl(data/definition/language)---
drop table book;

create table book(
     bookno   number(5),
     title    varchar2(30),
     author   varchar2(30),
     pubdate date
     );
     
alter table book  modify(price number(7,2));



-- dml : insert, update, delete -- 테이블 안의 데이터를 수정할때 쓰는
-- commit이 날라가기전에 복구가 됨

insert into book values(1,'java', '홍길동',sysdate);
insert into book values(2,'python', '지드래곤','19/03/21');
insert into book values(2,'python', '지드래곤','19/03/21');
insert into book values(3,'html5', '고길동','18/03/01');
insert into book values(4,'db', null,null);
insert into book values(4,'sql', null,null);
insert into book(bookno,title,author,pubdate) values(5,'dbdb',null,null);
insert into book(bookno,title) values(6,'spring');

delete from book where bookno=2;
delete from book where title is null;
--------------------------------------------
desc book; -- table구조
alter table book add(price number(7)); -- column추가


select * from book;

update book set price=7;  
update book set price=99.99;
update book set price=null;

alter table book  modify(price number(7,2));

---- 제약 조건 설정 방법

alter table book drop column price;
rename book2 to book;

delete from book -- rollback 가능
truncate table book; -- auto commit  , rollback 해도  data 회복 불가능, 대신 book이라는 구조는 그대로 존재

drop table book;



select * from emp;
select * from dept;



roll back; -- 취소
commit ;  -- 완료


-- copy할때--
create table emp2 as select * from emp;
create table dept2 as select * from dept;
------------------------------------------

insert into dept(deptno,dname,loc) values(50,'EDU','SEOUL');
insert into dept2(deptno,dname,loc) values(50,'EDU','SEOUL');
SELECT * FROM EMP;


purge recyclebin; -- 휴지통 비우기
c1 scr;

drop table book;
-- unique 조건?
-- foreign key;

create table book(
     bookno   number(5) CONSTRAINT scott_book_pk PRIMARY KEY,
     title    varchar2(30),
     author   varchar2(30),
     price number(7,2) CONSTRAINT scott_book_price check(price >0),
     pubdate date default sysdate
     );


     
insert into book(bookno,title,author,price) values(1,'java', '홍길동',-900);
insert into book(bookno,title,author,price) values(2,'java', '홍길동',9900);
     


----------------------------------------------------------------------------

drop table book;
--unique : 중복되면 안딘다

create table book(
     bookno   number(5)  PRIMARY KEY,
     title    varchar2(30) unique, 
     author   varchar2(30) ,
     price number(7,2) check(price >0),
     pubdate date default sysdate
     );

     
insert into book(bookno,title,author,price) values(1,'java', '홍길동',900);
insert into book(bookno,title,author,price) values(2,'java', '홍길동',9900);
     



------------------------------------------------------------


-- 제약 조건을 차후에 넣는다
create table book(
     bookno   number(5),
     title    varchar2(30) unique, 
     author   varchar2(30) ,
     price number(7,2) check(price >0),
     pubdate date default sysdate
     );

     
     
--- 제약조건의 삭제와 추가 -----------------------
alter table book add CONSTRAINT scott_book_pk PRIMARY KEY(bookno);

alter table book drop CONSTRAINT scott_book_pk;
 

----------------------------------------------------

SELECT * FROM DEPT;

DROP TABLE EMP2 CASCADE CONSTRAINT;
DROP TABLE DEPT2 CASCADE CONSTRAINT;

CREATE TABLE DEPT2 AS SELECT * FROM DEPT;
CREATE TABLE EMP2 AS SELECT * FROM EMP;

alter table dept2 add CONSTRAINT DEPT2_DEPTNO_PK PRIMARY KEY(DEPTNO);
alter table emp2 add CONSTRAINT emp2_DEPTNO_PK PRIMARY KEY(EMPNO);

-- pk로 걸림
alter table emp2 
add CONSTRAINT EMP2_FK_DEPTNO foreign key(deptno)  REFERENCES dept2;


insert into emp2(empno,ename,sal,deptno) vlues(999,'총',900,40);


alter table emp2
add CONSTRAINT EMP2_FK_mgr 
foreign key(mgr)  REFERENCES emp2;


delete from emp2 


update emp set comm=0 where empno=7902;
