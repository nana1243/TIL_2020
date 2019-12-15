-- 테이블과 뷰 --
-- 테이블의 수정 --


-- alter table buytbl table option
select * from buytbl;

alter table buytbl add grade  varchar(20); -- 열의 추가
alter table buytbl drop column grade; -- 열의 삭제

select * from usertbl;
alter table usertbl change column name uName varchar(20) null; -- 열의 이름 변경

alter table usertbl drop primary key; -- 제약조건을 삭제
alter table buytbl drop foreign key;  -- check





/* 뷰생성 */


select * from usertbl;

create view u_usertbl_view AS 
 SELECT userID , uName, addr from usertbl;
 
 
 
 -- 뷰는 복잡한 커리를 단순화 시킬 수 있는 능력 --
 drop view if exists v_userbuytbl;
 
 create view v_userbuytbl as
 select u.userID ,u.uName, u.addr,  b.prodName, b.groupName
 from buytbl b
 inner join  usertbl u
 on u.userID=b.userID;

select * from v_userbuytbl;