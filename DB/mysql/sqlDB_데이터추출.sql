-- sqlDB.sql

-- STEP1:DB를만들자

drop database if EXISTS sqlDB;
CREATE DATABASE sqlDB;

-- STEP2 : TABLE을 만들자buytbl

USE sqlDB;
CREATE TABLE userTbl -- 회원테이블
( userID     CHAR(8) NOT NULL PRIMARY KEY, -- 사용자아이디(PK)
  name       VARCHAR(10) NOT NULL, -- 이름
  birthYear  INT NOT NULL, -- 출생년도
  addr       char(2) not null, -- 지역: 경기,서울 등등
  mobile1    char(3), -- 010,070,011 등등
  mobile2    char(8), -- 휴대폰 나머지번호
  height     SMALLINT, -- 키
  mDate      DATE -- 회원가입일
  );
  
  -- 테이블 구조 확인
  DESC userTbl;
 
create table buyTbl
( num       INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- 순번(PK)
  userID    CHAR(8) NOT NULL, -- 아이디(FK)
  prodName  CHAR(6) NOT NULL, -- 물품명()
  groupName CHAR(4), -- 분류
  price     INT NOT NULL, -- 단가
  amount    SMALLINT NOT NULL, -- 수량
FOREIGN KEY(userID) REFERENCES userTbl(userId)
);
  
  
INSERT INTO userTbl VALUES("LSG", "이승기",1987, "서울", "011","111111",182,"2008-8-8");
INSERT INTO userTbl VALUES("KBS", "김범수",1979, "경남", "011","222222",173,"2012-4-4");
INSERT INTO userTbl VALUES("KKG", "김경호",1971, "전남", "019","333333",177,"2007-7-7");
INSERT INTO userTbl VALUES("JYP", "조용필",1950, "경기", "011","444444",166,"2009-4-4");
INSERT INTO userTbl VALUES("SSK", "성시경",1979, "서울", NULL,NULL,186,"2013-12-12");
INSERT INTO userTbl VALUES("LJB", "임재범",1963, "서울", "016","666666",182,"2009-9-9");
INSERT INTO userTbl VALUES("YJS", "윤종신",1969, "경남", NULL,NULL,170,"2005-5-5");
INSERT INTO userTbl VALUES("EJW", "은지원",1972, "경북", "011","888888",172,"2014-3-3");
INSERT INTO userTbl VALUES("JKW", "조관우",1965, "경기", "018","999999",172,"2010-10-10");
INSERT INTO userTbl VALUES("BBK", "바비킴",1973, "서울", "010","000000",176,"2013-5-5");
INSERT INTO buyTbl VALUES(NULL,"KBS","운동화",NULL, 30, 2);
INSERT INTO buyTbl VALUES(NULL,"KBS","노트북","전자", 1000, 1);
INSERT INTO buyTbl VALUES(NULL,"JYP","모니터","전자", 200, 1);
INSERT INTO buyTbl VALUES(NULL,"BBK","모니터","전자", 200, 5);
INSERT INTO buyTbl VALUES(NULL,"KBS","청바지","의류", 50, 3);
INSERT INTO buyTbl VALUES(NULL,"BBK","메모리","전자", 80, 10);
INSERT INTO buyTbl VALUES(NULL,"SSK","책","서적", 15, 5);
INSERT INTO buyTbl VALUES(NULL,"EJW","책","서적", 15, 2);
INSERT INTO buyTbl VALUES(NULL,"EJW","청바지","의류", 50, 1);
INSERT INTO buyTbl VALUES(NULL,"BBK","운동화",NULL, 30, 2);
INSERT INTO buyTbl VALUES(NULL,"EJW","책","서적", 15, 1);
INSERT INTO buyTbl VALUES(NULL,"BBK","운동화",NULL, 30, 2);


SELECT *FROM userTbl;
select *from buyTbl;


-- where 절로 조건에 맞는 레코드 출력
-- select 칼럼명1, 칼럼명2, -- 또는 *from 테이블명 where 조건절
-- where 조건절 : 비교연산자, 논리연산자(and, or, not)

select name, addr, userID FROM userTbl WHERE name= "이승기";
SELECT *FROM userTbl where birthYear >= 1970 and height >= 182;

select userID, NAME FROM userTbl where birthYear >=1970 OR height >=182;
select userID, height FROM userTbl WHERE NOT height>=182;


-- 범위를 지정할때 사용되는 where 칼럼명 between IN
-- where 칼럼명 between 값1 in 값2

SELECT *from userTbl where height BETWEEN 175 and 183;

-- 비연속적인 조건
-- 특정값 연속
-- where 칼럼명 in (값1, 값2,...)

-- SELECT *from userTbl where addr = "서울" or  addr="경남" ; 아래랑 같은말
SELECT *FROM userTbl WHERE addr IN("서울","경남")

-- 특정 글자가 포함되어 있느냐? "%"
-- 글자수는 언더바(_)로 표시한다;--
-- WHERE 칼럼명 LIKE "김%"

SELECT * FROM userTbl where name LIKE "김%"; -- 글자수와 상관없이 김으로 시작되는 것을 출력
SELECT * FROM userTbl where name LIKE "__기"; -- __기로 끝나는 것 출력
SELECT * FROM userTbl where name LIKE "_기"; -- _(1)이기에 두글자로 이루어져있으며, 기로 끝나는 NAME을 출력


-- 레코드 정렬
-- SELECT 문 ORDER BY 칼럼명;
-- SELECT 문 ORDER BY 칼럼명 DESC;

SELECT * FROM userTbl ORDER BY name; -- 가나다순
select * from userTbl order by name DESC; -- 가나다역순

-- 가끔 LIMIT와 함께 쓸때( LIMIT는 가장 마지막)

SELECT * FROM userTbl ORDER BY name DESC LIMIT 5;


-- SELECT *FROM userTbl ORDER BY name where height>170; -- 에러남 밑에것이 참
SELECT *FROM userTbl where height>170 ORDER BY name;

-- select -- from --where 절 order by -- limit --;


-- select .. from userTbl where height>170;
--       ( select .. from where 조건절2 )
-- 주의사항 : 서브쿼리의 레코드 결과값은 1개로 유일해야한다


-- 퀴즈
-- 김경호 보다 키가 크거나 같은 사람의 이름과 키를 출력하라
-- 가장먼저 김경호의 키를 알아야 한다
-- but, 김경호의 키를 모를때는 subquery로 쓴다

select * from userTbl where height > ?;

--  김경호의 키를 알 수 있는 쿼리
--  김경호의 키를 알 수 있는 쿼리문 제작 - step1
select height from userTbl where name="김경호";

-- step 2 : 쿼리 안의 서브 쿼리를 같이 작성

select * from userTbl where height > (select height from userTbl where name="김경호");

-- 서브쿼리가 에러가 나는 경우


SELECT * from userTbl 
          where height> (select height userTbl where addr="서울");
--
SELECT * from userTbl 
          where height> any(select height userTbl where addr="서울");          
          
		
-- 중복제거 :레코드의 중복 제거
-- 컬럼명에서 중복제거한 후 표시
-- select distinct 칼럼명 from tablename

select DISTINCT addr from userTbl; -- 해당컬럼만 보여준다
select distinct mobile1 from userTbl;

select * from buyTbl where userID= "KBS";


select * from buyTbl where userID= "KBS";
SELECT *FROM buyTbl where groupName is NULL;
SELECT * FROM buyTbl where amount>5;

SELECT * FROM buyTbl where prodName= "청바지" or prodName=" 운동화";
-- select * from buyTbl where pordName = "청바지 " or "운동화"

select *from buyTbl where name LIKE = "K%";

-- 6) buyTbl 테이블에서 prodName이 ??화로 끝나는 레코드 출력하기

SELECT * FROM buyTbl where name LIKE prodName = "__화";

-- 7) buyTbl 테이블에서 수량이 50이상 항목 중 분류가 전자인 레코드 출력하기

SELECT * FROM buytbl WHERE groupName ="전자" AND amount>50;