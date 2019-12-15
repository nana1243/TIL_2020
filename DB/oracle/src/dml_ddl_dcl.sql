######################################################
Table 생성   DDL  (auto commit)

테이블은 실제로 데이터들이 저장되는 곳 이라고 생각하면 쉽게 이해 할 수 있으며, 
CREATE TABLE 명령어를 이용해서 테이블을 생성 할 수 있다. 
######################################################

데이터타입설명
	VARCHAR2 타입
	- 가변길이 문자형 데이터 타입 
	- 최대 길이 : 2000 바이트(반드시 길이 지정) 
	- 다른 타입에 비해 제한이 적다 
	- 일부만 입력시 뒷부분은 NULL 
	- 입력한 값의 뒷부분에 있는 BLANK도 같이 입력 
	- 전혀 값을 주지 않으면 NULL 상태 입력 
	- 지정된 길이보다 길면 입력시 에러 발생 
	- 컬럼 길이의 편차가 심한 경우, NULL 로 입력되는 경우가 많은 경우 VARCHAR2 사용 

	NUMBER 타입
	- 숫자형 데이타 타입, 음수, ZERO, 양수 저장 
	- 전체 자리수는 38자리를 넘을 수 없다 
	- 소수점이 지정되지 않았을 때 소수점이 입력되거나, 지정된 소수점자리 이상 입력되면 반올림되어 저장 
	- 지정한 정수 자리수 이상 입력시 에러 발생 
	- 연산이 필요한 컬럼은 NUMBER타입으로 지정한다. 
	- NUMBER(p,s) 로 지정시 p는 s의 자리수를 포함한 길이므로 감안하여 P의 자리수를 결정 
	- NUMBER 타입은 항상 가변길이므로 충분하게 지정할 것 

	DATE 타입
	- 일자와 시간을 저장하는 날짜형 타입 
	- 일자나 시간의 연산이 빈번한 경우 사용 
	- 포함정보 : 세기, 년도, 월, 일, 시간, 분, 초 
	- NLS_DATE_FORMAT을 이용하여 국가별 특수성을 해결 
	- 특별히 시간을 지정하지 않으면 00:00:00로 입력 됨 
	- 특별히 일자를 지정하지 않았다면 현재월의 1일로 지정 됨 
	- SYSDATE는 현재일과 시간을 제공 
	
	
drop table book;
commit;

create table book( 
    bookno   number(5),
    title    varchar2(40),
    author   varchar2(30),
    pubdate  date
); 
commit;
alter table book add(price number(7));
alter table book modify(price number(7,2));




rollback;  -- 취소
commit;    -- 완료

select * from book;
	
-- DML 구문    insert ,update ,delete	
	
insert into book values(1,'java','홍길동',sysdate);
insert into book values(2,'sql','김길동','2018/01/01');
insert into book values(2,'sql','김길동','2018/01/01');
insert into book values(3,'html5','고길동','2017/01/01');
insert into book values(4,'db',null,null);
	
insert into book(bookno,title,author,pubdate) 
values(5,'db',null,null);
	
insert into book(bookno,author,pubdate,title) 
values(5,'db',null,null);	
	
insert into book(bookno,title) 
values(6,'spring');		

delete from book;
rollback;

delete from book where bookno=3;

select * from book;

delete from book where title is null;
commit;

update book set title='~~~~';
rollback;
update book set title='~~~~' where bookno=5;
update book set title='~~~~',author='kim' where bookno=5;
commit;

desc book; --테이블 구조


update book set price=0 ;
update book set price=99.99 ;

update book set price=null ;


update book set price=99.99 ;

alter table book drop column price;

rename book to book2;

select * from book2;

rename book2 to book;

delete from book; --rollback 가능 
truncate table book; -- auto commit
drop table book; -- auto commit


select * from emp;
select * from dept;

create table emp2 as select * from emp;
create table dept2 as select * from dept;

insert into dept (deptno,dname,loc) values(50,'EDU','SEOUL');
insert into dept2 (deptno,dname,loc) values(50,'EDU','SEOUL');
commit;

insert into dept (deptno,dname,loc) values(10,'EDU','SEOUL');
insert into dept2 (deptno,dname,loc) values(10,'EDU','SEOUL');
commit;

insert into emp(empno,ename,sal,deptno) 
          values(999,'홍',900,50);  

insert into emp2(empno,ename,sal,deptno) 
          values(999,'홍',900,90);  


-- 제약조건 설정 방법

drop table book;
create table book( 
    bookno   number(5) CONSTRAINT scott_book_PK PRIMARY KEY,
    title    varchar2(40),
    author   varchar2(30),
    price    number(7,2) 
            CONSTRAINT scott_book_price_check check(price > 0),
    pubdate  date default sysdate
);           
          
insert into book(bookno,title,author,price) 
values(1,'java..','홍길동',900);	
commit;
          
insert into book(bookno,title,author,price) 
values(2,'sql','고길동',9900);	          
          


drop table book;
create table book( 
    bookno   number(5) PRIMARY KEY,
    title    varchar2(40) unique,
    author   varchar2(30),
    price    number(7,2) check(price > 0),
    pubdate  date default sysdate
);   


drop table book;
create table book( 
    bookno   number(5) ,
    title    varchar2(40) unique,
    author   varchar2(30),
    price    number(7,2) check(price > 0),
    pubdate  date default sysdate
);   

alter table book add CONSTRAINT book_PK PRIMARY KEY(bookno);
alter table book drop CONSTRAINT book_PK ;

truncate table book;


##########################################
emp2   dept2 제약 조건 추가 설정 
##########################################

drop table emp2 cascade CONSTRAINT;
drop table dept2 cascade CONSTRAINT;

create table emp2 as select * from emp;
create table dept2 as select * from dept;

alter table emp2 add CONSTRAINT emp2_PK PRIMARY KEY(empno);
alter table dept2 add CONSTRAINT dept2_PK PRIMARY KEY(deptno);

alter table emp2 
add CONSTRAINT emp2_FK_DEPTNO 
foreign key(deptno)  REFERENCES dept2  ;

alter table emp2 
add CONSTRAINT emp2_FK_mgr 
foreign key(mgr)  REFERENCES emp2   ;

insert into emp2(empno,ename,sal,deptno,mgr) 
          values(999,'홍',900,40,7902);  

insert into emp2(empno,ename,sal,deptno,mgr) 
          values(1111,'홍',900,40,7);  

          
-- 트랜잭션

delete from emp where empno=7902;

update emp set comm=0 where empno=7902;



------------------------------------------------


ALTER TABLE EMP DROP CONSTRAINT FK_DEPTNO;

DELETE TABLE EMP ADD CONSTRAINT FK_DEPTNO
FOREIGN KEY(DEPTNO) REFERENCES DEPT ON DELETE SET NULL;
          

--------------------------------------------------------

alter table emp drop constraint fk_deptno
foreign key(deptno) references dept on delete cascade;

delete from emp where deptno=10;




