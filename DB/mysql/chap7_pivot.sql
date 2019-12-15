 /* 피벗의 구현 
 : 피벗은 한열에 포함된 여러값을 추력하고 , 이를 여러 열로 변환하여 테이블 반확식을
 회전하고 필요하면 집계까지 수행하는 일을 한다.
 */ 
 
 create table pivot_Test
 ( username char(3),
   season    char(2),
   amount    int);
 
 
 insert into pivot_Test values("김범수","봄",10);
 insert into pivot_Test values("이승기","봄",8);
 insert into pivot_Test values("아이유","여름",7);
 insert into pivot_Test values("수지","봄",6);
 insert into pivot_Test values("잇지","가을",4);
 insert into pivot_Test values("나나","겨울",10);
 insert into pivot_Test values("김현주","겨울",6);
 insert into pivot_Test values("천우희","여름",3);
 
 
 
select * from pivot_test;

select username, 
sum(if(season="봄",amount,0)) as "봄",
sum(if(season="여름",amount,0)) as "여름",
sum(if(season="가을",amount,0)) as "가을",
sum(if(season="겨울",amount,0)) as "겨울",
sum(amount) as "합계"
from pivot_test group by username;


/* 조인 
: 두개의 테이블을 합치는 것이다
inner join :  조건에 만족되는 행만 포함시킴
outer join : 조건에 만족되지 않은 행까지도 모두 포함시키는 것이다
cross join : 한쪽 테이블의 모든 행들과 다른 쪽 행들의 모든 행을 조인시키는 것이다
*/

/* 형식
select 첫번째 테이블
       inner join 두번째 테이블
	   on 조인될 조건
       where 검색조건
*/

use sqldb; 
select * from buytbl;
select * from usertbl;


select * from buytbl
       inner join usertbl
		on buytbl.userID = usertbl.userID;


select *from buytbl
       LEFT OUTER join usertbl
       on buytbl.userID = usertbl.userID;


