-- 테이블생성1 :새로운 데이터 구조
-- CREATE TABLE 테이블명 (컬럼명 자료형);

-- 테이블생성2 -- 기존 테이블에서 컬럼 추출해서 생성
-- 기존테이블의 데이터도 함께 복사
-- CREATE TABLE 테이블명 (SELECT */칼럼명 FROM 테이블명);

USE sqlDB;
SELECT * FROM buytbl;

CREATE TABLE buytbl_b
        (select userID, prodName, price FROM buytbl LIMIT 5); 

create TABLE buytbl_c
        (select userID, prodName, price from buytbl);

select * from buytbl_b;

-- group by 
-- select from -- tablename group by 칼럼명;

-- 전자 종목의 합계 표시하기
SELECT *from buytbl;
-- 합계 구하는 방법 : sum(칼럼명);
-- 평균 구하기: avg(칼럼명);

select sum(price), avg(price) from buytbl;
select groupName, sum(price), avg(price) from buytbl GROUP BY groupName;

select groupName, sum(price), avg(price) from buytbl GROUP BY groupName order by groupName;

-- AS 별칭이름;
-- 칼럼명을 대신하는 별칭 이름 표시;
-- SELECT 칼럼명 AS 별칭명 FROM 테이블명;

select prodName as "제품명",
	   price    as  "가격",
       amount   as  "수량"
       from buytbl;

-- 함수 결과 필드명에 별칭주기

select groupName as "종목",
 sum(price) as "합계", 
 avg(price) as "평균" 
 from buytbl GROUP BY groupName order by groupName;

-- 퀴즈 :사용자 별로 구매합계 구하기
/* 
사용자id 별로  총구매액 표시 group by, sum (), as
총구매액? sum(price*amount)
출력양식
userID(사용자아이디) sum(총구매액)

*/


select userID as "사용자아이디",
 sum(price*amount) as "총구매액" 
 FROM buytbl 
 group by userID; 
 


 -- 집계함수 p211
 
 select max(price) as "촤댓값",
        min(price) as "최소값",
        count(price) as "갯수"
        from buytbl;
 
 
-- with rollup
-- 소합계 p214

select NUM, groupName, sum(price*amount) as "비용" from buytbl
       group by groupName,NUM 
       with ROLLUP;

-- CRUD
-- 레코드삽입
-- INSERT INTO 테이블명 (칼럼명1, 칼럼명2...) VALUES(값1, 값2,..)
-- INSERT INTO 테이블명 VALUES(값1,값2,...)

INSERT INTO buytbl
       VALUES(NULL, "EJW", "파이썬","서적",3000,30);
insert into buytbl(num,prodName, price, amount, userID)
VALUES(NULL, "파이썬",1000, 10, "EJW");       
       
SELECT *FROM buytbl;

/* 테이블 삭제
DELETE FROM 테이블명;
DROP BY 테이블명;
TRUNCATE TABLE 테이블명;
*/

SELECT * FROM buytbl_a;
select * FROM buytbl_b;
select * From buytbl_c;

-- 데이터 목록을 db에서 삭제
DELETE FROM buytbl_b;
SELECT *FROM buytbl_a;

-- 테이블이 아에삭제
DROP TABLE buytbl_b;
SELECT *from buytbl_b;

-- db안에 등록된 레이블 목록 삭제하기
TRUNCATE table buytbl_c;
select*from buytbl_c; 

create database if not exists sqlDB1;
SHOW DATABASES;
DROP DATABASE IF EXISTS sqlDB1;


-- 레코드수정
/*
UPDATE 테이블명 SET 칼럼명= 값 WHERE 절
DELETE FROM 테이블명 WHERE 절
*/

SELECT * FROM buytbl;
update buytbl set amount=10 where num=1;
select *from buytbl; -- 하나짜리 수정

update buytbl set amount=100 where groupName ="전자"; -- 한꺼번에 수정
 select *from buytbl;
 
 
 -- 레코드의 가격 모두 1.5배 올리고 싶다
 
 update buytbl set price= price*1.5;
 select *from buytbl;
 
 -- 특정 레코드 삭제
 -- delete from where
 -- where 절 생략시 레코드 모두 삭제
 -- delete from buytbl where
 
  -- page 234
  -- 변수 생성
  use sqldb;
  -- set @변수명 = 초기값;
  -- select 변수명
  
  set @a=1;
  set @b=2;
  set @c="My SQL";
  set @d="sqlite";

-- 출력  
select @a;
select @a ,@b,@c,@d;
  
-- 연산
SELECT @a,@b,@a+@b;
select @c+@d ,@c*3;

-- 테이블과 변수 함께 사용하기

select *from usertbl;
select userID, addr FROM usertbl;
set @deco="***"; -- 변수 선언

select userID, addr, @deco as "deco" from usertbl;


/*  퀴즈1>
usertbl에서 키가 180 넘는 레코드만 추출한 후 아래와 같은
형태로 출력하여라

		  이름      키     
가수이름 ==> 김경호   ?  cm
가수이름 ==>이승기    ?
*/

SELECT *from usertbl;



set @a="==>";
set @b= "cm";
set @c="가수이름";

select @c as "" , name"이 름", @a as "",height as "키", @b as "" from usertbl where height>180;

--  데이터 형변환
-- p236 
-- cast (.. as 데이터형식)
-- convert(.. as 데이터형식)

/* 데이터형식:
binary,char(),date, time
signed integer, unsigned integer
*/

use sqldb;

select * from buytbl;
select avg(AMOUNT) as " 평균 구매 개수" FROM buytbl;

SELECT cast(AVG(AMOUNT) as SIGNED INTEGER) 
        AS "평균구매개수" FROM buytbl;

select convert(avg(amount),signed integer)
        as "평균 구매 갯수" from buyTbl;

-- 실수형 숫자를 =>문자
select cast(23.5 as char(10));
-- 문자 ==>양의 정수
select cast("2nd" as signed integer );
select cast("2nd1243" as signed integer);


-- 날짜 자료형 종류

-- 문자열 =>날짜 자료형 종류
-- date, time, datetime


select now(); -- 게시판사용시, 데이터 등록 시간때 사용
select cast(now() as date) as "오늘의 시간";
select cast(now() as time) as "등록시간";

SELECT now() as "현재 날짜 및 시간",
       cast(now() as date) as "등록날쨔",
       cast(now() as time) as "등록시간";



-- 여러 문자열을 하나의 문자열로 표시 p241;

-- concat("a","b") :a와 b를 이어준다 -- 새로 추가된 칼러명

set @userName="슈가";
select concat("거기누구 없소?","이하이")as "결과";
select concat("거기누구 없소?",@userName) as "결과";
select concat_ws(",","방탄소년단","블랙핑크","레드벨벳") as "아이돌 그룹";


select num,
	   concat(cast(price as char(10)), " % ",
              cast(amount as char(7)), "= ")
             as "단체 수량",
             price* amount as "구매액"
             from buyTbl;


/* 퀴즈- concat()활용
usertbl 테이블에서 키가 175이상 넘는 레코드만 추출한 후 아래와 같은 형태로 출력하여라
			  이름           키
가수이름  =>   김경호         ? cm 
가수이름  =>   이승기         ? cm
*/


SELECT 
    CONCAT('가수이름 ==>', name) AS '이름',
    CONCAT(CAST(height AS CHAR (5)), 'cm') AS '키'
FROM
    usertbl
WHERE
    height > 180;
               
-- 제어문
/* 
if(수식, 참, 거짓)
ifnull 
nullif
case ~when ~else ~end
%/

select if (100<200, "참이다","거짓이다") as "결과값";
select * from usertbl;

-- addr이 서울일때, 회원의 키 합계 as "서울지역의 키 합계"

select * from usertbl;

select 
     sum(IF(addr="서울",height,"")) as "서울지역의 키 합계",
     avg(IF(addr="서울",height,"")) as "서울지역의 키 평균"
     from usertbl;
	
-- 피봇(pivot) : 테이블의 변형
-- 테이블에 필요한 자료만 추출해서 새로운 테이블로 작성하는 기능

create table pivotTEST
       (uName char(3),
        season char(2),
        amount int);


INSERT INTO pivotTEST VALUES
                      ("김범수","겨울",10), ("윤종신","여름",15), ("김범수","가을",25),("김범수","봄",3),
                      ("김범수","봄",37), ("윤종신","겨울",40), ("김범수","여름",14), ("김범수","겨울",22),
                      ("윤종신","여름",64);



select * from pivotTEST;
select uName from pivotTEST GROUP BY uName;



SELECT uName,
       sum(IF(season="봄", amount,0))as "봄",    -- from pivotTEST GROUP BY uName
       sum(IF(season="여름", amount,0)) as "여름",
       sum(IF(season= "겨울", amount,0)) as "가을",
       sum(if(season=" 겨울", amount,0)) as "겨울",
       sum(amount) as"합계",
       avg(amount) as "평균"
       FROM pivotTEST 
       GROUP BY uName;
       
- ifnull(수익1, 수익2)
- 수식1의 null이 아니면 수식1이 반환되고, 수식1이 null이면 수식2가 반환
-- 수식1과 수식2가 같으면 null반환, 수식1과 수식2가 같지 않으면 수식1이 반환
-- 결과값 :null,200
select ifnull(100,200), ifnull(200,100);
select nullif(100,200), nullif(200,100);

/* 
case values:
           when value1 then result1
	       when value2 then result2
		   ...
           else...
*/

select case 10
            when 1 then "일"
            when 2 then "이"
            when 10 then "십"
            else "모름"
			end;
            
select 
     elt(2,"하나","둘","셋"),
     field("둘","하나","둘","셋"),
     find_in_set("둘","하나,둘,셋"),
     instr("하나둘셋","둘"),
     locate("둘","하나둘셋"); 
     
/*
elt(): 위치 번째의 문자열을 반환한다
field(): 찾을 문자열의 위치를 찾아서 반환한다
fine_in_set(): 찾을 문자열을 문자열 리스트에서 찾아서 위치를 반환한다
instr(): 기준 문자열에서 부분 문자열을 찾아서 그 시작 위치를 반환한다
locate(): instr()과 동일하지만, 파라미터의 순서가 반대로 되어있다
*/

select format(123456789,2) as "R1", 
       format(5,3) AS "R2";

-- insert(문자열, 위치, 길이, 대체문자열)
-- 문자열의 위치에서부터 길이만큼 삭제후 대체문자열로 표시
SELECT INSERT("abcdefg",3,4,"@@@@"),
       insert("abdcdfd", 3,2,"@@@@");

-- 공백 삭제 --
-- trim(문자열)
select ltrim("     이것이"), rtrim("히니장      ");
select trim("      이것이    ")

-- 문자열 교체 --
-- replace(문자열, 찾고자하는문자열, 교체문자열)

select replace("이것이 mysql이다","이것이","this is") as "replace";


/* math 함수
올림: celing
내림: floor
반올림: round
난수:
-- 난수값 범위정하기--
select rand() :0이상 1이하의 실수를 구한다
select floor(1+ (RAND()*(6-1));

*/

select ceiling(4.7), floor(4.7), round(4.7);

-- 1~6까지의 주사위 숫자 만들기
-- 난수 실수형 => 정수형

select floor(1+rand()*(6-1));

SELECT CAST(RAND() * (6-1)+1 AS SIGNED INTEGER) AS R1,
       FORMAT(RAND()* (6-1)+0) AS R2, -- 소수몇째자리
       CEILING(RAND() * (6-1)+1) AS R4;
       
-- 날짜 시간함수
-- 현재 날짜, 날짜와 시간, 날짜, 시간표시
-- SELECT NOW(), CURDATE(), CURTIME()

SELECT NOW(); -- 2019-07-16 15:50:21
SELECT curdate(); -- 2019-07-16
SELECT CURTIME(); -- 15:50:21

-- 년도, 월, 일 따로 출력
-- year(curdate()), day(curdate())

select year(curdate()) as"년도",
       day(curdate()) as "날짜1",
       dayname(curdate()) as "날짜2",
	   month((curdate())) as "월1",
	   monthname(curdate()) as "월2";

select hour(curtime()) as "시",
       minute(curtime()) as "분",
	   second(curtime()) as "초";



create table bbsTBL(num INT AUTO_INCREMENT PRIMARY KEY NOT NULL,  
					userID CHAR(10) NOT NULL,
					regDate DATETIME,
					title VARCHAR(30) NOT NULL,
                    contents TEXT NOT NULL );


SELECT * FROM bbsTBL ;
                    
DESC bbsTBL;
INSERT INTO bbsTBL VALUES
             (1,"봉봉", now(),"알라딘","아직모름"),
             (2,"김수현",now(),"기생충","아직모름"),
             (3,"우도환",now(),"사자","아직모름"),
             (4,"배수지",now(),"베가본드","아직모름"),
             (5,"임수정",now(),"검블유","아직모름");
             


SELECT *FROM bbsTBL ;             

-- char(10) : 글자가 2글자이더라도 무조건 10글자의 공간을 차지하지만, varchar(10)은 가변적이라 글자가 2글자이면 공간 2를 차지한다


-- 퀴즈풀기
-- DB 폴더에서 SQL_QUIZ1 다운, SQL_QUIZ1.SQL 다운로드
-- mySQL 폴더에서 다운로드 받은 파일 열기
-- db변경 후 풀기
-- use employee;

